//
//  UpdateListViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/17.
//

import UIKit
import RealmSwift


class UpdateListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tView: UITableView!
    var allianceDistinctList = [String]()
    override func viewDidLoad(){
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
        let realm = try! Realm()
        let allianceList:[String] =
            realm.objects(VT.self).value(forKey:"Alliance") as! [String]
        let distinctAlliance = Set(allianceList)
        allianceDistinctList = Array(distinctAlliance)
        allianceDistinctList.sort()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return allianceDistinctList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allianceDistinctList[indexPath.row]
        return cell;
    }
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard:UIStoryboard = self.storyboard!
        
        let nextViewController:UpdateNameListViewController = storyboard.instantiateViewController(withIdentifier:"UpdateNameListViewController") as! UpdateNameListViewController
        
        nextViewController.Alliance = allianceDistinctList[indexPath.row]
        
        self.present(nextViewController,animated: true, completion: nil)
    }
}
