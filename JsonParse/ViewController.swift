//
//  ViewController.swift
//  JsonParse
//
//  Created by IM on 17/12/17.
//  Copyright © 2017 iOS Application for World. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {
    
    var jsonObject: BaseClass?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkManager(BaseClass.self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func networkManager<T:BaseMappable>(_:T.Type){
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseObject{(response: DataResponse<T>) in
                
                switch response.result {
                case .success(let data):
                    self.jsonObject = data as? BaseClass
                    print (self.jsonObject!)
                    print((self.jsonObject?.body)!)
                    print((self.jsonObject?.id)!)
                case .failure(let error):
                    let err = error as NSError
                    print(err.code)
                    print(err.localizedDescription)
                }
        }
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

