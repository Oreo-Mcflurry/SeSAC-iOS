//
//  ViewController.swift
//  SeSAC Daily 7
//
//  Created by A_Mcflurry on 1/3/24.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var topLabel: UILabel!
	@IBOutlet var tallTextField: UITextField!
	@IBOutlet var weightTextField: UITextField!
	@IBOutlet var resultButton: UIButton!

	let values: [(min: Int, max: Int)] = [
		(30, 130),
		(70, 200)
	]
	override func viewDidLoad() {
		super.viewDidLoad()
		topLabel.text = "당신의 BMI 지수를\n알려드릴게요"
		designTextField()
		resultButton.isEnabled = false
		resultButton.backgroundColor = .gray
	}

	private func designTextField() {
		for tf in [tallTextField, weightTextField] {
			tf?.borderStyle = .roundedRect
			tf?.clipsToBounds = true
			tf?.layer.cornerRadius = 10
			tf?.keyboardType = .numberPad
			tf?.layer.borderColor = UIColor.gray.cgColor
			tf?.layer.borderWidth = 2
		}
	}

	@IBAction func randomBMI(_ sender: UIButton) {
		weightTextField.text = String(Int.random(in: values[0].min...values[0].max))
		tallTextField.text = String(Int.random(in: values[1].min...values[1].max))
		resultButton.isEnabled = true
		resultButton.backgroundColor = .purple
	}
	
	@IBAction func changeValueTextField(_ sender: UITextField) {
		if sender.text!.count > 3 {
			sender.text?.removeLast()
		}

		if Int(sender.text!) == nil {
			sender.text?.removeAll()
		}

		if checkInable() {
			resultButton.isEnabled = true
			resultButton.backgroundColor = .purple
		} else {
			resultButton.isEnabled = false
			resultButton.backgroundColor = .gray
		}

//		let max = sender == tallTextField ? values[1].max : values[0].max
//		let min = sender == tallTextField ? values[1].min: values[0].min

//		if Int(sender.text!) ?? 0 < min || Int(sender.text!) ?? 0 > max {
//			resultButton.isEnabled = false
//			resultButton.backgroundColor = .gray
//		} else {
//			resultButton.isEnabled = true
//			resultButton.backgroundColor = .purple
//		}
	}
	
	@IBAction func getResult(_ sender: UIButton) {
		// ?? 0 안하고 강제 언래핑 해도 될것 같긴 한데, 생각하지 못한게 있을까봐 무섭네요
		let weight = Float(weightTextField.text!) ?? 0
		let tall = (Float(tallTextField.text!) ?? 0) / 100
		let bmi = weight / (tall * tall)
		
		let message: String
		switch bmi {
		case ..<18.5: message = "저체중"
		case 18.5..<23: message = "정상체중"
		case 23..<25: message = "과체중"
		case 25...: message = "비만"
		default: message = "측정 불가"
		}
		let alert =	UIAlertController(title: "BMI 계산 결과", message: "당신의 bmi는 \(String(format: "%.2f", bmi))입니다.\n\(message)입니다", preferredStyle: .alert)
		let button1 = UIAlertAction(title: "확인", style: .default)
		alert.addAction(button1)
		present(alert, animated: true)
	}

	private func checkInable() -> Bool {
		if Int(tallTextField.text!) ?? 0 < values[1].min || Int(tallTextField.text!) ?? 0 > values[1].max {
			return false
		}

		if Int(weightTextField.text!) ?? 0 < values[0].min || Int(weightTextField.text!) ?? 0 > values[0].max {
			return false
		}
		return true
	}
}

