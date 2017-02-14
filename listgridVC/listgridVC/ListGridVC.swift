//
//  ListGridVC.swift
//  listgridVC
//
//  Created by Mohd Sultan on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class NameModel
{
    var name : String
    
    var imagecell : UIImage
    
    init(dict data : [String:Any]) {
        
        name = data["name"] as! String
        
        imagecell = data["imagename"] as! UIImage
        
    }
    
}

enum LayoutType {
    case grid
    case list
}
class ListGridVC: UIViewController , UIGestureRecognizerDelegate {
    var listLayout = ListLayout()
    var gridLayout = GridLayout()
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var listButton: UIButton!       
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var noOfPhotosLabel: UILabel!
    
    

    
    var layouttype = LayoutType.grid
    let names = [
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!]
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        let longPress = UILongPressGestureRecognizer(target: self , action: #selector(selectCell))
        longPress.delegate = self
        longPress.minimumPressDuration = 0.5
        mainCollectionView.addGestureRecognizer(longPress)
        mainCollectionView.allowsSelection = false
    self.mainCollectionView.setCollectionViewLayout(self.gridLayout, animated: true)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    @IBAction func listButtonPressed(_ sender: UIButton) {
        layouttype = LayoutType.list
        UIView.animate(withDuration: 0.9) { () -> Void in
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.mainCollectionView.setCollectionViewLayout(self.listLayout, animated: true)
        }
    }
    
  @IBAction  func gridButtonPressed(_ sender: UIButton) {
        layouttype = LayoutType.grid
        
        UIView.animate(withDuration:0.9) { () -> Void in
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.mainCollectionView.setCollectionViewLayout(self.gridLayout, animated: true)
        }
        }
}

extension ListGridVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let data = NameModel(dict : names[indexPath
                        .item])
        
        
        
        if layouttype == LayoutType.grid
        {
            
        let gridcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
            gridcell.configureCell(data: data)
            gridcell.isUserInteractionEnabled = true
            gridcell.layer.borderColor = UIColor.green.cgColor
            gridcell.layer.borderWidth = 2
            //print("grid")
            return gridcell
        
        }
        
        else
        {
            let listcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
            listcell.configureCell(data: data)
            listcell.isUserInteractionEnabled = true
            listcell.layer.borderColor = UIColor.blue.cgColor
            listcell.layer.borderWidth = 2
           // print("list")
            return listcell

        
        
        }
           }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let cell = self.mainCollectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.black
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath){
        
        let cell = self.mainCollectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
        
    
    }
    
    func selectCell(gesture : UILongPressGestureRecognizer!){
        if gesture.state == .ended {
            return
        }
        mainCollectionView.allowsMultipleSelection = true
        mainCollectionView.allowsSelection = true
        gesture.minimumPressDuration = 0.08
        let p = gesture.location(in: self.mainCollectionView)
        
        if let indexPath = self.mainCollectionView.indexPathForItem(at: p) {
            // get the cell at indexPath (the one you long pressed)
            let cell = self.mainCollectionView.cellForItem(at: indexPath)
            cell!.isSelected = true
//            cell?.backgroundColor = UIColor.blue            // do stuff with the cell
        } else {
            print("couldn't find index path")
            mainCollectionView.allowsMultipleSelection = false
            mainCollectionView.allowsSelection = false
        }
        }
}


class CollectionCell : UICollectionViewCell
{


    @IBOutlet weak var cellImage: UIImageView!

    func configureCell(data : NameModel)
    {
    cellImage.image = data.imagecell
    
    }
}
