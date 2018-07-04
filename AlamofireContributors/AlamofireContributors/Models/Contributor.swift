//
//  Contributor.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
struct Contributor {
    var id: Int!
    var image: String?
    var name: String?
}


extension Contributor {
    static func fakeContributor() -> Contributor {
        return Contributor(id: 0,
                           image: "https://avatars1.githubusercontent.com/u/3932972?s=400&v=4",
                           name: "Nicolas")
    }

    var imageURL: URL? {
        guard let image = image else {
            return nil
        }
        return URL(string: image)
    }
}
