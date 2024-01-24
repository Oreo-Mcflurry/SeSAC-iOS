//
//  FirstViewViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/27/23.
//

import UIKit

class FirstViewViewController: UIViewController {
	let radius: CGFloat = 10
	let images = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]

	// 유킷은 컴포넌트 어케 만들어요 흑흑....
	@IBOutlet var mainImage: UIImageView!
	@IBOutlet var firstImage: UIImageView!
	@IBOutlet var secondImage: UIImageView!
	@IBOutlet var thirdImage: UIImageView!

	@IBOutlet var firstLogo: UIImageView!
	@IBOutlet var secondLogo: UIImageView!
	@IBOutlet var thirdLogo: UIImageView!

	@IBOutlet var firstTop10: UIImageView!
	@IBOutlet var secondTop10: UIImageView!
	@IBOutlet var thirdTop10: UIImageView!
	
	@IBOutlet var firstAd1: UILabel!
	@IBOutlet var firstAd2: UILabel!
	@IBOutlet var firstAd3: UILabel!
	
	@IBOutlet var secondAd1: UILabel!
	@IBOutlet var secondAd2: UILabel!
	@IBOutlet var secondAd3: UILabel!

	@IBOutlet var thirdAd1: UILabel!
	@IBOutlet var thirdAd2: UILabel!
	@IBOutlet var thirdAd3: UILabel!
	


	@IBOutlet var playButton: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		mainImage.layer.cornerRadius = radius
		firstImage.layer.cornerRadius = radius
		secondImage.layer.cornerRadius = radius
		thirdImage.layer.cornerRadius = radius

		mainImage.layer.borderWidth = 1
		firstImage.layer.borderWidth = 1
		secondImage.layer.borderWidth = 1
		thirdImage.layer.borderWidth = 1

		mainImage.layer.borderColor = UIColor.red.cgColor
		firstImage.layer.borderColor = UIColor.red.cgColor
		secondImage.layer.borderColor = UIColor.red.cgColor
		thirdImage.layer.borderColor = UIColor.red.cgColor
	}

	@IBAction func isPlayButtonPressed(_ sender: UIButton) {
		mainImage.image = UIImage(named: images.randomElement() ?? "오펜하이머")
		firstImage.image = UIImage(named: images.randomElement() ?? "노량")
		secondImage.image = UIImage(named: images.randomElement() ?? "더퍼스트슬램덩크")
		thirdImage.image = UIImage(named: images.randomElement() ?? "범죄도시3")
		
		firstLogo.isHidden = randomBool()
		secondLogo.isHidden = randomBool()
		thirdLogo.isHidden = randomBool()

		firstTop10.isHidden = randomBool()
		secondTop10.isHidden = randomBool()
		thirdTop10.isHidden = randomBool()

		firstAd1.isHidden = randomBool()
		firstAd2.isHidden = randomBool()
		firstAd3.isHidden = randomBool()

		secondAd1.isHidden = randomBool()
		secondAd2.isHidden = randomBool()
		secondAd3.isHidden = randomBool()

		thirdAd1.isHidden = randomBool()
		thirdAd2.isHidden = randomBool()
		thirdAd3.isHidden = randomBool()

	}

	private func randomBool() -> Bool {
		return Bool.random()
	}

}
