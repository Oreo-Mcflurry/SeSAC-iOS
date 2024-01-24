//
//  SinjoViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/29/23.
//

import UIKit

class SinjoViewController: UIViewController {
	let sinjoMadeByGPT = [
		 "까비": "외모나 상태가 좋지 않은 것을 가리킴.",
		 "존잘": "매우 잘생겼다는 뜻.",
		 "허니잼": "귀엽거나 재미있는 상황이나 모습을 가리킴.",
		 "뽀롱뽀롱": "매력적이고 사랑스러운 모습을 나타냄.",
		 "뚝딱이": "빨리 처리되거나 끝나는 모습을 나타냄.",
		 "페북": "페이스북의 줄임말로, 소셜 미디어 플랫폼을 가리킴.",
		 "꿀잼": "매우 재미있다는 뜻",
		 "멘붕": "정신적으로 힘들어져 멘탈이 붕괴된 상태를 나타냄",
		 "존맛": "매우 맛있다는 뜻",
		 "빡세다": "어려운, 힘든, 혹은 고된 상태를 나타냄."
	]
	@IBOutlet var searchTextField: UITextField!
	@IBOutlet var searchButton: UIButton!
	@IBOutlet var recommand1: UIButton!
	@IBOutlet var recommand2: UIButton!
	@IBOutlet var recommand3: UIButton!
	@IBOutlet var recommand4: UIButton!
	@IBOutlet var backgroundImage: UIImageView!
	@IBOutlet var outputLabel: UILabel!

	@IBOutlet var ImageView: UIImageView!
	@IBOutlet var testLabel: UILabel!
	@IBOutlet var test2Label: UILabel!
	
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

		ImageView.isUserInteractionEnabled = true

//		testLabel.clipsToBounds = true
		testLabel.layer.cornerRadius = 20
		testLabel.layer.shadowColor = UIColor.red.cgColor
		testLabel.layer.shadowOpacity = 0.5
		testLabel.layer.shadowRadius = 10
		testLabel.layer.shadowOffset = .zero

		let system = UIImage(systemName: "star.fill")
    }
	
	private func getRandomSinjo(_ buttons: UIButton...) {
		for bt in buttons {
			bt.setTitle(sinjoMadeByGPT.randomElement()!.0, for: .normal)
		}
	}

//	@IBAction func searchSinjo(_ sender: UIButton) {
//		backgroundImage.image = .background
//		let text = sinjoMadeByGPT[searchTextField.text!] ?? ""
//		outputLabel.text = text.isEmpty ? "그런건 없습니다" : text
//
//	}

	// Sender를 Any로 설정해서 TextField와 버튼에 연결
	@IBAction func searchSinjo(_ sender: Any) {
		backgroundImage.image = .background
		let text = sinjoMadeByGPT[searchTextField.text!] ?? ""
		outputLabel.text = text.isEmpty ? "그런건 없습니다" : text
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
