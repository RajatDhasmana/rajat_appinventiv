//
//  VehiclesVC.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class FilteredDataModel{
    
    var datafiltered : [[String:Any]]?
    
    
    init(jsondata data : [[String:Any]] , category : Category , company : Carcompany) {
        
        switch (company as Carcompany , category as Category) {
        
        case (.audi , .car) :
            
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "AUDI"
            })

            
        case (.bmw , .car) :
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "BMW"
            })
        
            
            
        case (.lamborghini , .car) :
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
        
        default : fatalError("not found")
        
        }

        
    }
}

class DataModel {
    
    var carcategory : String
    var carcompany : String
    var carimage : UIImage
    
    init(jsondata data : [String:Any]) {
        
        carcategory = data["category"] as! String
        carcompany = data["carcompany"] as! String
        carimage = data["carimage"] as! UIImage
        

    }
    
}

enum Category {
    case car
    case bike
}

enum Carcompany {
    case audi
    case bmw
    case lamborghini
}


class VehiclesVC: UIViewController {

    
    @IBOutlet weak var mainTableView: UITableView!
    
    var counter : Int?
   
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        let cellNib1 = UINib(nibName: "CellForCollectionTableViewCell", bundle: nil)
        mainTableView.register(cellNib1, forCellReuseIdentifier: "CellForCollectionTableViewCellID")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension VehiclesVC : UITableViewDelegate , UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "CellForCollectionTableViewCellID", for: indexPath) as! CellForCollectionTableViewCell
        switch (indexPath.row , indexPath.section) {
        case (0 , 0) :
            tablecell.category = .car
            tablecell.company = .audi
            tablecell.carCompanyLabel.text = "AUDI"
            return tablecell

        case (1 , 0):
            tablecell.category = .car
            tablecell.company = .bmw
            tablecell.carCompanyLabel.text = "BMW"
            return tablecell

        case (2 , 0) :
            tablecell.category = .car
            tablecell.company = .lamborghini
            tablecell.carCompanyLabel.text = "LAMBORGHINI"
            return tablecell

        default :
            fatalError("not found")
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "CARS"
        default:
            fatalError("not found")
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
       

}

