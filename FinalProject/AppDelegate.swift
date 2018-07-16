//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var restaurants : [Restaurant] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let files = ["breakfast", "lunch", "dinner"]
        
        for file in files{
        
        if let path = Bundle.main.path(forResource: file , ofType: "plist") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                let tempArray = tempDict["restaurants"] as! Array<[String:Any]>
                
                for dict in tempArray {
                    
                    let name = dict["name"]! as! String
                    let address = dict["address"]! as! String
                    let rating = String(describing: dict["aggregate_rating"]! as! NSNumber)
                    let cuisine = dict["cuisines"]! as! String
                    
                    let cost = String(describing: dict["average_cost_for_two"]! as! NSNumber)
                    let menu = dict["menu_url"]! as! String
                    let photos = dict["photos_url"]! as! String
                    let url = dict["url"]! as! String
                    
                    
                    let latitude = Double(truncating: dict["latitude"]! as! NSNumber)
                    let longitude = Double(truncating: dict["longitude"]! as! NSNumber)
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    
                    let r = Restaurant(name: name, address: address,rating: rating, cuisine: cuisine, cost: cost, menu: menu , photos:photos, url: url, location: location)
                    
                    restaurants.append(r)
                    
                }
                
                for r in restaurants {
                    print("Restaurants: \(r) \n")
                }
                
            }
            catch {
                print(error)
            }
            }
        }
            
        let restaurantList = Restaurants()
        restaurantList.restaurantList = restaurants
        let tabBarController = window?.rootViewController as? UITabBarController
        let navVC = tabBarController!.viewControllers![1] as! UINavigationController
        let favVC = navVC.viewControllers[0] as! FavouriteVC
        favVC.restaurantList = restaurantList
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

