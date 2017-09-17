//
//  ViewController.swift
//  DemoMobile
//
//  Created by paprika on 2017/9/15.
//  Copyright © 2017年 paprika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.visit(url: URL(string: "http://localhost:3000/posts")!,withAction: .Restore)
    }

}

