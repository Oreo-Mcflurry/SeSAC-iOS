//
//  PapagoViewController.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit
import Alamofire

// 그렇게 마음에 드는 코드들은 아닌데,,,,, 일단 다음거 하겠습니다

enum PushType: Int, CaseIterable {
	case push
	case present
}

class PapagoViewController: UIViewController {

	var selectLang: (inputLang: LanguageCode, outputLang: LanguageCode) = (.ko, .en) {
		didSet {
			selectLangButton[PushType.push.rawValue].setTitle(PapagoViewController.languageDictionary[LanguageCode(rawValue: selectLang.inputLang.rawValue)!], for: .normal)
			selectLangButton[PushType.present.rawValue].setTitle(PapagoViewController.languageDictionary[LanguageCode(rawValue: selectLang.outputLang.rawValue)!], for: .normal)
			UserDefaults.standard.setValue("UserDefaults", forKey: "123")
		}
	}

	@IBOutlet var selectLangButton: [UIButton]!
	@IBOutlet weak var swapLangButton: UIButton!

	@IBOutlet weak var inputTextView: UITextView!
	@IBOutlet weak var getResultButton: UIButton!
	@IBOutlet weak var outputResultText: UILabel!
	let ud = UserDefaults.standard

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		setDelegateTextView()
		setSwapButton()
		setTransButton()
		setSelectLangButton()
	}

//	override func viewWillAppear(_ animated: Bool) {
//		let typeAllCase = PushType.allCases
//		for (index, item) in selectLangButton.enumerated() {
//			item.setTitle("\(typeAllCase[index].rawValue)", for: .normal)
//		}
//	}


	@IBAction func endEditing(_ sender: Any) {
		view.endEditing(true)
	}
}

extension PapagoViewController {
	func configureView() {
		swapLangButton.setTitle("", for: .normal)
		swapLangButton.setImage(UIImage(systemName: "rectangle.2.swap"), for: .normal)
		swapLangButton.tintColor = .black

		selectLangButton[PushType.push.rawValue].setTitle(PapagoViewController.languageDictionary[LanguageCode(rawValue: selectLang.inputLang.rawValue)!], for: .normal)
		selectLangButton[PushType.push.rawValue].tintColor = .black

		selectLangButton[PushType.present.rawValue].setTitle(PapagoViewController.languageDictionary[LanguageCode(rawValue: selectLang.outputLang.rawValue)!], for: .normal)
		selectLangButton[PushType.present.rawValue].tintColor = .black

		getResultButton.setTitle("번역하기!", for: .normal)
		getResultButton.tintColor = .black

		outputResultText.numberOfLines = 0
	}

	func setSwapButton() {
		swapLangButton.addTarget(self, action: #selector(swapingLang), for: .touchUpInside)
	}

	@objc func swapingLang() {
		let temp = selectLang.inputLang
		selectLang.inputLang = selectLang.outputLang
		selectLang.outputLang = temp
	}

	func setTransButton() {
		getResultButton.addTarget(self, action: #selector(requestPapago), for: .touchUpInside)
	}

	@objc func requestPapago() {
		let url = "https://openapi.naver.com/v1/papago/n2mt"
		let header: HTTPHeaders = [
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
			"X-Naver-Client-Id": APIKeys.naverClient.rawValue,
			"X-Naver-Client-Secret": APIKeys.naverSecreat.rawValue
		]

		let parameters: Parameters = [
			"text": inputTextView.text!,
			"source": selectLang.inputLang.rawValue,
			"target": selectLang.outputLang.rawValue
		  ]
		AF.request(url, method: .post,parameters: parameters, headers: header).responseDecodable(of: PapagoModel.self) { response in
			switch response.result {
			case .success(let success):
				self.outputResultText.text = success.message.result.translatedText
			case .failure(let fail):
				print(fail)
				self.outputResultText.text = "실패한듯"
			}
		}
	}

	func setSelectLangButton() {
		for (index, item) in selectLangButton.enumerated() {
			item.tag = index
			item.addTarget(self, action: #selector(navigateSelectLangView), for: .touchUpInside)
		}
	}

	@objc func navigateSelectLangView(sender: UIButton) {
		let vc = storyboard?.instantiateViewController(identifier: SelectLanguageViewController.identifier) as! SelectLanguageViewController
		vc.senderTag = sender.tag
		vc.selectLang = sender.tag == PushType.push.rawValue ? self.selectLang.inputLang : self.selectLang.outputLang
		vc.complitionHandeler = { item in
			if sender.tag == PushType.push.rawValue {
				self.selectLang.inputLang = item
			} else {
				self.selectLang.outputLang = item
			}
		}
//		let doNav: Void?
		switch sender.tag {
		case 0: navigationController?.pushViewController(vc, animated: true)
		case 1 : 
			let nav = UINavigationController(rootViewController: vc)
			nav.modalPresentationStyle = .fullScreen
			present(nav, animated: true)
		default: print("123")
		}
//		doNav
	}
}

extension PapagoViewController: UITextViewDelegate {
	static let placeholder = "번역할 내용을 입력해주세요"
	func textViewDidEndEditing(_ textView: UITextView) {
		if inputTextView.text!.isEmpty {
			inputTextView.text = PapagoViewController.placeholder
			inputTextView.textColor = .gray
		}
	}

	func textViewDidBeginEditing(_ textView: UITextView) {
		if inputTextView.text == PapagoViewController.placeholder && inputTextView.textColor == .gray {
			inputTextView.text = ""
			inputTextView.textColor = .black
		}
	}

	func setDelegateTextView() {
		inputTextView.text = PapagoViewController.placeholder
		inputTextView.textColor = .gray
		inputTextView.delegate = self
	}
}

//class SelectedLanguage {
//	static let shared = SelectedLanguage()
//	var selectLang: (inputLang: LanguageCode, outputLang: LanguageCode) = (.ko, .en)
//}
