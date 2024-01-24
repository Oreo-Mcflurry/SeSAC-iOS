//
//  DateViewController.swift
//  SeSAC 2
//
//  Created by A_Mcflurry on 12/28/23.
//

import UIKit

class DateViewController: UIViewController {

	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		designedButton(button1, button2, button3)
	}

	@IBAction func isFirstButtonPressed(_ sender: UIButton) {
		button1.setTitleColor(.white, for: .normal)
		button1.backgroundColor = .black
		button1.layer.borderColor = UIColor.black.cgColor
		button1.layer.borderWidth = 1

		button2.setTitleColor(.black, for: .normal)
		button2.backgroundColor = .white
		button2.layer.borderColor = UIColor.white.cgColor
		button2.layer.borderWidth = 1
	}
	@IBAction func isSecondButtonPressed(_ sender: UIButton) {
		button2.setTitleColor(.white, for: .normal)
		button2.backgroundColor = .black
		button2.layer.borderColor = UIColor.black.cgColor
		button2.layer.borderWidth = 1

		button1.setTitleColor(.black, for: .normal)
		button1.backgroundColor = .white
		button1.layer.borderColor = UIColor.white.cgColor
		button1.layer.borderWidth = 1
	}
	@IBAction func isThirdButtonPressed(_ sender: UIButton) {
	}

	func designedButton(_ bts: UIButton...) {
		for bt in bts {
			bt.setTitleColor(.white, for: .normal)
			bt.backgroundColor = .black
			bt.layer.cornerRadius = 10
		}
	}
}
