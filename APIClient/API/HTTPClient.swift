//
//  HTTPClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - HTTPClient

import Foundation
import Hydra

public protocol HTTPClient {
    
    associatedtype Value
    
    // MARK: Request
    
    func request(_ request: URLRequest) -> Promise<Value>
    
}
