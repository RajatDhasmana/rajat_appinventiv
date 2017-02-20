//
//  MyntraVC.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 18/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit


class MyntraVC: UIViewController {

//MARK: IBOutlets
    @IBOutlet weak var myntraTableView: UITableView!
    
    var minimisetableindices = Array<IndexPath>()
//MARK: App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    
        myntraTableView.delegate = self
        myntraTableView.dataSource = self
        myntraTableView.allowsSelection = false
        let cellNib1 = UINib(nibName: "TableViewCell", bundle: nil)
        myntraTableView.register(cellNib1, forCellReuseIdentifier: "TableViewCellID")
        let cellNib3 = UINib(nibName: "HeaderViewController", bundle: nil)
        myntraTableView.register(cellNib3, forHeaderFooterViewReuseIdentifier: "HeaderViewControllerID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: extension UITableViewDataSource , UITableViewDelegate

extension MyntraVC : UITableViewDataSource , UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let celltable = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        let cellNib2 = UINib(nibName: "CollectionViewCell", bundle: nil)
        celltable.viewOfCollection.register(cellNib2, forCellWithReuseIdentifier: "CollectionViewCellID")
        celltable.viewOfCollection.delegate = self
        celltable.viewOfCollection.dataSource = self
        celltable.tableCellLabel.text = "Brand"
        celltable.toggleButton.addTarget(self, action: #selector(self.toggleButtonTapped), for: .touchUpInside)
        
        return celltable
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if minimisetableindices.contains(indexPath) {
            return 49
        }
        else {
            return 160
        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "MEN"
//        case 1: return "WOMEN"
//        case 2: return "KIDS"
//        default : fatalError("not found")
//            
//        }
//    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerobject = myntraTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewControllerID") as? HeaderViewController else {    fatalError("not found")      }
//        switch section {
//        case 0:  headerobject.headerLabel.text = "MEN"
//        case 1: headerobject.headerLabel.text = "WOMEN"
//        case 2: headerobject.headerLabel.text = "KIDS"
//        default:  fatalError("not found")
//            
//        }
          headerobject.headerLabel.text = "brand"
         return headerobject
        
    }
    
//MARK: Toggle button tapping
    
    func toggleButtonTapped(button : UIButton) {
        
        guard let cell = button.cellforview as? TableViewCell else{
            fatalError()
        }
        
        let celloftable = cell
        
        let rowoftable = myntraTableView.indexPath(for: celloftable)
        
        if button.isSelected {
                button.isSelected = false
                button.setTitle("-", for: .normal)
                print("is not selected")
                minimisetableindices = minimisetableindices.filter({ (indices) -> Bool in
                    return indices != rowoftable
                })
            
                myntraTableView.reloadRows(at: minimisetableindices, with: .none)
        }
            
        else {
            
            button.isSelected = true
            button.setTitle("+", for: .selected)
            print("is selected")
            minimisetableindices.append(rowoftable!)
            myntraTableView.reloadRows(at: minimisetableindices, with: .none)
        }
        
    }
}


//MARK: extension UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout

extension MyntraVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellcollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
        
        cellcollection.backgroundColor = UIColor.getRandomColor
        cellcollection.favouriteButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
        return cellcollection
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
//MARK: Favourite button tapping
    func favButtonTapped(button : UIButton) {
        
        
        if button.isSelected {
            button.isSelected = false
            
            }
        else{
            button.isSelected = true
            
    
        }
        
    }
    
}


