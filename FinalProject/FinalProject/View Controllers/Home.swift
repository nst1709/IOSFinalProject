//
//  ViewController.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit
import CoreLocation

class Home: UITableViewController {
    
    @IBAction func setPlist(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        print(button.tag)
        var data = ""
        switch button.tag {
        case 0:
            data = "breakfast"
        case 1:
            data = "lunch"
        case 2:
            data = "dinner"
        default:
            print("Incorrect")
            break
        }
        loadData(file: data)
        
    }
    
    
    func loadData(file: String){
        
        var restaurants : [Restaurant] = []
        
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
                
                
                //check to see if the parks were created correctly
                for r in restaurants {
                    print("Home")
                    print("Restaurants: \(r) \n")
                }
                
                print(restaurants.count)
                
            }
            catch {
                print(error)
            }
        }
        
        let restaurantList = Restaurants()
        restaurantList.restaurantList = restaurants
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = storyBoard.instantiateViewController(withIdentifier: "listView") as! ListVC
//        detailVC.restaurantList = restaurantList
//        detailVC.title = file
//        navigationController?.pushViewController(detailVC, animated: true)

        let navVC = tabBarController!.viewControllers![1] as! UINavigationController
        let tableVC = navVC.viewControllers[0] as! ListVC
        tableVC.restaurantList = restaurantList
        navVC.pushViewController(tableVC, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

