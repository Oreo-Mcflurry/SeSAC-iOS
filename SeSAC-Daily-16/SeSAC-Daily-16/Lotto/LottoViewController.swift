//
//  LottoViewController.swift
//  SeSAC-Daily-16
//
//  Created by A_Mcflurry on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var pickerLabel: UILabel!
	@IBOutlet weak var pickerTextField: UITextField!
	let getLotto = GetLotto()
	let numberList: [Int] = Array(1...1102).reversed()
	override func viewDidLoad() {
		super.viewDidLoad()
		resultLabel.numberOfLines = 0
		pickerLabel.text = "눌러서 회차 검색"
		pickerLabel.textAlignment = .center
		pickerTextField.layer.opacity = 0.03
		configureTextFieldPicker()
	}
	@IBAction func tapBackGround(_ sender: UITapGestureRecognizer) {
		view.endEditing(true)
	}
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return numberList.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		pickerLabel.text = "\(numberList[row])회차"
		return "\(numberList[row])회차"
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		getLotto.getLotto(numberList[row]) { result in
			self.resultLabel.text = result
		}
	}

	func configureTextFieldPicker() {
		let picker = UIPickerView()
		picker.delegate = self
		picker.dataSource = self
		pickerTextField.inputView = picker
	}
}
