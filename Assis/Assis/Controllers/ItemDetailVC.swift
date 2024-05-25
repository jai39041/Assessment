//
//  ItemDetailVC.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import UIKit

class ItemDetailVC: UIViewController {

    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelUserID: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Item Detail"
        self.renderItem()
    }
    
    func renderItem() {
        let itemID = ((self.item?.id == nil) ? "" : "\((self.item?.id)!)")
        let userID = ((self.item?.userID == nil) ? "" : "\((self.item?.userID)!)")
        self.labelID.text = "Item ID: " + itemID
        self.labelUserID.text = "User ID: " + userID
        self.labelTitle.text = self.item?.title
        self.labelDescription.text = self.item?.body
    }
    
    
}
