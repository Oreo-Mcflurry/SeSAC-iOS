//
//  JackflixViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/28/23.
//

import UIKit

class JackflixViewController: UIViewController {
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var nickNameTextField: UITextField!
	@IBOutlet var locationTextField: UITextField!
	@IBOutlet var recommandTextField: UITextField!

	@IBOutlet var jackView: UIView!
	@IBOutlet var orangeSwitch: UISwitch!
	@IBOutlet var completeButton: UIButton!
	@IBOutlet var plusLabel: UILabel!
	@IBOutlet var tabbar: UITabBarItem!
	override func viewDidLoad() {
		emailTextField.placeholder = "이메일 주소 또는 전화번호"
		passwordTextField.placeholder = "비밀번호"
		nickNameTextField.placeholder = "닉네임"
		locationTextField.placeholder = "위치"
		recommandTextField.placeholder = "추천인"

		emailTextField.setPlaceholderColor(.white)
		passwordTextField.setPlaceholderColor(.white)
		nickNameTextField.setPlaceholderColor(.white)
		locationTextField.setPlaceholderColor(.white)
		recommandTextField.setPlaceholderColor(.white)

		emailTextField.backgroundColor = .darkGray
		passwordTextField.backgroundColor = .darkGray
		nickNameTextField.backgroundColor = .darkGray
		locationTextField.backgroundColor = .darkGray
		recommandTextField.backgroundColor = .darkGray

		passwordTextField.isSecureTextEntry = true

		completeButton.backgroundColor = .white

		orangeSwitch.onTintColor = .orange
		orangeSwitch.thumbTintColor = .red

		plusLabel.text = "스위치를 눌러주세요"
		super.viewDidLoad()
	}

	@IBAction func completFunc(_ sender: UIButton) {
		view.endEditing(true)
	}
	
	@IBAction func viewTapGesture(_ sender: Any) {
		view.endEditing(true)
	}

	// if else문에서 삼항연산자로 코드 간결하게 및 toggle로 코드 단축
	@IBAction func isTapSwitch(_ sender: UISwitch) {
		view.backgroundColor = sender.isOn ? .black : .brown
		nickNameTextField.isHidden.toggle()
		locationTextField.isHidden.toggle()
		recommandTextField.isHidden.toggle()
	}

	/*
	 변경전 기존 코드
	 @IBAction func isTapSwitch(_ sender: UISwitch) {
		 if !sender.isOn {
			 view.backgroundColor = .brown
		 } else {
			 view.backgroundColor = .black
		 }
	 }
	 */
}


extension UITextField {
	 func setPlaceholderColor(_ placeholderColor: UIColor) {
		  attributedPlaceholder = NSAttributedString(
				string: placeholder ?? "",
				attributes: [
					 .foregroundColor: placeholderColor,
					 .font: font
				].compactMapValues { $0 }
		  )
	 }

}
