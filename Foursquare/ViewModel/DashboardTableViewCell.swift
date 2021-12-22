//
//  DashboardTableViewCell.swift
//  Foursquare
//
//  Created by Shahzaib khan on 26/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var distance:UILabel!
    @IBOutlet weak var category:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
