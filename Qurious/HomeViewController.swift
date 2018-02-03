//
//  HomeViewController.swift
//  Qurious
//
//  Created by 楊千緯 on 2018/2/3.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITabBarControllerDelegate {

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.index(of: viewController){
            if index == 2 && tabBarController.selectedViewController == viewController{
                
            }
        }
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
