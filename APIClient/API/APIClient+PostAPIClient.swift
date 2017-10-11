//
//  APIClient+PostAPIClient.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostAPIClient

import Hydra

extension APIClient: PostAPIClient {
    
    public func readPost() -> Promise<Post> {
        
        let promise: Promise<Post> = Promise { fulfill, reject, _ in
            
            do {
                
                let endpoint = try self.router.makeURLRequest()
                
                self.httpClient.request(endpoint) { result in
                    
                    switch result {
                        
                    case .success(let json):
                        
                        do {
                            
                            let post = try Post(json: json)
                            
                            fulfill(post)
                            
                        }
                        catch {
                            
                            reject(error)
                            
                        }
                        
                    case .failure(let error):
                        
                        reject(error)
                        
                    }
                    
                }
                
            }
            catch {
                
                reject(error)
                
            }
            
        }
        
        return promise
        
    }
        
}
