//
//  UpdateListViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/17.
//

import UIKit
import RealmSwift


class UpdateListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    let vt:VT = VT()
    let realm = try! Realm()
    @IBOutlet weak var tView: UITableView!
    
    var datalist=["a","b","c","d","e"]
    override func viewDidLoad(){
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
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
        
        let nextViewController:UpdateNameListViewController = storyboard.instantiateViewController(withIdentifier:"UpdateNameListViewController") as! UpdateNameListViewController
        
        nextViewController.name = datalist[indextPath.row]
        nextViewController.skill1 = "test1"
        nextViewController.skill2 = "test2"
        nextViewController.skill3 = "test3"
        nextViewController.skill4 = "test4"
        
        self.present(nextViewController,animated: true, completion: nil)
    }
}
