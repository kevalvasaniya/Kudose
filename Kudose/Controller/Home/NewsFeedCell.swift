//
//  NewsFeedCell.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/25/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lbluserName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var viewMediaContainer: UIView!
    @IBOutlet weak var ViewMediaHeightConstrain: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
