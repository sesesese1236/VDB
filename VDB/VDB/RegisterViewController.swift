//
//  RegisterViewController.swift
//  VDB
//
//  Created by WENDRA RIANTO on 2021/06/24.
//

import UIKit

import RealmSwift

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public var name:String = ""
    public var id:String = ""
    public var mode:Int = 0
    
    let vt:VT = VT()
    let realm = try! Realm()
    var nameList:Results<VT>? = nil
    @IBOutlet weak var Alliance: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Status: UIPickerView!
    @IBOutlet weak var Input: UIButton!
    let status = ["Active","Retire","Vacuum","Incoming"]
    var statusStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Status.delegate = self
        Status.dataSource = self
        if(mode == 0){
            Input.setTitle("Register", for: .normal)
        }
        else if(mode == 1){
            nameList = realm.objects(VT.self).filter("id = '\(id)'")
            Name.text = nameList![0].Name
            Alliance.text = nameList![0].Alliance
        
            for i in 0...3{
                if status[i] == nameList![0].Status{
                    Status.selectRow(i, inComponent: 0, animated: true)
                    }
                }
            Input.setTitle("Edit", for: .normal)
            
        }
        statusStr = status[Status.selectedRow(inComponent: 0)]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
    }
    
    @IBAction func Register(_ sender: UIButton) {
        if(mode == 0){
            vt.Alliance = Alliance.text!
            vt.Name = Name.text!
            vt.Status = statusStr
        
            try! realm.write {
                realm.add(vt)
            }
        }
        
        else if(mode == 1){
            try! realm.write {
                nameList![0].Name = Name.text!
                nameList![0].Alliance = Alliance.text!
                nameList![0].Status = statusStr
            }
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


