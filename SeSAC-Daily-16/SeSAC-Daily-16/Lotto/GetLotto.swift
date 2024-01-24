//
//  GetLotto.swift
//  SeSAC-Daily-16
//
//  Created by A_Mcflurry on 1/16/24.
//

import UIKit
import Alamofire

class GetLotto {
	func getLotto(_ when: Int, completionHandler: @escaping (String)-> Void) {
		let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(when)"
		AF.request(url).responseDecodable(of: Lotto.self) { response in
			switch response.result {
			case .success(let success):
				completionHandler(success.resultLabel)
			case .failure(_):
				completionHandler("실패한듯")
			}
		}
	}
}

struct Lotto: Codable {
	let drwNo: Int
	let drwNoDate: String
	let drwtNo1: Int
	let drwtNo2: Int
	let drwtNo3: Int
	let drwtNo4: Int
	let drwtNo5: Int
	let drwtNo6: Int
	let bnusNo: Int

	var resultLabel: String {
		return "첫번째 공은\(drwtNo1)\n두번째 공은\(drwtNo2)\n세번째 공은\(drwtNo3)\n네번째 공은\(drwtNo4)\n다섯번째 공은\(drwtNo5)\n여섯번째 공은\(drwtNo6)\n보너스 공은\(bnusNo)인듯함"
	}
}
