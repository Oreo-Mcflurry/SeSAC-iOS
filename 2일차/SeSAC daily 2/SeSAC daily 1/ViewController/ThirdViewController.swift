//
//  ThirdViewController.swift
//  SeSAC daily 1
//
//  Created by A_Mcflurry on 12/27/23.
//

import UIKit

class ThirdViewController: UIViewController {

	@IBOutlet var topLabel: UILabel!
	@IBOutlet var bottomLabel: UILabel!

	@IBOutlet var settingButton: UIButton!
	@IBOutlet var searchButton: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		topLabel.text = "나만의 자동 저장 기능"
		topLabel.font = .systemFont(ofSize: 26)
		topLabel.textColor = .white

		bottomLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
		bottomLabel.font = .systemFont(ofSize: 12)
		bottomLabel.textColor = .lightGray

		settingButton.setTitle("설정하기", for: .normal)
		settingButton.setTitleColor(.white, for: .normal)
		settingButton.backgroundColor = .blue

		searchButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
		searchButton.setTitleColor(.black, for: .normal)
		searchButton.backgroundColor = .white
	}
}
