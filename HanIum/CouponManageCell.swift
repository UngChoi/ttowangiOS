//
//  CouponManageCell.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 8. 16..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class CouponManageCell: UITableViewCell {

    
    @IBOutlet weak var couponName: UILabel!
    @IBOutlet weak var couponBenefit: UILabel!
    @IBOutlet weak var couponNeed: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
