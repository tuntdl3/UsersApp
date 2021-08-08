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
	
	func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let defaultButton = UIAlertAction(title: "OK", style: .default, handler: handler)
		alert.addAction(defaultButton)
		self.present(alert, animated: true, completion: nil)
	}
}
