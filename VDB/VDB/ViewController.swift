//
//  ViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/10.
//

import UIKit
import RealmSwift

class VT : Object{
    @objc dynamic var id:String = NSUUID().uuidString
    @objc dynamic var Alliance:String = ""
    @objc dynamic var Name:String = ""
    @objc dynamic var Status:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    var allianceDistinctList = [String]()
    var nameList:Results<VT>? = nil
    var Alliance = ""
    var Name = ""
    var Id = ""
    var now = 0
    var count = 0
    var indexS = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = Realm.Configuration(schemaVersion:3)
        Realm.Configuration.defaultConfiguration = config
        
        tView.delegate = self
        tView.dataSource = self
        let realm = try! Realm()
        let allianceList:[String] =
            realm.objects(VT.self).value(forKey:"Alliance") as! [String]
        let distinctAlliance = Set(allianceList)
        allianceDistinctList = Array(distinctAlliance)
        allianceDistinctList.sort()
        
        
        btnBack.isEnabled = false
        btnEdit.isEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //let data = [allianceDistinctList,nameList!] as [Any]
        
        
        if( now == 0 ){
            count = allianceDistinctList.count
            if(count == 0){
                btnDelete.isEnabled = false
            }else{
                btnDelete.isEnabled = true
            }
        }
        else if(now == 1){
            count = nameList!.count
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if(now == 0){
            cell.textLabel?.text = allianceDistinctList[indexPath.row]
        }else if(now == 1){
            cell.textLabel?.text = nameList![indexPath.row].Alliance + "/" + nameList![indexPath.row].Name + "/" +
                nameList![indexPath.row].Status
        }
        return cell;
    }
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        if(now == 0){
            Alliance = allianceDistinctList[indexPath.row]
            
            now = 1
            btnBack.isEnabled = true
            
            let realm = try! Realm()
            nameList = realm.objects(VT.self).filter("Alliance = '\(Alliance)'")
            
            tableView.reloadData()
        }
        else if(now == 1){
            Name = nameList![indexPath.row].Name
            Id = nameList![indexPath.row].id
            btnEdit.isEnabled = true
            indexS = indexPath.row
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        now = 0
        btnBack.isEnabled = false
        btnEdit.isEnabled = false
        tView.reloadData()
    }
    

    @IBAction func edit(_ sender: UIButton) {
        if(now == 1 && Id != "")
            {
            let storyboard:UIStoryboard = self.storyboard!
            
//            let nextViewController:UpdateViewController = storyboard.instantiateViewController(withIdentifier:"UpdateViewController") as! UpdateViewController
            let nextViewController:RegisterViewController = storyboard.instantiateViewController(withIdentifier:"RegisterViewController") as! RegisterViewController
            
            nextViewController.name = Name
            nextViewController.id = Id
            nextViewController.mode = 1
            
            self.present(nextViewController,animated: true, completion: nil)}
    }
    
}

