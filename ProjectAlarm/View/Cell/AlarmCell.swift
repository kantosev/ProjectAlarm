//
//  AlarmCell.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import UIKit

class AlarmCell: UITableViewCell {

    @IBOutlet weak var alarmTitle: UILabel!
    @IBOutlet weak var alarmSubtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
