//
//  RealmRepository.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import Foundation
import RealmSwift

class RealmRepository {
	
	static let shared = RealmRepository()
	
	private let configuration: Realm.Configuration
	
	private var realm: Realm {
		return try! Realm(configuration: self.configuration)
	}
	
	init(configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
		self.configuration = configuration
	}
	
	func saveUserList(users: [User]) {
		try! realm.write {
			realm.add(users, update: .modified)
		}
	}
	
	func saveOneUser(_ user: User) {
		try! realm.write {
			realm.add(user, update: .modified)
		}
	}
	
	func getUserList() -> [User] {
		Array(realm.objects(User.self))
	}
	
	func getUserByLogin(_ login: String) -> User? {
		
		let users = realm.objects(User.self)
		return users.filter("login = %@", login).first
	}
	
}
