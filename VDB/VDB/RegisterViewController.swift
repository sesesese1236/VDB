//
//  RegisterViewController.swift
//  VDB
//
//  Created by WENDRA RIANTO on 2021/06/24.
//

import UIKit

import RealmSwift

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let vt:VT = VT()
    let realm = try! Realm()
    @IBOutlet weak var Alliance: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Status: UIPickerView!
    let status = ["Active","Retire","Vacuum","Incoming"]
    var statusStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Status.delegate = self
        Status.dataSource = self
        statusStr = status[Status.selectedRow(inComponent: 0)]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
    }
    
    @IBAction func Register(_ sender: UIButton) {
        vt.Alliance = Alliance.text!
        vt.Name = Name.text!
        vt.Status = statusStr
        
        try! realm.write {
            realm.add(vt)
        }
    }
    func numberOfComponents(in Status: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ Status: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    func pickerView(_ Status: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return status[row]
    }
    func pickerView(_ Status: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
       statusStr = status[row]
    }
    
    
}


