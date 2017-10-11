//
//  PostAPIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostAPIClient

import Hydra

public protocol PostAPIClient {
    
    func readPost() -> Promise<Post>
    
}
