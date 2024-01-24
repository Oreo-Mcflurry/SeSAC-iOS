//
//  PracticeViewController.swift
//  SeSAC Daily 7
//
//  Created by A_Mcflurry on 1/4/24.
//

import UIKit

class PracticeViewController: UIViewController {

	@IBOutlet var practiceButton: UIButton!
	@IBOutlet var anotherButton: UIButton!
	@IBOutlet var pinchGesture: UIPinchGestureRecognizer!
	override func viewDidLoad() {
		super.viewDidLoad()
		practiceButton.addTarget(self, action: #selector(printTest(sender:)), for: .touchUpInside)
//		practiceButton.t
//		practiceButton.addTarget(self, action: printString(str:), for: .touchUpInside)
//		pinchGesture.addTarget(self, action: #selector(gestureTest(sender:)))
//		pinchGesture.text
	}

	@objc func printTest(sender: UIButton) {
		print("Test")
		sender.setTitle("얘가 얘인지 어케앎?", for: .normal)
	}

	@objc func printString(str: NSString) {
		print(str)
	}

	@objc func gestureTest(sender: UIPinchGestureRecognizer) {
		print("123")
	}
}
