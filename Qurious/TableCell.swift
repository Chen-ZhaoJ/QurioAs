//
//  TableCell.swift
//  0204SearchBarInTable
//
//  Created by 鄭致彥 on 2018/2/4.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
