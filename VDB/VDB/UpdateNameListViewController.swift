//
//  UpdateNameListViewController.swift
//  VDB
//
//  Created by WENDRA RIANTO on 2021/06/24.
//

import UIKit
import RealmSwift

class UpdateNameListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    let vt:VT = VT()
    let realm = try! Realm()
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var Name: UILabel!
    
    public var name:String = ""
    public var skill1:String = ""
    public var skill2:String = ""
    public var skill3:String = ""
    public var skill4:String = ""
    var datalist=["",""]
    override func viewDidLoad(){
        super.viewDidLoad()
        
        datalist=[skill1,skill2,skill3,skill4]
        tView.delegate = self
        tView.dataSource = self
        
        Name.text="Edit "+name
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return datalist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.section) + "/" + String(indexPath.row) + "/" + datalist[indexPath.row]
        return cell;
    }
    func tableView(_ tableView:UITableView, didSelectRowAt indextPath: IndexPath){
        let storyboard:UIStoryboard = self.storyboard!
        
        let nextViewController:UpdateViewController = storyboard.instantiateViewController(withIdentifier:"UpdateViewController") as! UpdateViewController
        
        nextViewController.name = datalist[indextPath.row]
        nextViewController.skill1 = "test1"
        nextViewController.skill2 = "test2"
        nextViewController.skill3 = "test3"
        nextViewController.skill4 = "test4"
        
        self.present(nextViewController,animated: true, completion: nil)
    }
}
