//
//  RegisterViewController.swift
//  VDB
//
//  Created by WENDRA RIANTO on 2021/06/24.
//

import UIKit

import RealmSwift

class RegisterViewController: UIViewController {
    let vt:VT = VT()
    let realm = try! Realm()
    @IBOutlet weak var Alliance: UITextField!
    @IBOutlet weak var Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Register(_ sender: UIButton) {
        
    }
    
}


