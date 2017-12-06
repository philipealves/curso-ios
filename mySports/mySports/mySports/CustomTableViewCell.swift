//
//  CustomTableViewCell.swift
//  mySports
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var lblDuration: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
