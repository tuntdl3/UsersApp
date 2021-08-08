//
//  UserTableViewCell.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {
	
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var loginLB: UILabel!
	@IBOutlet weak var htmlUrlLB: UILabel!
	
	var user: User! {
		didSet {
			avatarImageView.loadImage(urlStr: user.avatarUrl)
			avatarImageView.makeCornerRadius(with: 30)
			loginLB.text = user.login
			htmlUrlLB.text = user.htmlUrl
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
