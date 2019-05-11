//
//  ProfileEmploymentTableViewCell.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit

class ProfileEmploymentTableViewCell: UITableViewCell {

    @IBOutlet var jobLbl: UILabel!
    @IBOutlet var detailLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var customerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
