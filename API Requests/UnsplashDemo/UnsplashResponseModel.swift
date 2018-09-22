//
//  UnsplashResponseModel.swift
//  API Requests
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import Foundation

struct UnsplashResponseModel: Decodable {
    
    let id: String
    let width: Int
    let height: Int
    let color: String
    
    let urls: URLs
}

struct URLs: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
