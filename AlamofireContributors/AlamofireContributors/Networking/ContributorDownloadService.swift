//
//  ContributorDownloadService.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias ContributorCompletion = (Result<Contributor>) -> ()

protocol ContributorDownloadProtocol {
    func fetchContributor(with completion: @escaping ContributorCompletion)
}

final class ContributorDownloadService: ContributorDownloadProtocol {
    private let provider = MoyaProvider<NetworkingService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private let contributor: Contributor

    init(with contributor: Contributor) {
        self.contributor = contributor
    }

    func fetchContributor(with completion: @escaping ContributorCompletion) {
        provider.request(.contributor(contributor.usrePathTail)) { result in
            switch result {
            case let .success(response):
                if let item = try? response.mapObject(Contributor.self) {
                    completion(.success(item))
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
