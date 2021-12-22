//
//  NearByPlacesTableViewCell.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class NearByPlacesTableViewCell: UITableViewCell {
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var catName:UILabel!
    @IBOutlet weak var distance:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
