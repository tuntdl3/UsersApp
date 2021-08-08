//
//  UserDetailViewController.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit
import RxCocoa
import RxSwift
import Reusable
import Then

class UserDetailViewController: BaseViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var infoCellHeight: CGFloat { return UIScreen.main.bounds.width }
	var followCellHeight: CGFloat { return 80 }
	var bioCellHeight: CGFloat { return UIScreen.main.bounds.height - infoCellHeight - followCellHeight }
	
	var login: String = ""
	var viewModel = UserViewModel()
	var user = User()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Profile"
		configTableView()
		fetchData()
    }
	
	func configTableView() {
		tableView.delegate = self
		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(cellType: UserDetailTableViewCell.self)
		tableView.register(cellType: UserFollowTableViewCell.self)
		tableView.register(cellType: UserBioTableViewCell.self)
		tableView.tableFooterView = UIView()
		tableView.addSubview(refreshControl)
		
		
		viewModel.userDetail
			.do(onNext: { [unowned self] user in
				self.user = user
				self.refreshControl.endRefreshing()
			})
			.map { user in [user, user, user] }
			.bind(to: tableView.rx.items) {[unowned self] tableView, index, setting in
				if index == 0 {
					return tableView.dequeueReusableCell(
						for: IndexPath(row: index, section: 0),
						cellType: UserDetailTableViewCell.self)
						.then {
							$0.loadUserInfo(avatarURL: self.user.avatarUrl, name: self.user.name, login: self.user.login, location: self.user.location)
						}
				}
				
				if index == 1 {
					return tableView.dequeueReusableCell(
						for: IndexPath(row: index, section: 0),
						cellType: UserFollowTableViewCell.self)
						.then {
							$0.loadUserData(follower: self.user.followers, following: self.user.following, repo: self.user.publicRepos)
						}
				}
				
				return tableView.dequeueReusableCell(
					for: IndexPath(row: index, section: 0),
					cellType: UserBioTableViewCell.self)
					.then {
						$0.loadBioUser(self.user.bio)
					}
			}
			.disposed(by: bag)
	}
	
	override func refresh(_ sender: AnyObject) {
		super.refresh(sender)
		fetchData()
	}
	
	func fetchData() {
		viewModel.fetchUserDetailByLogin(login: login)
	}
}


extension UserDetailViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.row == 0 ? infoCellHeight : indexPath.row == 1 ? followCellHeight : bioCellHeight
	}
}
