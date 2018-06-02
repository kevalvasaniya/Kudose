//
//  FilterPostCell.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/23/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class FilterPostCell: UITableViewCell {

    @IBOutlet weak var imgFilterPost: UIImageView!
    @IBOutlet weak var imgSelectPost: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
