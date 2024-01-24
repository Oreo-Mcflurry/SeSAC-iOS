//
//  ViewController.swift
//  SeSAC daily 6
//
//  Created by A_Mcflurry on 1/2/24.
//

import UIKit

class EmotionViewController: UIViewController {
	@IBOutlet var emotionLabel: [UILabel]!

	var emotions = [0,0,0,0,0,0,0,0,0]

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.leftBarButtonItem?.image = UIImage(systemName: "list.bullet")
		self.view.backgroundColor = UIColor(patternImage: .back)
		emotions = UserDefaults.standard.array(forKey: "emotions") as? [Int] ?? [0,0,0,0,0,0,0,0,0]
		designLabel()
	}

	@IBAction func pressButton(_ sender: UIButton) {
//		let char = emotionLabel[sender.tag].text?.filter { $0.isLetter } ?? ""
//		let number = Int(emotionLabel[sender.tag].text?.filter { $0.isNumber } ?? "") ?? 0
//
//		emotionLabel[sender.tag].text = "\(char) \(number+1)"

//		for index in 0..<emotionLabel.count {
//			if emotionLabel[index] == sender {
//				emotions[index] += 1
//				break
//			}
//		}
		emotions[sender.tag] += 1
		UserDefaults.standard.setValue(emotions, forKey: "emotions")
		designLabel()

	}
	@IBAction func tabGesture(_ sender: Any) {
		view.endEditing(true)
	}
	
	private func designLabel() {
		let texts = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "실망해", "미안해"]
		var index = 0
		for lb in emotionLabel {
			lb.text = "\(texts[index]) \(emotions[index])"
			lb.textAlignment = .center
			index += 1
		}
	}
}

