//
//  HomeViewController.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var users = [User]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "User List"
		configTableView()
		fetchData()
	}
	
	func configTableView() {
		tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.addSubview(refreshControl)
	}
	
	@objc override func refresh(_ sender: AnyObject) {
		super.refresh(sender)
		fetchData()
	}
	
	func fetchData() {
		if NetworkUseCase.shared.isConnectedToInternet {
			NetworkUseCase.shared.getListUsers { data in
				self.refreshDataTableView(data: data)
			}
		} else {
			let data = RealmRepository.shared.getUserList()
			self.refreshDataTableView(data: data)
		}
	}
	
	func refreshDataTableView(data: [User]) {
		self.users = data
		self.tableView.reloadData()
		self.refreshControl.endRefreshing()
	}
	
	func pushToDetail(user: User) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let vc = storyBoard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
		vc.user = user
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell {
			cell.user = users[indexPath.row]
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: false)
		pushToDetail(user: users[indexPath.row])
	}
}

