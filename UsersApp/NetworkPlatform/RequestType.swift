//
//  RequestType.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import Alamofire

enum RequestType {
	case users
	case userDetail(login: String)
	
	var resource: (method: HTTPMethod, route: String) {
		switch self {
			case .users: return (.get,"users")
			case .userDetail(let login): return (.get, "users/\(login)")
		}
	}
}
