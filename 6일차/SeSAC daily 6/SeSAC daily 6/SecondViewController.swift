//
//  SecondViewController.swift
//  SeSAC daily 6
//
//  Created by A_Mcflurry on 1/3/24.
//

import UIKit

class SecondViewController: UIViewController {

	@IBOutlet var emotionButton1: UIButton!
	@IBOutlet var emotionButton2: UIButton!
	@IBOutlet var emotionButton3: UIButton!
	var count = [0,]
	override func viewDidLoad() {
		super.viewDidLoad()

		let nickname: String? = "고래밥"
		let age: Int? = 0
//		guard let nick = nickname else { return }

		// 
		if let nickname, let age {
			print(nickname, age)
		}

	}


}
