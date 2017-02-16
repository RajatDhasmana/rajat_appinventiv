//
//  CellForCollectionTableViewCell.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CellForCollectionTableViewCell: UITableViewCell  {

    var company : Carcompany!
    var category : Category!
    var counter : [[String : Any]]?
    var filtereddictionary : [String : Any]?
    
    let datacollection = [
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi1")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi2")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi3")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi4")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi5")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi1")!],
        ["category":"CAR" , "carcompany":"AUDI" , "carimage":UIImage(named: "audi2")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini1")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini2")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini3")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini4")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini5")!],
        ["category":"CAR" , "carcompany":"LAMBORGHINI" , "carimage":UIImage(named: "lamborghini1")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw1")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw2")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw3")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw4")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw5")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw1")!],
        ["category":"CAR" , "carcompany":"BMW" , "carimage":UIImage(named: "bmw2")!]
    ]

    
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
            return collectioncell

        case (.bmw , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            return collectioncell

            
        case (.lamborghini , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            return collectioncell

        
        default : fatalError("not found")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 100)
    }
    
    
}
