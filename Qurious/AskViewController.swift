//
//  AskViewController.swift
//  Qurious
//
//  Created by 楊千緯 on 2018/2/5.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class AskViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate{
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var fieldTextField: UITextField!
    @IBOutlet weak var subjectsTextField: UITextField!
    
    @IBOutlet weak var b: UILabel!
    
    @IBAction func aaaa(_ sender: Any) {
//            b.text = "\(a().count)"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickerView.isHidden = false
        a()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        pickerView.isHidden = true
    }
    
    
    
    let fields = ["國文", "數學", "心理學", "商學", "設計", "英文"]
    let mathSubjects = ["微積分","線性代數","三角函數","統計數學"]
        
        public func numberOfComponents(in pickerView: UIPickerView) -> Int{
            return 1
        }
    
        public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//            let test = a()
//            print(test)
               return currentValue.count
        }
    
    
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return currentValue[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            subjectLabel.text = subjects[row]
      
            
        }
    var currentValue:[String] = []
    func a ()  {
        
        
        if fieldTextField.isEditing == true {
            currentValue = fields
            
        }
        if subjectsTextField.isEditing == true {
            currentValue = mathSubjects
        }
        pickerView.reloadAllComponents()
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        fieldTextField.delegate = self
        subjectsTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
