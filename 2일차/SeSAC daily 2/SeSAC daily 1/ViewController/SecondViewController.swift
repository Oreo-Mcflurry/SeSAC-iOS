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
}
