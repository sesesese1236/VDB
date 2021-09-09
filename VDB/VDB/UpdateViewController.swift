//
//  UpdateViewController.swift
//  VDB
//
//  Created by 先生 on 2021/06/17.
//

import UIKit
import RealmSwift

class UpdateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public var name:String = ""
    public var id:String = ""
    public var mode:Int = 0
    
    var nameList:Results<VT>? = nil
    
    @IBOutlet weak var Alliance: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Status: UIPickerView!
    let status = ["Active","Retire","Vacuum","Incoming"]
    var statusStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()

        nameList = realm.objects(VT.self).filter("id = '\(id)'")
        Name.text = nameList![0].Name
        Alliance.text = nameList![0].Alliance
        Status.delegate = self
        Status.dataSource = self
        
        for i in 0...3{
            if status[i] == nameList![0].Status{
                Status.selectRow(i, inComponent: 0, animated: true)
            }
        }
        statusStr = status[Status.selectedRow(inComponent: 0)]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
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
    @IBAction func edit(_ sender: UIButton) {
        let realm = try! Realm()
        try! realm.write {
            nameList![0].Name = Name.text!
            nameList![0].Alliance = Alliance.text!
            nameList![0].Status = statusStr
        }
    }
    
}
