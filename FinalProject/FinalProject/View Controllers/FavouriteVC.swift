//
//  FavouriteVC.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/21/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit

class FavouriteVC: UITableViewController {

    var restaurantList = Restaurants()

    var favRestaurants = UserDefaults.standard.array(forKey: "restaurants") as? [Restaurants]
    
    var favs = UserDefaults.standard.array(forKey: "favorites") as? [String]
    
    var restaurants : [Restaurant] { //front end for LandmarkList model object
        get {
            return self.restaurantList.restaurantList
        }
        set(val) {
            self.restaurantList.restaurantList = val
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favs = UserDefaults.standard.array(forKey: "favorites") as? [String]
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favs!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = UIColor(red: 0.8196, green: 0.1255, blue: 0.0824, alpha: 1.0)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = favs?[indexPath.row]

        return cell
    }
    

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailedView") as! DetailVC
//        let restaurant = restaurants[indexPath.row]
//        detailVC.restaurant = restaurant
//        detailVC.title = restaurant.title
//        navigationController?.pushViewController(detailVC, animated: true)
//    }


    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

        // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favs?.remove(at: indexPath.row)
            restaurants.remove(at: indexPath.row)
            UserDefaults.standard.set(favs, forKey: "favorites")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


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
