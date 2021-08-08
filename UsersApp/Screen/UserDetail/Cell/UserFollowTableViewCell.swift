//
//  UserFollowTableViewCell.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit
import Reusable

class UserFollowTableViewCell: UITableViewCell, NibReusable {

	@IBOutlet weak var followerNumberLB: UILabel!
	@IBOutlet weak var followerLB: UILabel!
	
	@IBOutlet weak var followingNumberLB: UILabel!
	@IBOutlet weak var followingLB: UILabel!
	
	@IBOutlet weak var repoNumberLB: UILabel!
	@IBOutlet weak var repoLB: UILabel!
	
	func loadUserData(follower: Int, following: Int, repo: Int) {
		followerNumberLB.text = "\(follower)"
		followerLB.text = "Followers"
		
		followingNumberLB.text = "\(following)"
		followingLB.text = "Following"
		
		repoNumberLB.text = "\(repo)"
		repoLB.text = "Repos"
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
