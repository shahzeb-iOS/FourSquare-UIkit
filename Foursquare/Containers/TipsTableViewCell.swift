//
//  TipsTableViewCell.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class TipsTableViewCell: UITableViewCell {
    @IBOutlet weak var date:UILabel!
    @IBOutlet weak var comment:UILabel!
    @IBOutlet weak var id:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
