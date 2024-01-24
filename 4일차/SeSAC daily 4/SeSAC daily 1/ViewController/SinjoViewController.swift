//
//  SinjoViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/29/23.
//

import UIKit

class SinjoViewController: UIViewController {
	let sinjoMadeByGPT = [
		["까비", "외모나 상태가 좋지 않은 것을 가리킴."],
		["존잘", "매우 잘생겼다는 뜻."],
		["허니잼", "귀엽거나 재미있는 상황이나 모습을 가리킴."],
		["뽀롱뽀롱", "매력적이고 사랑스러운 모습을 나타냄."],
		["뚝딱이", "빨리 처리되거나 끝나는 모습을 나타냄."],
		["페북", "페이스북의 줄임말로, 소셜 미디어 플랫폼을 가리킴."],
		["꿀잼", "매우 재미있다는 뜻"],
		["멘붕", "정신적으로 힘들어져 멘탈이 붕괴된 상태를 나타냄"],
		["존맛", "매우 맛있다는 뜻"],
		["빡세다", "어려운, 힘든, 혹은 고된 상태를 나타냄."]
	]
	@IBOutlet var searchTextField: UITextField!
	@IBOutlet var searchButton: UIButton!
	@IBOutlet var recommand1: UIButton!
	@IBOutlet var recommand2: UIButton!
	@IBOutlet var recommand3: UIButton!
	@IBOutlet var recommand4: UIButton!
	@IBOutlet var backgroundImage: UIImageView!
	@IBOutlet var outputLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		getRandomSinjo(recommand1, recommand2, recommand3, recommand4)
		designSinjoButton(recommand1, recommand2, recommand3, recommand4)
		searchButton.tintColor = .white
		searchButton.backgroundColor = .black
		searchTextField.layer.borderColor = UIColor.black.cgColor
		searchTextField.layer.borderWidth = 1
		outputLabel.text = ""
		backgroundImage.image = .wordLogo
		backgroundImage.contentMode = .scaleAspectFill
		outputLabel.numberOfLines = 2
    }
	
	// 중복 제거
	private func getRandomSinjo(_ buttons: UIButton...) {
		let random = sinjoMadeByGPT.shuffled().prefix(4)
		var index = 0
		for bt in buttons {
			bt.setTitle(random[index][0], for: .normal)
			index += 1
		}
	}

//	@IBAction func searchSinjo(_ sender: UIButton) {
//		backgroundImage.image = .background
//		let text = sinjoMadeByGPT[searchTextField.text!] ?? ""
//		outputLabel.text = text.isEmpty ? "그런건 없습니다" : text
//
//	}

	// Sender를 Any로 설정해서 TextField와 버튼에 연결
	// 기존 딕셔너리에서 2차원 배열로 변경, 대소문자 구분 x
	@IBAction func searchSinjo(_ sender: Any) {
		backgroundImage.image = .background
		for item in sinjoMadeByGPT {
			if item[0].uppercased() == searchTextField.text?.uppercased() {
				outputLabel.text = item[1]
				return
			}
		}
		outputLabel.text = "그런건 없습니다"
	}
	
	private func designSinjoButton(_ buttons: UIButton...) {
		for bt in buttons {
			bt.setTitleColor(.black, for: .normal)
			bt.layer.borderColor = UIColor.black.cgColor
			bt.layer.borderWidth = 1
			bt.layer.cornerRadius = 10
			let image: UIImage = .turquoise.withRenderingMode(.alwaysOriginal)
			bt.setImage(image, for: .normal)
			bt.configuration?.imagePadding = 5
		}
	}
	@IBAction func ImageViewTap(_ sender: UITapGestureRecognizer) {
		print(sender)
	}
	
	@IBAction func isRecommandButtonPressed(_ sender: UIButton) {
		searchTextField.text = sender.currentTitle
	}
	
	@IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
		view.endEditing(true)
	}
}
