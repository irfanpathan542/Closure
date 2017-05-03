//
//  ViewController.swift
//  testClosure
//
//  Created by iFlame on 5/3/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class NetworkClass  {
    
    func getAllProducts(completionHandler: @escaping ()->Void ){
        
        //DO REQUEST
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            
            completionHandler()
            
            //return ["HelloThere", "HelloWorld"]
            
        })
        
    }
    
    
    func testRequest(didStartHandler: @escaping ()->(), didCompleteHandler: @escaping ()->()){
        print("Start OF FUNCTION")
        
        didStartHandler()
        
        getAllProducts(completionHandler: {
            print("Download Finished")
            
            didCompleteHandler()
        })
        
        print("End OF FUNCTION")
    }
    
}


class ViewController: UIViewController {

    let objNet = NetworkClass()
    let activity : UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activity.center = self.view.center
        activity.hidesWhenStopped = true
        activity.tintColor = UIColor.green
        self.view.addSubview(activity)
        
        objNet.testRequest(didStartHandler: {
            
            self.activity.startAnimating()
        },
                           didCompleteHandler: {
                            
                            self.activity.stopAnimating()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

