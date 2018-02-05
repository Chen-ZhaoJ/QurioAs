//
//  CreateAccountViewController.swift
//  Qurious
//
//  Created by 陳昭潔 on 2018/2/4.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    lazy var ref = Database.database().reference()
    @IBAction func picture1(_ sender: Any) {
    }
    @IBAction func picture2(_ sender: Any) {
    }
    @IBAction func picture3(_ sender: Any) {
    }
    @IBOutlet weak var picture1: UIButton!
    @IBOutlet weak var picture2: UIButton!
    @IBOutlet weak var picture3: UIButton!
    @IBAction func createAction(_ sender: Any) {
        let u = validatePassword(passwd: emailTextField.text!)
        
        
        
        if emailTextField.text == "" || passwordTextField.text != retypepassword.text || u != "OK" {
            //彈出警告
            let alertController = UIAlertController(title: "Error", message: "your email is empty or Security issue", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            //建立帳號
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil  {
                    //建立成功
                    let alertController = UIAlertController(title: "Success", message:"You have successfully signed up", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                        //成功後回前頁
                        self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    //        ref.setValue(["Label": textField.text])
                    //        加到child 節點下面
                    //        ref.child("Child").setValue(["Label": textField.text])
                    self.ref.childByAutoId().setValue(["Label": self.username.text])
                    self.aaa()
                } else {
                    //建立失敗，跳出警告
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    func aaa(){
        var refHandle = ref.observe(DataEventType.value, with: {(snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.username.text = postDict["Label"] as? String
            print(postDict["Label"])
        })
        // Do any additional setup after loading the view.
        
    }
    func validatePassword(passwd:String)-> String{
        var r = "No"
        var isLongEnough:Bool = false
        var hasUppercase = false
        var hasLowercase = false
        var hasNumber = false
        if passwd.count >= 8 {
            isLongEnough = true
        }
        for char:Character in passwd {
            let str:String = "\(char)"
            let num:Int? = Int(str)
            if (str.uppercased() == str) && (Int(str) == nil) {
                hasUppercase = true
            }
            if (str.lowercased() == str) && (Int(str) == nil)  {
                hasLowercase = true
            }
            if num == num{
                hasNumber = true
            }else{
                hasNumber = false
            }
        }
        if isLongEnough && hasNumber && hasUppercase && hasLowercase {
            r = "OK"
        }
        return r
    }
    @IBOutlet weak var retypepassword: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
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
