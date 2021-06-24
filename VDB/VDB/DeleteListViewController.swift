//
//  DeleteListViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/17.
//

import UIKit
import RealmSwift

class DeleteListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    let vt:VT = VT()
    let realm = try! Realm()
    @IBOutlet weak var tView: UITableView!
    
    var datalist = ["a","b","c","d","e"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tView.delegate = self
        tView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        return datalist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "del:" + String(indexPath.section) + "/" + String(indexPath.row) + "/" + datalist[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        datalist.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        
        tableView.reloadData()
    }
}
