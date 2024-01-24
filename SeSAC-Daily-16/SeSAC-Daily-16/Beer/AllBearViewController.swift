//
//  AllBearViewController.swift
//  SeSAC-Daily-16
//
//  Created by A_Mcflurry on 1/16/24.
//

import UIKit

class AllBearViewController: UIViewController {

	let requestBeer = RequestBeer()
	var allBeer: [Beer] = []
	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		requestAllBeer()
		setDelegate()
		tableView.rowHeight = UITableView.automaticDimension
	}
}

extension AllBearViewController {
	func requestAllBeer() {
		requestBeer.requestAllBear { result in
			self.allBeer = result
			self.tableView.reloadData()
			print(result.count)
		}
	}
}

extension AllBearViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allBeer.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell")!

		cell.textLabel?.text = allBeer[indexPath.row].name
		
		cell.detailTextLabel?.text = allBeer[indexPath.row].description
		return cell
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}

}
