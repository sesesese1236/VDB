//
//  UpdateNameListViewController.swift
//  VDB
//
//  Created by WENDRA RIANTO on 2021/06/24.
//

import UIKit
import RealmSwift

class UpdateNameListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var Name: UILabel!
    
    public var Alliance:String = ""

    var nameList:Results<VT>? = nil
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tView.delegate = self
        tView.dataSource = self
        
        let realm = try! Realm()
        Name.text="Edit "+Alliance
        nameList = realm.objects(VT.self).filter("Alliance = '\(Alliance)'")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return nameList!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameList![indexPath.row].Name + "/" +
            nameList![indexPath.row].Status
        return cell
    }
    func tableView(_ tableView:UITableView, didSelectRowAt indextPath: IndexPath){
        let storyboard:UIStoryboard = self.storyboard!
        
        let nextViewController:UpdateViewController = storyboard.instantiateViewController(withIdentifier:"UpdateViewController") as! UpdateViewController
        
        nextViewController.name = nameList![indextPath.row].Name
        nextViewController.id = nameList![indextPath.row].id
        
        self.present(nextViewController,animated: true, completion: nil)
    }
}
