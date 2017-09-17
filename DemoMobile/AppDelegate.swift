//
//  AppDelegate.swift
//  DemoMobile
//
//  Created by paprika on 2017/9/15.
//  Copyright © 2017年 paprika. All rights reserved.
//

import UIKit
import Turbolinks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let navigationController = UINavigationController()
    
    let session = Session()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = navigationController
        
        startApplication()
        
        
        return true
    }

    func startApplication(){
    
        session.delegate = self
        
        visit(url:URL(string:"http://localhost:3000/posts")!)
    
    }
    func visit(url:URL, withAction action:Action = .Advance)  {
        if url.path == "/posts/new" {
            let controller = UIStoryboard(name: "Main", bundle: Bundle(for: AppDelegate.self)).instantiateInitialViewController()!
            navigationController.pushViewController(controller, animated: true)
        }else{
        
            let controller = VisitableViewController(url:url)
            switch action {
            case .Advance:
                navigationController.pushViewController(controller, animated: true)
            case .Replace:
                navigationController.popViewController(animated: false)
                navigationController.pushViewController(controller, animated: true)
            case .Restore:
                navigationController.popViewController(animated: true)
                
            }
            
            session.visit(controller)
        }
        
    }
    
}


extension AppDelegate : SessionDelegate{


    func session(_ session: Session, didProposeVisitToURL URL: URL, withAction action: Action) {
        visit(url: URL)
    }

    
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, withError error: NSError) {
        
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    func sessionDidStartRequest(_ session: Session) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}















