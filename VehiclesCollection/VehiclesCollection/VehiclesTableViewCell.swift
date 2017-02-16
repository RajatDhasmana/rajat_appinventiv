//
//  VehiclesTableViewCell.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class VehiclesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vehicleHeadingLabel: UILabel!
    
    
    @IBOutlet weak var viewForCollection: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configureCell(model datamodel : DataModel) {
//        
//        vehicleHeadingLabel.text = datamodel.carcategory
//        
//    }
    
}

extension VehiclesTableViewCell : UITableViewDataSource , UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForCollectionTableViewCellID", for: indexPath) as! CellForCollectionTableViewCell
    
        return cell
    
    }
    
    
}
