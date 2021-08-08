//
//  UserDetailTableViewCell.swift
//  UsersApp
//
//  Created by Callie Nguyen on 07/08/2021.
//

import UIKit
import Reusable

class UserDetailTableViewCell: UITableViewCell, NibReusable  {

	@IBOutlet weak var bgImageView: UIImageView!
	@IBOutlet weak var avatartImageView: UIImageView!
	@IBOutlet weak var nameLB: UILabel!
	@IBOutlet weak var locationLB: UILabel!
	
	func loadUserInfo(avatarURL: String, name: String, login: String, location: String?) {
		bgImageView.image = UIImage(named: Constant.backgroundImages.randomElement() ?? Constant.backgroundImages[0])
		avatartImageView.loadImage(urlStr: avatarURL)
		nameLB.text = name != "" ? name : login
		locationLB.text = location
		locationLB.isHidden = location == nil
		
		avatartImageView.makeCornerRadius(with: 60)
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
