//  MenuTableViewCell.swift
//  MenuSlider
//  Created by vivek on 7/25/18.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    //MARK:- Outlet
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    //MARK:- Variables
    
    let cellArray = ["Row - 1", "Row - 2", "Row - 3", "Row - 4", "Row - 5"] //adjust according to your needs
    
    static var reuseIdentifier: String {
        get {
            return String(describing: self)
        }
    }
    
    static var nib:UINib {
        get {
            return UINib(nibName: String(describing: self), bundle: nil)
        }
    }
    
    //MARK:- Cell Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(indexNumber: NSInteger) {
        cellTitleLabel.text = cellArray[indexNumber]
    }
    
}
