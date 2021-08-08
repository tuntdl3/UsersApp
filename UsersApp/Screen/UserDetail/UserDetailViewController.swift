//
//  UserDetailViewController.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit

class UserDetailViewController: BaseViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var infoCellHeight: CGFloat { return UIScreen.main.bounds.width }
	var followCellHeight: CGFloat { return 80 }
	var bioCellHeight: CGFloat { return UIScreen.main.bounds.height - infoCellHeight - followCellHeight }
	
	var user: User!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Profile"
		configTableView()
		fetchData()
    }
	
	func configTableView() {
		tableView.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")
		tableView.register(UINib(nibName: "UserFollowTableViewCell", bundle: nil), forCellReuseIdentifier: "followCell")
		tableView.register(UINib(nibName: "UserBioTableViewCell", bundle: nil), forCellReuseIdentifier: "bioCell")
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.addSubview(refreshControl)
	}
	
	override func refresh(_ sender: AnyObject) {
		super.refresh(sender)
		fetchData()
	}
	
	func fetchData() {
		
		if NetworkUseCase.shared.isConnectedToInternet {
			NetworkUseCase.shared.getUserDetailBy(login: user.login) { user in
				self.refreshDataTableView(data: user)
			}
		} else {
			if let data = RealmRepository.shared.getUserById(user.id) {
				self.refreshDataTableView(data: data)
			} else {
				showAlert(title: "Error", message: "Please try again later")
			}
		}
	}
	
	func refreshDataTableView(data: User) {
		self.user = data
		self.tableView.reloadData()
		self.refreshControl.endRefreshing()
	}
}


extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? UserDetailTableViewCell {
			cell.loadUserInfo(avatarURL: user.avatarUrl, name: user.name, login: user.login, location: user.location)
			return cell
		}
		
		
		if  indexPath.row == 1, let cell = tableView.dequeueReusableCell(withIdentifier: "followCell", for: indexPath) as? UserFollowTableViewCell {
			cell.loadUserData(follower: user.followers, following: user.following, repo: user.publicRepos)
			return cell
		}
		
		if indexPath.row == 2, let cell = tableView.dequeueReusableCell(withIdentifier: "bioCell", for: indexPath) as? UserBioTableViewCell {
			cell.loadBioUser(user.bio)
			return cell
		}
		
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.row == 0 ? infoCellHeight : indexPath.row == 1 ? followCellHeight : bioCellHeight
	}
}
