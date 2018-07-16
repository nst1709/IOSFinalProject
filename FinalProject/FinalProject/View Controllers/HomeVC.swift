//
//  HomeVC.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/22/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit
import CoreLocation

class HomeVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        // Configure the cell...
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesView", for: indexPath)
            return cell
        }

        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesView2", for: indexPath)
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesView3", for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var file = ""
        
        switch indexPath.section{
            case 0:
                file = "breakfast"
            case 1:
                file = "lunch"
            case 2:
                file = "dinner"
            default:
                break
        }
        
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
                    print("Restaurants: \(r) \n")
                }
                
            }
            catch {
                print(error)
            }
        }
        
        let restaurantList = Restaurants()
        restaurantList.restaurantList = restaurants
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "listView") as! ListVC
        detailVC.restaurantList = restaurantList
        detailVC.title = file.capitalized
        navigationController?.pushViewController(detailVC, animated: true)
    }
    

}
