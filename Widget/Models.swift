//
//  Models.swift
//  ThreaderShare
//
//  Created by Daniele Bernardi on 10/19/20.
//

import Foundation

struct TweetLookupResponse : Codable, Identifiable {
  var id: UUID {
    return UUID()
  }
    
  struct Meta : Codable {
    var resultCount: Int
    var newestId: String
    var oldestId: String
    var nextToken: String?
  }
  
  var data: [Tweet]?
  var includes: Includes?
  var meta: Meta?
}

struct Tweet : Codable {
  var attachments: Attachments?
  var authorId: String
  var conversationId: String?
  var createdAt: Date?
  var entities: Entities?
  var id: String
  var inReplyToUserId: String?
  var referencedTweets: [ReferencedTweet]?
  var text: String
}

struct Attachments : Codable {
  var mediaKeys: [String]?
  var pollIds: [String]?
}

struct Media: Codable {
  enum MediaType : String, Codable {
    case photo, video, animatedGif = "animated_gif"
  }
  
  var mediaKey: String
  var type: MediaType
  var url: String?
  var previewImageUrl: String?
}

struct Includes : Codable {
  var tweets: [Tweet]?
  var media: [Media]?
  var users: [User]?
  var polls: [Poll]?
}

struct User : Codable {
  var id: String
  var name: String
  var username: String
  var profileImageUrl: String
}

struct Entities : Codable {
  var urls : [URLEntity]?
}

struct URLEntity : Codable {
  var start: Int
  var end: Int
  var displayUrl: String
  var expandedUrl: String
  var url: String
}

struct Poll : Codable {
  var id: String
  var options: [PollOption]
}

struct PollOption : Codable {
  var position: Int
  var label: String
  var votes: Int
}

struct ReferencedTweet : Codable {
  enum ReferenceType : String, Codable {
    case repliedTo = "replied_to"
    case quoted
  }

  var id: String
  var type: ReferenceType
}
