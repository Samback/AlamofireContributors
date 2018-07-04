//
//  NetworkingService.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Moya

enum NetworkingService {
    case contributors
    case contributor(String)
}

extension NetworkingService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .contributors:
            return "/repos/Alamofire/Alamofire/contributors"
        case .contributor(let path):
            return path
        }
    }

    var method: Moya.Method {
        switch self {
        case .contributors, .contributor:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .contributors, .contributor:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Accept" : "application/json"]
    }

}
