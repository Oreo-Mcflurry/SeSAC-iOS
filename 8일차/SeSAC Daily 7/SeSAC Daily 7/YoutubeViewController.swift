//
//  YoutubeViewController.swift
//  SeSAC Daily 7
//
//  Created by A_Mcflurry on 1/5/24.
//

import UIKit

class YoutubeViewController: UIViewController {
	@IBOutlet var logoImage: UIImageView!
	@IBOutlet var firstVideo: UIImageView!
	@IBOutlet var profileImage: UIImageView!
	

	@IBOutlet var searchButton: UIButton!
	@IBOutlet var notificationButton: UIButton!
	@IBOutlet var mirroringButton: UIButton!

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var videoInfo: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		designSymbolButton(searchButton, withSymbol: "magnifyingglass")
		designSymbolButton(notificationButton, withSymbol: "bell")
		designSymbolButton(mirroringButton, withSymbol: "play.tv")

		setImage(firstVideo, withImage: .video)
		setImage(profileImage, withImage: .noting)

		profileImage.layer.cornerRadius = profileImage.frame.width / 2
		profileImage.layer.borderColor = UIColor.black.cgColor

		titleLabel.text = "지금 당장 오토레이아웃을 배워야 하는 이유"
		videoInfo.text = "SeSAC iOS · 조회수 1억회 · 1일전"
		videoInfo.textColor = .lightGray
		videoInfo.font = .systemFont(ofSize: 15)
	}

	private func designSymbolButton(_ button: UIButton, withSymbol symbol: String) {
		button.setTitle("", for: .normal)
		button.setImage(UIImage(systemName: symbol), for: .normal)
		button.tintColor = .black
	}

	private func setImage(_ imageView: UIImageView, withImage: UIImage) {
		imageView.image = withImage
		imageView.contentMode = .scaleAspectFill
	}

}
