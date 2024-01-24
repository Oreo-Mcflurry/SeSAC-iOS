//
//  BeerViewController.swift
//  SeSAC-Daily-16
//
//  Created by A_Mcflurry on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

	let requestBeer = RequestBeer()
	@IBOutlet weak var beerImage: UIImageView!
	@IBOutlet weak var beerName: UILabel!
	@IBOutlet weak var beerDescription: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationButton()
		beerDescription.numberOfLines = 0
	}

	@IBAction func requestRandomBeer(_ sender: Any) {
		requestBeer.requestRandomBeer((sender as AnyObject).tag == 0 ? false : true) { result in
			self.beerImage.kf.setImage(with: URL(string: result.first!.image_url ?? Beer.defaultImage)!)
			self.beerName.text = result.first!.name
			self.beerDescription.text = result.first!.description
		}
	}
}

extension BeerViewController {
	func setNavigationButton() {
		let leftButton = UIBarButtonItem(title: "랜덤맥주 실패하기", style: .plain, target: self, action: #selector(leftButtonTapped))
		navigationItem.leftBarButtonItem = leftButton

		let rightButton = UIBarButtonItem(title: "전체 맥주 보러가기", style: .plain, target: self, action: #selector(rightButtonTapped))
		navigationItem.rightBarButtonItem = rightButton
	}

	@objc func leftButtonTapped(sender: UIBarButtonItem) {
		requestRandomBeer(sender)
	}

	@objc func rightButtonTapped() {
		let vc = storyboard?.instantiateViewController(withIdentifier: AllBearViewController.identifier) as! AllBearViewController

		navigationController?.pushViewController(vc, animated: true)
	}
}
