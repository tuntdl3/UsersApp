//
//  User.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import Foundation
import RealmSwift

final class  User: Object, Codable {
	@objc dynamic var login: String = ""
	@objc dynamic var id: Int = 0
	@objc dynamic var nodeID: String = ""
	@objc dynamic var avatarUrl: String = ""
	@objc dynamic var gravatarId: String = ""
	@objc dynamic var url: String = ""
	@objc dynamic var htmlUrl: String = ""
	@objc dynamic var followersUrl: String = ""
	@objc dynamic var followingUrl: String = ""
	@objc dynamic var gistsUrl: String = ""
	@objc dynamic var starredUrl: String = ""
	@objc dynamic var subscriptionsUrl: String = ""
	@objc dynamic var organizationsUrl: String = ""
	@objc dynamic var reposUrl: String = ""
	@objc dynamic var eventsUrl: String = ""
	@objc dynamic var receivedEventsUrl: String = ""
	@objc dynamic var type: String = ""
	@objc dynamic var siteAdmin: Bool = false
	@objc dynamic var name: String = ""
	@objc dynamic var company: String? = nil
	@objc dynamic var blog: String = ""
	@objc dynamic var location: String = ""
	@objc dynamic var email: String? = nil
	@objc dynamic var hireable: String? = nil
	@objc dynamic var bio: String? = nil
	@objc dynamic var twitterUsername: String? = nil
	@objc dynamic var publicRepos: Int = 0
	@objc dynamic var publicGists: Int = 0
	@objc dynamic var followers: Int = 0
	@objc dynamic var following: Int = 0
	@objc dynamic var createdAt: String = ""
	
	override class func primaryKey() -> String? {
		return "id"
	}
	
	override init() {
		super.init()
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		
		login = try values.decodeIfPresent(String.self, forKey: .login) ?? ""
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
		nodeID = try values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl) ?? ""
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId) ?? ""
		url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl) ?? ""
		followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl) ?? ""
		followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl) ?? ""
		gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl) ?? ""
		starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl) ?? ""
		subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl) ?? ""
		organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl) ?? ""
		reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl) ?? ""
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl) ?? ""
		receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl) ?? ""
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
		siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin) ?? false
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
		company = try values.decodeIfPresent(String.self, forKey: .company) ?? nil
		blog = try values.decodeIfPresent(String.self, forKey: .blog) ?? ""
		location = try values.decodeIfPresent(String.self, forKey: .location) ?? ""
		email = try values.decodeIfPresent(String.self, forKey: .email) ?? nil
		hireable = try values.decodeIfPresent(String.self, forKey: .hireable) ?? nil
		bio = try values.decodeIfPresent(String.self, forKey: .bio) ?? nil
		twitterUsername = try values.decodeIfPresent(String.self, forKey: .twitterUsername) ?? nil
		publicRepos = try values.decodeIfPresent(Int.self, forKey: .publicRepos) ?? 0
		publicGists = try values.decodeIfPresent(Int.self, forKey: .publicGists) ?? 0
		followers = try values.decodeIfPresent(Int.self, forKey: .followers) ?? 0
		following = try values.decodeIfPresent(Int.self, forKey: .following) ?? 0
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
		
	}
}
