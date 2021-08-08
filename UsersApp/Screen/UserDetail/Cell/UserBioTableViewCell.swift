//
//  UserBioTableViewCell.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit

class UserBioTableViewCell: UITableViewCell {

	@IBOutlet weak var bioLB: UILabel!
	@IBOutlet weak var bioTV: UITextView!
	
	func loadBioUser(_ bio: String?) {
		bioLB.text = "Bio"
		
		if let bio =  bio {
			bioTV.text = bio
		} else {
			bioTV.text = "User bio"
			bioTV.textColor = .lightGray
		}
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
