//
//  ConferenceroomViewController.swift
//  Qurious
//
//  Created by 陳昭潔 on 2018/2/4.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ConferenceroomViewController: UIViewController {

    @IBOutlet weak var userMail: UILabel!
    @IBAction func LogoutAction(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                dismiss(animated: true, completion: nil)
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        userDefaults.set(false, forKey: "isLogined")
        userDefaults.synchronize()
        var LogVC = self.storyboard?.instantiateViewController(withIdentifier: "LogVC")
        present(LogVC!, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userMail.text = Auth.auth().currentUser?.email
    }
    
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
