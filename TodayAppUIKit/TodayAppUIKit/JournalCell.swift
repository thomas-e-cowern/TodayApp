//
//  JournalCell.swift
//  TodayAppUIKit
//
//  Created by Thomas Cowern on 9/1/22.
//

import UIKit

class JournalCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var previewTextView: UILabel!
//    @IBOutlet weak var monthLabel: UILabel!
//    @IBOutlet weak var dayLabel: UILabel!
//    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var previewImageWidth: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
