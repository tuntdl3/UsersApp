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
	
	func getUserById(_ id: Int) -> User? {
		realm.object(ofType: User.self, forPrimaryKey: id)
	}
	
}
