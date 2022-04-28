//
//  ImageGalleryTests.swift
//  ImageGalleryTests
//
//  Created by Admin on 28/04/2022.
//

import XCTest
@testable import ImageGallery

class ImageGalleryTests: XCTestCase {
    
    var viewModel:ImageSearchViewModel!
    var networkManager:MockNetworkManager!

    override func setUpWithError() throws {
        networkManager = MockNetworkManager()
        viewModel = ImageSearchViewModel(networkManager: networkManager)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSearchImage_success() {

        let request = Request(baseUrl: APIURLs.baseUrl, path:"", params: ["method":APIURLs.photoMethod, "text":"cat", "api_key": APIURLs.apiKey, "format" : "json", "nojsoncallback" : "1"])

        viewModel.search(request: request)
        
        XCTAssertEqual(viewModel.photoDetailsCount, 100)

        XCTAssertEqual(viewModel.photoDetails.first?.title, "cat rider")

    }
    
    func testSearchImage_failure() {

        let request = Request(baseUrl: APIURLs.baseUrl, path:"failedResonce", params: ["method":APIURLs.photoMethod, "text":"cat", "api_key": APIURLs.apiKey, "format" : "json", "nojsoncallback" : "1"])

        viewModel.search(request: request)

        XCTAssertEqual(viewModel.photoDetailsCount, 0)

    }



}
