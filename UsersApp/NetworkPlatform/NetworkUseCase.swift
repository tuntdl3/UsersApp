//
//  NetworkUseCase.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import Foundation
import Alamofire


class NetworkUseCase {
	static let shared = NetworkUseCase()
	
	let baseURL: String = "https://api.github.com/"
	
	var isConnectedToInternet:Bool {
		return NetworkReachabilityManager()?.isReachable ?? false
	}
	
	func requestBy(type: RequestType,
				   completionHandler: @escaping (AFDataResponse<Any>) -> Void)  {
		let url = baseURL + type.resource.route
		
		AF.request(url, method: type.resource.method, encoding: JSONEncoding.default)
			.responseJSON { response in
				completionHandler(response)
			}
	}
	
	func getListUsers(completionHandler: @escaping ([User]) -> Void) {
		
		requestBy(type: .users) { response in
			switch response.result {
				
				case .success(let json):
					print(type(of: json))
					let jsonData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions())
					do {
						let decoder = JSONDecoder()
						let users = try decoder.decode([User].self, from: jsonData)
						RealmRepository.shared.saveUserList(users: users)
						completionHandler(users)
					}
					catch {
						print (error)
					}
				case .failure(let error):
					print(error)
			}
		}
		
	}
	
	func getUserDetailBy(login: String, completionHandler: @escaping (User) -> Void) {
		
		requestBy(type: .userDetail(login: login)) { response in
			switch response.result {
				
				case .success(let json):
					print(type(of: json))
					let jsonData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions())
					do {
						let decoder = JSONDecoder()
						let user = try decoder.decode(User.self, from: jsonData)
						RealmRepository.shared.saveOneUser(user)
						completionHandler(user)
					}
					catch {
						print (error)
					}
				case .failure(let error):
					print(error)
			}
		}
		
	}
}
