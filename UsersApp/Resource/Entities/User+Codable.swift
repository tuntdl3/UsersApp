//
//  User+Codable.swift
//  UsersApp
//
//  Created by Callie Nguyen on 08/08/2021.
//

import Foundation

extension User {
	
	enum CodingKeys: String, CodingKey {
		case login,
			 id,
			 nodeID = "node_id",
			 avatarUrl = "avatar_url",
			 gravatarId = "gravatar_id",
			 url,
			 htmlUrl = "html_url",
			 followersUrl = "followers_url",
			 followingUrl = "following_url",
			 gistsUrl = "gists_url",
			 starredUrl = "starred_url",
			 subscriptionsUrl = "subscriptions_url",
			 organizationsUrl = "organizations_url",
			 reposUrl = "repos_url",
			 eventsUrl = "events_url",
			 receivedEventsUrl = "received_events_url",
			 type,
			 siteAdmin = "site_admin",
			 name,
			 company,
			 blog,
			 location,
			 email,
			 hireable,
			 bio,
			 twitterUsername = "twitter_username",
			 publicRepos = "public_repos",
			 publicGists = "public_gists",
			 followers,
			 following,
			 createdAt = "created_at"
	}
	
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encodeIfPresent(login, forKey: .login)
		try container.encodeIfPresent(id, forKey: .id)
		try container.encodeIfPresent(nodeID, forKey: .nodeID)
		try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
		try container.encodeIfPresent(gravatarId, forKey: .gravatarId)
		try container.encodeIfPresent(url, forKey: .url)
		try container.encodeIfPresent(htmlUrl, forKey: .htmlUrl)
		try container.encodeIfPresent(followersUrl, forKey: .followersUrl)
		try container.encodeIfPresent(followingUrl, forKey: .followingUrl)
		try container.encodeIfPresent(gistsUrl, forKey: .gistsUrl)
		try container.encodeIfPresent(starredUrl, forKey: .starredUrl)
		try container.encodeIfPresent(subscriptionsUrl, forKey: .subscriptionsUrl)
		try container.encodeIfPresent(organizationsUrl, forKey: .organizationsUrl)
		try container.encodeIfPresent(reposUrl, forKey: .reposUrl)
		try container.encodeIfPresent(eventsUrl, forKey: .eventsUrl)
		try container.encodeIfPresent(receivedEventsUrl, forKey: .receivedEventsUrl)
		try container.encodeIfPresent(type, forKey: .type)
		try container.encodeIfPresent(siteAdmin, forKey: .siteAdmin)
		try container.encodeIfPresent(name, forKey: .name)
		try container.encodeIfPresent(company, forKey: .company)
		try container.encodeIfPresent(blog, forKey: .blog)
		try container.encodeIfPresent(location, forKey: .location)
		try container.encodeIfPresent(email, forKey: .email)
		try container.encodeIfPresent(hireable, forKey: .hireable)
		try container.encodeIfPresent(bio, forKey: .bio)
		try container.encodeIfPresent(twitterUsername, forKey: .twitterUsername)
		try container.encodeIfPresent(publicRepos, forKey: .publicRepos)
		try container.encodeIfPresent(publicGists, forKey: .publicGists)
		try container.encodeIfPresent(followers, forKey: .followers)
		try container.encodeIfPresent(following, forKey: .following)
		try container.encodeIfPresent(createdAt, forKey: .createdAt)
	}
}
