//
//  FoodTableCell.swift
//  Caloric Calculator
//
//  Created by 박연주 on 2022/06/19.
//

import UIKit
import Foundation

class FoodTableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
