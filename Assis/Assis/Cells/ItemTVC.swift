//
//  ItemTVC.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import UIKit

class ItemTVC: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Item) {
        self.labelTitle.text = item.title
        self.labelDescription.text = item.body
    }
    
}
