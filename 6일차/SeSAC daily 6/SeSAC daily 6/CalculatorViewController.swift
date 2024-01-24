//
//  CalculatorViewController.swift
//  SeSAC daily 6
//
//  Created by A_Mcflurry on 1/3/24.
//

import UIKit

class CalculatorViewController: UIViewController {

	@IBOutlet var numberTextField: UITextField!
	@IBOutlet var resultLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func textFieldInput(_ sender: UITextField) {
		if let num = Int(sender.text!) {
			resultLabel.text = "\(num)"
		} else {
			resultLabel.text = "숫자 아님"
		}
//		if sender.text!.filter({ $0.isLetter }) != "" {
//			resultLabel.text = "숫자 아님"
//		} else {
//			resultLabel.text = sender.text
//		}
	}
}
