//
//  UserViewModel.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import Foundation
import RxSwift


struct UserViewModel {
	var items: PublishSubject<[User]>
	
	func fetchUsers() {
		
	}
}
