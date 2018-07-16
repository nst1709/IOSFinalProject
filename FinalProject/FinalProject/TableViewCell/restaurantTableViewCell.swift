//
//  restaurantTableViewCell.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit

class restaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restuaurantImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var cuisine: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
