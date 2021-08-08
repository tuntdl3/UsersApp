//
//  UserViewModel.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import Foundation
import AlamofireImage
import RxSwift


public class UserViewModel {
	
	var items = PublishSubject<[User]>()
	var userDetail = PublishSubject<User>()
	
	func fetchListUserData() {
		if NetworkUseCase.shared.isConnectedToInternet {
			NetworkUseCase.shared.getListUsers { [unowned self] data in
				self.items.onNext(data)
				self.items.onCompleted()
			}
		} else {
			let data = RealmRepository.shared.getUserList()
			items.onNext(data)
			items.onCompleted()
		}
	}
	
	func fetchUserDetailByLogin(login: String) {
		
		if NetworkUseCase.shared.isConnectedToInternet {
			NetworkUseCase.shared.getUserDetailBy(login: login) { [unowned self] user in
				self.userDetail.onNext(user)
				self.userDetail.onCompleted()
			}
		} else {
			if let data = RealmRepository.shared.getUserByLogin(login) {
				self.userDetail.onNext(data)
				self.userDetail.onCompleted()
			}
			
			self.userDetail.onCompleted()
		}
	}
}
