//
//  URLExtension.swift
//  API Requests
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import Foundation

extension URL {
    private static var baseUrl: String {
        return "https://api.unsplash.com/"
    }
    
    static func with(string: String) -> URL? {
        return URL(string: "\(baseUrl)\(string)")
    }
}
