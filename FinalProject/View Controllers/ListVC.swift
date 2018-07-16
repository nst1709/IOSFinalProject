//
//  ListVC.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit

class ListVC: UITableViewController {
    
    var restaurantList = Restaurants()

    var restaurants : [Restaurant] {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneCell", for: indexPath) as! restaurantTableViewCell

        // Configure the cell...
        let restaurant = restaurants[indexPath.row]
        cell.name?.text = restaurant.name
        cell.address?.text = restaurant.address
        cell.cuisine?.text = restaurant.cuisine
        cell.rating?.text = restaurant.rating
        
        if let url = URL(string: "https://d1dzqwexhp5ztx.cloudfront.net/imageRepo/4/0/80/27/139/IMG_0020_1_2_S.jpg") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    cell.restuaurantImage.image = image
                }
                }.resume()
            
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailedView") as! DetailVC
        let restaurant = restaurants[indexPath.row]
        detailVC.restaurant = restaurant
        detailVC.title = restaurant.title
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
