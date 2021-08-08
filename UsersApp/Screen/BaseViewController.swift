//
//  BaseViewController.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import UIKit

class BaseViewController: UIViewController {

	let refreshControl = UIRefreshControl()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configPullRefresh()
    }
    
	
	func configPullRefresh() {
		refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
		refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
	}
	
	@objc func refresh(_ sender: AnyObject) {
	}
}
