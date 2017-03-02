//
//  AttractionTableViewCell.swift
//  PeekandPop
//
//  Created by Apple28 on 3/2/17.
//  Copyright © 2017 Apple28. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAttraction: UIImageView!
    @IBOutlet weak var lblAttraction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
