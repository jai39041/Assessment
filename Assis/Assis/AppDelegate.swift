//
//  AppDelegate.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create the main window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.setPrimaryViewController()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}




extension UIWindow {
    func setPrimaryViewController() {
        // Create the main view controller
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainViewController = mainStoryboard
            .instantiateViewController(identifier: "ItemsController") as? ItemsVC else {
            fatalError("ViewController not found in Main.storyboard")
        }
        
        // Embed the main view controller in a navigation controller
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        // Set the root view controller
        self.rootViewController = navigationController
        self.makeKeyAndVisible()
    }
}
