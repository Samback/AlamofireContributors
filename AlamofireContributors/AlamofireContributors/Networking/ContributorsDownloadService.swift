//
//  ContributorsDownloadService.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias ContributorsCompletion = (Result<[Contributor]>) -> ()

protocol ContributorsDownloadProtocol {
    func fetchContributors(with completion: @escaping ContributorsCompletion)
}

final class ContributorsDownloadService: ContributorsDownloadProtocol {
    private let provider = MoyaProvider<NetworkingService>(plugins: [NetworkLoggerPlugin(verbose: true)])

    func fetchContributors(with completion: @escaping ContributorsCompletion) {
        provider.request(.contributors) { result in
            switch result {
            case let .success(response):
                if let items = try? response.mapArray(Contributor.self) {
                    completion(.success(items))
                } else {
                    let error: MoyaError = .jsonMapping(response)
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }

        }
    }
}
