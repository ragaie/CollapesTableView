//
//  ViewController.swift
//  testClosure
//
//  Created by Ragaie alfy on 1/2/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        spaceFlight(speed: 1) {
//
//            print("finish complete run ")
//
//        }
        spaceFlight(speed: 3) { (x, y) in
            
            print("\(x * y)")
            return 4
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func spaceFlight(speed:Int, onCompletion: ((_ a:Int,_ x : Int) -> Int) )
    {
        // Do long flight stuff
       print("print value \(speed)")
        
        onCompletion(speed, 3)
    
    }
}

