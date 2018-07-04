//
//  ContributorsDownloadService.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Alamofire

typealias ContributorsCompletion = (Result<[Contributor]>) -> ()

protocol ContributorsDownloadProtocol {
    func fetchContributors(with completion: @escaping ContributorsCompletion)
}

final class ContributorsDownloadService: ContributorsDownloadProtocol {
    func fetchContributors(with completion: @escaping ContributorsCompletion) {
        var contributors: [Contributor] = []
        for _ in 1...20 {
            contributors.append(Contributor.fakeContributor())
        }
        completion(.success(contributors))
    }

}
