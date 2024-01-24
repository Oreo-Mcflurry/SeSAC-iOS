//
//  D4FirstViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/30/23.
//

import UIKit

class D4FirstViewController: UIViewController {

	@IBOutlet var backgrond: UIImageView!

	@IBOutlet var closeButton: UIButton!
	@IBOutlet var settingButton: UIButton!
	@IBOutlet var diceButton: UIButton!
	@IBOutlet var giftButton: UIButton!

	@IBOutlet var profileImage: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var messageLabel: UILabel!

	@IBOutlet var profileEditButton: UIButton!
	@IBOutlet var kakaoStoryButton: UIButton!
	@IBOutlet var chatWithMeButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		backgrond.image = ._41F854Bd38A2B
		backgrond.contentMode = .scaleToFill
		makeButton(closeButton, "xmark")
		makeButton(settingButton, "gear.circle")
		makeButton(diceButton, "shippingbox.circle")
		makeButton(giftButton, "gift.circle")
		profileImage.image = .icon
		profileImage.contentMode = .scaleAspectFill
		profileImage.layer.cornerRadius = 30
		nameLabel.text = "유인호"
		nameLabel.textAlignment = .center
		messageLabel.text = "오토레이아웃 공부중입니다"
		messageLabel.textAlignment = .center
		nameLabel.textColor = .black
		messageLabel.textColor = .black
		makeButton(chatWithMeButton, "message.fill", "나와의 채팅")
		makeButton(profileEditButton, "pencil", "프로필 편집")
		makeButton(kakaoStoryButton, "command", "카카오스토리")
	}

	private func makeButton(_ button: UIButton, _ systemName: String) {
		button.setImage(UIImage(systemName: systemName), for: .normal)
		button.setTitle("", for: .normal)
		button.tintColor = .white
	}
	private func makeButton(_ button: UIButton, _ systemName: String, _ text: String) {
		button.setImage(UIImage(systemName: systemName), for: .normal)
		button.setTitle(text, for: .normal)
		button.configuration?.imagePadding = 15
		button.configuration?.imagePlacement = .top
		button.tintColor = .white
	}

}
