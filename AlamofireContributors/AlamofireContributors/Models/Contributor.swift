//
//  Contributor.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//
import Foundation
import Moya_ObjectMapper
import Moya
import ObjectMapper

final class Contributor: Mappable {
    var id: Int!
    var image: String?
    var name: String?
    var bio: String?
    var company: String?
    var blog: String?

    init?(map: Map) {
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["login"]
        image <- map["avatar_url"]
        bio <- map["bio"]
        company <- map["company"]
        blog <- map["blog"]
    }

    var usrePathTail: String {
        return "/users/\(name ?? "")"
    }
}

extension Contributor {
    var imageURL: URL? {
        guard let image = image else {
            return nil
        }
        return URL(string: image)
    }
}
