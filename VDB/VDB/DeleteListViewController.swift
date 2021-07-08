//
//  DeleteListViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/17.
//

import UIKit
import RealmSwift

class DeleteListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tView: UITableView!
    
    var nameList:Results<VT>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
        let realm = try! Realm()
        nameList = realm.objects(VT.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        return nameList!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = nameList![indexPath.row].Alliance + "/"  + nameList![indexPath.row].Name
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        try! realm.write{
            realm.delete(nameList![indexPath.row])
        }
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        
        tableView.reloadData()
    }
}
