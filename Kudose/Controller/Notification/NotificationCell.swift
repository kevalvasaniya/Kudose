//
//  NotificationCell.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgReplay: UIImageView!
    @IBOutlet weak var imgMail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
