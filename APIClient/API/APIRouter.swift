//
//  APIRouter.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - APIRouter

public enum APIRouter {
    
    // MARK: Case
    
    case readPost(id: String)
    
}

// MARK: - Router

import Foundation

public typealias HTTPMethod = String

extension APIRouter: Router {
    
    public static var baseUrl: URL {
        
        return URL(string: "https://jsonplaceholder.typicode.com")!
        
    }
    
    public var path: String {
        
        switch self {
            
        case .readPost(let id):
            
            return "posts/\(id)"
            
        }
        
    }
    
    public var httpMethod: HTTPMethod {
        
        switch self {
            
        case .readPost:
            
            return "GET"
            
        }
        
    }
    
    public func makeURLRequest() throws -> URLRequest {
        
        switch self {
            
        case .readPost:
            
            let url = APIRouter.baseUrl.appendingPathComponent(path)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = httpMethod
            
            return request
            
        }
        
    }
    
}
