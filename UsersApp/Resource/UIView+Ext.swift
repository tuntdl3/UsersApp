//
//  UIView+Ext.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import UIKit
import AlamofireImage

extension UIImageView {
	func loadImage(urlStr: String) {
		if let url = URL(string: urlStr) {
			self.af.setImage(withURL: url)
		}
	}
}

extension UIView {
	func makeCornerRadius(with radius: CGFloat) {
		self.layer.cornerRadius = radius
		self.layer.masksToBounds = true
	}
}
