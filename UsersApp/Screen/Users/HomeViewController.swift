//
//  HomeViewController.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var viewModel = UserViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "User List"
		configTableView()
		fetchData()
	}
	
	func configTableView() {
		tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
		tableView.delegate = self
		tableView.tableFooterView = UIView()
		tableView.addSubview(refreshControl)
		
		viewModel.items
			.do(onNext: {[unowned self] _ in
				self.refreshControl.endRefreshing()
			})
			.bind(to: tableView.rx.items(
					cellIdentifier: "cell",
					cellType: UserTableViewCell.self))
			{ row, model, cell in
				cell.user = model
			}.disposed(by: bag)
		
		tableView.rx.modelSelected(User.self).bind { user in
			self.pushToDetail(login: user.login)
		}.disposed(by: bag)
	}
	
	@objc override func refresh(_ sender: AnyObject) {
		super.refresh(sender)
		fetchData()
	}
	
	func fetchData() {
		viewModel.fetchListUserData()
	}
	
	func pushToDetail(login: String) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let vc = storyBoard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
		vc.login = login
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension HomeViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}

