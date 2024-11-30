//
//  User.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/05.
//

import Foundation

struct User: Codable, Identifiable {
  var login             : String
  var id                : Int?
  var nodeId            : String?
  var avatarUrl         : String?
  var gravatarId        : String?
  var url               : String?
  var htmlUrl           : String?
  var followersUrl      : String?
  var followingUrl      : String?
  var gistsUrl          : String?
  var starredUrl        : String?
  var subscriptionsUrl  : String?
  var organizationsUrl  : String?
  var reposUrl          : String?
  var eventsUrl         : String?
  var receivedEventsUrl : String?
  var type              : String?
  var siteAdmin         : Bool?
  var name              : String?
  var company           : String?
  var blog              : String?
  var location          : String?
  var email             : String?
  var hireable          : Bool?
  var bio               : String?
  var twitterUsername   : String?
  var publicRepos       : Int?
  var publicGists       : Int?
  var followers         : Int?
  var following         : Int?
  var createdAt         : Date?
  var updatedAt         : Date?
}
