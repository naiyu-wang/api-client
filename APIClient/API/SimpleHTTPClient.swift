//
//  SimpleHTTPClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - SimpleAPIClientError

public typealias StatusCode = Int

public enum SimpleAPIClientError: Error {
    
    // MARK: Case
    
    case noResponse
    
    case invalidResponse(StatusCode)
    
    case noData
    
}

// MARK: - SimpleHTTPClient

import Foundation

public struct SimpleHTTPClient {
    
    // MARK: Property
    
    public let session: URLSession
    
    // MARK: Init
    
    public init(session: URLSession = .shared) {
        
        self.session = session
        
    }
    
}

// MARK: - HTTPClient

import Hydra

extension SimpleHTTPClient: HTTPClient {
    
    public typealias Value = Any
    
    public func request(_ request: URLRequest) -> Promise<Value> {
        
        let promise: Promise<Value> = Promise { fulfill, reject, _ in
            
            let task = self.session.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    
                    reject(error)
                    
                    return
                    
                }
                
                guard
                    let response = response as? HTTPURLResponse
                    else {
                        
                        reject(SimpleAPIClientError.noResponse)
                        
                        return
                        
                }
                
                let statusCode = response.statusCode
                
                switch statusCode {
                    
                case 200..<300:
                    
                    guard
                        let data = data
                        else {
                            
                            reject(SimpleAPIClientError.noData)
                            
                            return
                            
                    }
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data)
                        
                        fulfill(json)
                        
                    }
                    catch {
                        
                        reject(error)
                        
                    }
                    
                default:
                    
                    let error: SimpleAPIClientError = .invalidResponse(statusCode)
                    
                    reject(error)
                    
                }
                
            }
            
            task.resume()
            
        }
        
        return promise
        
    }
    
}
