//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 09/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.selectionStyle = .none
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
        
    }

}
