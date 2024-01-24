//
//  SecondViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/27/23.
//

import UIKit

class SecondViewController: UIViewController {
	let radius: CGFloat = 10
	var selected: Int = 0

	@IBOutlet var blueButton: UIButton!
	@IBOutlet var greenButton: UIButton!
	@IBOutlet var pinkButton: UIButton!

	@IBOutlet var firstLabel: UILabel!
	@IBOutlet var secondLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		blueButton.layer.cornerRadius = radius
		greenButton.layer.cornerRadius = radius
		pinkButton.layer.cornerRadius = radius
		blueButton.backgroundColor = .white
		blueButton.tintColor = .black
	}

	// 버튼과 Action을 1:1로 매칭하지 않고 1:3으로 매칭, function에 sender를 파라미터로 보내 function 2개로 기능을 구현하였습니다.
	// 추후 리팩토링할점은 [pinkButton, blueButton, greenButton] 이부분인것 같은데, 버튼이 늘어날걸 전혀 고려하고 있지 않기에, 더 좋은 코드를 짤 여지가 있어보입니다.
	@IBAction func isButtonPressed(_ sender: UIButton) {
		let text = sender == blueButton ? "이런! 찾으시는 작품이 없습니다." : sender == greenButton ? "이런은? Run Run" : "Top 10이 너무커서 짤렸네요!"
		selectButton(sender, text)
	}

	private func selectButton(_ sender: UIButton, _ text: String) {
		for button in [pinkButton, blueButton, greenButton] {
			if sender == button {
				button?.backgroundColor = .white
				button?.tintColor = .black
			} else {
				button?.backgroundColor = .black
				button?.tintColor = .white
			}
		}
		firstLabel.text = text
	}

	/*
	 변경전 기존 코드
	 @IBAction func isBlueButtonPressed(_ sender: UIButton) {
		 blueButton.backgroundColor = .white
		 pinkButton.backgroundColor = .black
		 greenButton.backgroundColor = .black

		 blueButton.tintColor = .black
		 pinkButton.tintColor = .white
		 greenButton.tintColor = .white

		 firstLabel.text = "이런! 찾으시는 작품이 없습니다."
	 }

	 @IBAction func isGreenButtonPressed(_ sender: UIButton) {
		 greenButton.backgroundColor = .white
		 blueButton.backgroundColor = .black
		 pinkButton.backgroundColor = .black

		 greenButton.tintColor = .black
		 blueButton.tintColor = .white
		 pinkButton.tintColor = .white

		 firstLabel.text = "이런은? Run Run"
	 }

	 @IBAction func isPinkButtonPressed(_ sender: UIButton) {
		 pinkButton.backgroundColor = .white
		 blueButton.backgroundColor = .black
		 greenButton.backgroundColor = .black

		 pinkButton.tintColor = .black
		 blueButton.tintColor = .white
		 greenButton.tintColor = .white

		 firstLabel.text = "Top 10이 너무커서 짤렸네요!"
	 }
	 */
}
