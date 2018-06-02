//
//  CommentsCell.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/31/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class CommentsCell: UITableViewCell {

    @IBOutlet weak var imgUserPhoto: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var imgCommentType: UIImageView!
    @IBOutlet weak var commentViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
