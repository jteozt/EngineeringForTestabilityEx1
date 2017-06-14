//
//  EngForTestTests.swift
//  EngForTestTests
//
//  Created by Jason Teo on 14/6/17.
//  Copyright © 2017 Jason Teo. All rights reserved.
//

import XCTest
@testable import EngForTest

class MockURLOpener: URLOpening {
    var canOpen = false
    var openedURL: URL?
    
    func canOpenURL(_ url: URL) -> Bool {
        return canOpen
    }
    
    func open(_ url: URL, options: [String : Any], completionHandler: ((Bool) -> Void)?) {
        openedURL = url
    }
}

class EngForTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOpensDocumentURLWhenButtonIsTapped() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Preview") as! PreviewViewController
        controller.loadViewIfNeeded()
        controller.segmentedControl.selectedSegmentIndex = 1
        controller.document = Document(identifier: "TheID")
        
        controller.openTapped(controller.button)
    }
    
    func testDocumentOpenerWhenItCanOpen() {
        let urlOpener = MockURLOpener()
        urlOpener.canOpen = true
        let documentOpener = DocumentOpener(urlOpener: urlOpener)
        
        documentOpener.open(Document(identifier: "TheID"), mode: .edit)
        
        XCTAssertEqual(urlOpener.openedURL, URL(string: "myappscheme://open?id=TheID&mode=edit"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
