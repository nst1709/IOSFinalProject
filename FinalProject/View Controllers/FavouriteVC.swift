//
//  FavouriteVC.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/21/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit
import RealmSwift

class FavouriteVC: UITableViewController {

    var restaurantList = Restaurants()
    
    var favs: [String] = []
    
    var restaurants : [Restaurant] { 
        get {
            return self.restaurantList.restaurantList
        }
        set(val) {
            self.restaurantList.restaurantList = val
        }
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.8196, green: 0.1255, blue: 0.0824, alpha: 1.0)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        favs = []
        let config = Realm.Configuration()
        let realm = try! Realm(configuration: config)

        let results = realm.objects(Favourite.self)
        for r in results{
            self.favs.append(r.name)
        }
        
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
        return favs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = favs[indexPath.row]

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailedView") as! DetailVC
        var index = 0
        for r in restaurants{
            if r.name == favs[indexPath.row]{
                index = restaurants.index(of: r)!
            }
        }
        let restaurant = restaurants[index]
        detailVC.restaurant = restaurant
        detailVC.title = restaurant.title
        navigationController?.pushViewController(detailVC, animated: true)
    }


    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let config = Realm.Configuration()
            let realm = try! Realm(configuration: config)
            let item = realm.objects(Favourite.self).filter("name = '\(favs[indexPath.row])'")
            try! realm.write{
                realm.delete(item)
            }
            favs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
