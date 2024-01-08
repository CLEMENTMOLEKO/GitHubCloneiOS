//
//  User.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/05.
//

import Foundation

struct User: Codable {
  var login             : String
  var id                : Int?    = nil
  var nodeId            : String? = nil
  var avatarUrl         : String? = nil
  var gravatarId        : String? = nil
  var url               : String? = nil
  var htmlUrl           : String? = nil
  var followersUrl      : String? = nil
  var followingUrl      : String? = nil
  var gistsUrl          : String? = nil
  var starredUrl        : String? = nil
  var subscriptionsUrl  : String? = nil
  var organizationsUrl  : String? = nil
  var reposUrl          : String? = nil
  var eventsUrl         : String? = nil
  var receivedEventsUrl : String? = nil
  var type              : String? = nil
  var siteAdmin         : Bool?   = nil
  var name              : String? = nil
  var company           : String? = nil
  var blog              : String? = nil
  var location          : String? = nil
  var email             : String? = nil
  var hireable          : Bool?   = nil
  var bio               : String? = nil
  var twitterUsername   : String? = nil
  var publicRepos       : Int?    = nil
  var publicGists       : Int?    = nil
  var followers         : Int?    = nil
  var following         : Int?    = nil
  var createdAt         : Date
  var updatedAt         : Date
}
