//
//  DetailedTableViewCell.swift
//  FinalProject
//
//  Created by Nikita Tribhuvan on 4/20/18.
//  Copyright © 2018 Nikita Tribhuvan. All rights reserved.
//

import UIKit

class DetailedTableViewCell: UITableViewCell {

    @IBOutlet weak var restuaurantImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var cuisine: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var menu: UILabel!
    @IBOutlet weak var images: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
