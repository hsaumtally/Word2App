//
//  ChapterCell.swift
//  Anaesthesia For Obstetrics
//
//  Created by Programming on 16/09/15.
//  Copyright © 2015 Programming. All rights reserved.
//

import Foundation
import UIKit

class ChapterCell: UITableViewCell {

        
    @IBOutlet var chapterName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}