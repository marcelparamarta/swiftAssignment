//
//  TableViewCell.swift
//  AssessmentDay2
//
//  Created by P090MMCTSE008 on 18/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var salaryText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
