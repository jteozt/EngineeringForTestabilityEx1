//
//  URLOpening.swift
//  EngForTest
//
//  Created by Jason Teo on 14/6/17.
//  Copyright © 2017 Jason Teo. All rights reserved.
//

import Foundation

protocol URLOpening {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL, options: [String: Any], completionHandler: ((Bool) -> Void)?)
}
