//
//  ViewController.swift
//  SeSAC 2
//
//  Created by A_Mcflurry on 12/28/23.
//

import UIKit

class ViewController: UIViewController {
	let arr = ["고래밥", "칙촉", "포도알맹이", "빅파이"]

	@IBOutlet var switchTest: UISwitch!
	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var phoneTextField: UITextField!
	@IBOutlet var resultLabel: UILabel!
	@IBOutlet var checkButton: UIButton!

	@IBOutlet var recommandButton1: UIButton!
	@IBOutlet var recommandButton2: UIButton!

	@IBOutlet var backView: UIView!
	override func viewDidLoad() {
		super.viewDidLoad()
		textFieldDesigned(phoneTextField, textFieldPlaceholder: "연락처")
		textFieldDesigned(nameTextField, textFieldPlaceholder: "닉네임")
		recommandButton1.setTitle(arr.randomElement(), for: .normal)
		recommandButton2.setTitle(arr.randomElement(), for: .normal)
	}

	// textFieldPlaceholder는 외부 매개변수
	// tf, str 내부 매개변수
	// 연락처, 닉네임 전달인자
	// 외부 매개변수를 사용하고 싶지 않다면 _ 와일드카드 식별자 사용
	func textFieldDesigned(_ tf: UITextField, textFieldPlaceholder str: String){
		tf.placeholder = "\(str)를 입력해주세요"
		tf.borderStyle = .bezel
		tf.keyboardType = .default
		tf.textColor = .black
		tf.font = .systemFont(ofSize: 16)
		tf.textAlignment = .center
	}

	@IBAction func isLoginButtonPressed(_ sender: UIButton) {
		resultLabel.text = nameTextField.text!.isEmpty ? "왜 입력 안함" : nameTextField.text!.contains("바보") ? "이 닉네임 안됩니다." : "어떻게 \(nameTextField.text!)이(가) 닉네임이냐 ㅋㅋ"
	}

	@IBAction func recommand1(_ sender: UIButton) {
		nameTextField.text = sender.title(for: .normal)
	}
	@IBAction func tapView(_ sender: UITapGestureRecognizer) {
		view.endEditing(true)
	}
	@IBAction func switchAction(_ sender: Any) {
		recommandButton1.isHidden.toggle()
		recommandButton2.isHidden.toggle()
	}
}

