//
//  DataPageTableCellTableViewCell.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 12/12/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit

class DataPageTableCellTableViewCell: UITableViewCell {

    
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
