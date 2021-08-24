//
//  TableViewCell.swift
//  FirstApp
//
//  Created by Navi on 7/29/21.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var assignData: Postmodel?{
        didSet{
            titleLabel.text = assignData?.title
            subTitleLabel.text = assignData?.body
        }
    }
}
