//
//  ViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/10.
//

import UIKit
import RealmSwift

class VT : Object{
    @objc dynamic var id:String = NSSUID().uiidString
    @objc dynamic var Alliance:String? = nil
    @objc dynamic var Name:String? = nil
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = Realm.Configuration(schemaVersion:0)
        Realm.Configuration.defaultConfiguration = config
    }


}

