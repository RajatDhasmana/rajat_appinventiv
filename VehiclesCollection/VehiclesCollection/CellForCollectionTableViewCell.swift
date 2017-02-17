//
//  CellForCollectionTableViewCell.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CellForCollectionTableViewCell: UITableViewCell  {

    
    @IBOutlet weak var carCompanyLabel: UILabel! 
    
    var company : Carcompany!
    var category : Category!
    var counter : [[String : Any]]?
    var filtereddictionary : [String : Any]?
    
    
    @IBOutlet weak var collectionViewOfItems: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
        collectionViewOfItems.delegate = self
        collectionViewOfItems.dataSource = self
    
        let cellNib2 = UINib(nibName: "VehiclesCollectionViewCell", bundle: nil)
        //collectionViewOfItems.register(cellNib2, forCellReuseIdentifier: "VehiclesCollectionViewCellID")
    
        collectionViewOfItems.register(cellNib2, forCellWithReuseIdentifier: "VehiclesCollectionViewCellID")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CellForCollectionTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (company as Carcompany , category as Category) {
            case (.audi , .car) :
                counter = datacollection.filter({ (value) -> Bool in
                    return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
                })
            return counter!.count
            
        case (.bmw , .car) :
            counter = datacollection.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
            return counter!.count
            
            
        case (.lamborghini , .car) :
            counter = datacollection.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
            return counter!.count

            
            
        default : fatalError("not found")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehiclesCollectionViewCellID", for: indexPath) as! VehiclesCollectionViewCell
        
        
        switch (company as Carcompany , category as Category) {
            
            case (.audi , .car) :
            
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell

        case (.bmw , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell

            
        case (.lamborghini , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell

        
        default : fatalError("not found")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
    func favButtonTapped(button : UIButton) {
        var cell : Any = button
        while !(cell is VehiclesCollectionViewCell) {
            cell = (cell as AnyObject).superview as Any
        }
        print(cell)
        let collectiontypecell = cell
        
        while !(cell is CellForCollectionTableViewCell) {

            cell = (cell as AnyObject).superview
        }
        print("cell")
        let tabletypecell = cell
        
        if button.isSelected == true {
            button.isSelected = false
            
        }
        else{
            button.isSelected = true
                    }
       
    }

    
    
    
}
