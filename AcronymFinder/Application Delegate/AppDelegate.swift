//
//  AppDelegate.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow?

    private let appCoordinator = AppCoordinator()
    
    // MARK: - Application Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Initialize Window
        window = UIWindow(frame: UIScreen.main.bounds)
                
        // Configure Window
        window?.rootViewController = appCoordinator.rootViewContoller
        window?.makeKeyAndVisible()
        
        // Start Coordinator
        appCoordinator.start()
        
        return true
    }
}

