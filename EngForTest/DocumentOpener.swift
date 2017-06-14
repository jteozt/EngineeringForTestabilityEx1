//
//  DocumentOpener.swift
//  EngForTest
//
//  Created by Jason Teo on 14/6/17.
//  Copyright © 2017 Jason Teo. All rights reserved.
//

import Foundation
import UIKit

class DocumentOpener {
    enum OpenMode: String {
        case view
        case edit
    }
    
    let urlOpener: URLOpening
    
    init(urlOpener: URLOpening = UIApplication.shared) {
        self.urlOpener = urlOpener
    }
    
    func open(_ document: Document, mode: OpenMode) {
        let modeString = mode.rawValue
        let url = URL(string: "myappscheme://open?id=\(document.identifier)&mode=\(modeString)")!
        
        if urlOpener.canOpenURL(url) {
            urlOpener.open(url, options: [:], completionHandler: nil)
        } else {
            print("url error")
        }
    }
    
}
