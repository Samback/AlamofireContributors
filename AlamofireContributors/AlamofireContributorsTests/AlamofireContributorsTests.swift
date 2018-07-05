//
//  AlamofireContributorsTests.swift
//  AlamofireContributorsTests
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import XCTest
import Alamofire

@testable import AlamofireContributors

extension Contributor {
    static func fakeContributor() -> Contributor {
        var dict: [String: Any] = [:]
        dict["id"] = 33
        dict["login"] = "Cool"
        dict["avatar_url"] = "sdvsdvsdvds"
        dict["bio"] = "savbskvbsvksdnb,v"
        dict["company"] = "sadvjks,vbsahjv"
        dict["blog"] = "asdv"
        let contributor = Contributor(JSON: dict)!
        return contributor
    }
}

class ContributorsRouterProtocolTest: ContributorsRouterProtocol {

    func openNextScreen(with contributor: Contributor) {
        print("OK")
    }
    var view: ContributorsViewController?
}

class ContributorsViewProtocolTest: ContributorsViewProtocol {
    func showAlert(with error: Error) {}
    func configUI() {    }
    func startSpinner() {}
    func stopSpinner() {}
    func reloadTable() { }
    func configTableView() { }
}



class ContributorsDownloadServiceTest: ContributorsDownloadProtocol {
    func fetchContributors(with completion: @escaping ContributorsCompletion) {
        var items = [Contributor]()
        items.append(Contributor.fakeContributor())
        items.append(Contributor.fakeContributor())
        items.append(Contributor.fakeContributor())
        completion(.success(items))
    }
}

class AlamofireContributorsTests: XCTestCase {
    var presenter: (ContributorsPresenterProtocol & ContributorsPresenterDataSourceProtocol)!
    override func setUp() {
        super.setUp()
        let loader = ContributorsDownloadServiceTest()
        let view = ContributorsViewProtocolTest()
        let router = ContributorsRouterProtocolTest()
        presenter = ContributorsPresenter(with: router,
                                          view: view ,
                                          loader: loader)
        let expectationThing = expectation(description: "Loading")
        presenter.viewDidLoad()
        gloabalThread(after: 2) {
            expectationThing.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)

    }
    // Put setup code here. This method is called before the invocation of each test method in the class.
    func testNumberCorrectNumberOfContributorsOnLoad() {
        XCTAssert(presenter.numberOfContributors(at: 0) == 3)
        XCTAssert(presenter.numberOfContributors(at: 1) == 0)
    }

    func testContributorInfo() {
        XCTAssertNil(presenter.contributor(at: IndexPath(row: 1, section: 1)), "Go out of bounds")
        XCTAssertNotNil(presenter.contributor(at: IndexPath(row: 0, section: 0)), "Stay on bounds")
    }
}
