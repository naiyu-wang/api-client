//
//  Router.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Router

import Foundation

public protocol Router {
    
    // MARK: URLRequest
    
    func makeURLRequest() throws -> URLRequest
    
}
