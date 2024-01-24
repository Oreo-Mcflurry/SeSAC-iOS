//
//  requestBeer.swift
//  SeSAC-Daily-16
//
//  Created by A_Mcflurry on 1/16/24.
//

import Foundation
import Alamofire

struct RequestBeer {
	func requestRandomBeer(_ isFail: Bool, completionHandler: @escaping ([Beer])->()) {
		let url = isFail ? "https://api.punkapi.com/v2/beers/random" : "https://api.punkapi.com/v2/beers/fail"
		AF.request(url).responseDecodable(of: [Beer].self) { response in
			switch response.result {
			case .success(let success):
				completionHandler(success)
			case .failure(let fail):
				print(fail)
				completionHandler([Beer(id: 0, name: "실패", description: "실패한듯", image_url: Beer.defaultImage)])
			}
		}
	}

	func requestAllBear(completionHandler: @escaping ([Beer])->()) {
		let url = "https://api.punkapi.com/v2/beers"

		AF.request(url).responseDecodable(of: [Beer].self) { response in
			switch response.result {
			case .success(let success):
				completionHandler(success)
			case .failure(_):
				completionHandler([])
			}
		}
	}
}

struct Beer: Codable {
	let id: Int
	let name:String
	let description: String
	let image_url: String?
	static let defaultImage: String = "https://mblogthumb-phinf.pstatic.net/MjAyMTA3MDhfMTc3/MDAxNjI1NzA5ODMwOTIy.TQzEnrCHySFY3NHYCKWSwpVjScqF96r1YmN3DdsaY_Ug.oZJ_2F1YkfzNrUVdOQ-N2SOW12UPH47SjNm5PHAaSb8g.JPEG.kimjin8946/2.jpg?type=w800"
}
