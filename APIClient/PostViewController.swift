//
//  PostViewController.swift
//  APIClient
//
//  Created by Roy Hsu on 04/10/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostViewController

import UIKit

public final class PostViewController: UIViewController {

    // MARK: Property
    
    public final let client: PostAPIClient = APIClient(
        router: APIRouter.readPost(id: "1"),
        httpClient: SimpleHTTPClient()
    )
    
    // MARK: View Life Cycle
    
    public final override func viewDidLoad() {
        super.viewDidLoad()
        
        client
            .readPost()
            .then { post in
                
                print(post)
                
        }
            .catch { error in
         
                print(error)
                
        }
        
    }

}

