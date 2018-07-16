//
//  DetailVC.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit
import CoreLocation

class DetailVC: UITableViewController {
    
    var locationManager: CLLocationManager?
    var restaurant: Restaurant!
    let restaurantList = Restaurants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled(){
            locationManager!.requestWhenInUseAuthorization()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 300.0
        }
        else{
            return 75.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = UIColor(red: 0.8196, green: 0.1255, blue: 0.0824, alpha: 1.0)
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detail") as! DetailedTableViewCell!
                
//                cell!.restuaurantImage.image = restaurant.image
                
                cell!.name.text = restaurant.name
                cell!.address.text = restaurant.address
                cell!.cuisine.text = restaurant.cuisine
                cell!.rating.text = restaurant.rating
                cell!.cost.text = "Avg cost for two: $\(restaurant.cost)"
                return cell!
    
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "sub")
                cell!.textLabel?.text = "Menu"
                cell!.detailTextLabel?.text = restaurant.menu
                return cell!
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "sub")
                cell!.textLabel?.text = "Visit website"
                cell!.detailTextLabel?.text = restaurant.url
                return cell!
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "favourite")
                cell!.textLabel?.text = "Get Directions"
                return cell!
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "favourite")
                return cell!
            default:
                break
            }
        return UITableViewCell()
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        switch indexPath.section {
        case 1:
            let url = URL(string: restaurant.menu)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        case 2:
            let url = URL(string: restaurant.url)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        case 3:
            let coordinate = locationManager?.location?.coordinate //make sure location manager has updated before trying to use
            let url = String(format: "http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f", (coordinate?.latitude)!,(coordinate?.longitude)!,(restaurant.coordinate.latitude),(restaurant.coordinate.longitude))
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        case 4:
            let alertController = UIAlertController(title: "Favourites", message: "\(restaurant.name) added to favourites", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {(action) in }
            alertController.addAction(okAction)
            present(alertController, animated: true) {
                var array = UserDefaults.standard.array(forKey: "favorites") as? [String]
                if array != nil {
                    if !array!.contains(self.restaurant.name) {
                        array!.append(self.restaurant.name)
                    }
                } else {
                    array = []
                    array!.append(self.restaurant.name)
                }
                UserDefaults.standard.set(array, forKey:"favorites")
            }
//            restaurantList.restaurantList.append(self.restaurant)
//            let navVC = tabBarController!.viewControllers![1] as! UINavigationController
//            let tableVC = navVC.viewControllers[0] as! FavouriteVC
//            tableVC.restaurantList.restaurantList.append(restaurant)
        default:
            break
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
