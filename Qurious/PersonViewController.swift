//
//  PersonViewController.swift
//  Qurious
//
//  Created by 陳昭潔 on 2018/2/4.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class PersonViewController: UIViewController {

    
    
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var thirdview: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func valuechange(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstview.isHidden = false
            secondview.isHidden = true
            thirdview.isHidden = true
        case 1:
            firstview.isHidden = true
            secondview.isHidden = false
            thirdview.isHidden = true
        case 2:
            firstview.isHidden = true
            secondview.isHidden = true
            thirdview.isHidden = false
        default:
            break;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        // 使用 UISegmentedControl(items:) 建立 UISegmentedControl
        // 參數 items 是一個陣列 會依據這個陣列顯示選項
        // 除了文字 也可以擺放圖片 像是 [UIImage(named:"play")!,"晚餐"]
            segmentedControl.setTitle("個人", forSegmentAt: 0)
            segmentedControl.setTitle("發問紀錄", forSegmentAt: 1)
            segmentedControl.setTitle("解答紀錄", forSegmentAt: 2)
        
    
        // 設置外觀顏色 預設為藍色
        segmentedControl.tintColor = UIColor.black
        
        // 設置底色 沒有預設的顏色
        segmentedControl.backgroundColor =
            UIColor.lightGray
        
        // 設置預設選擇的選項
        // 從 0 開始算起 所以這邊設置為第一個選項
        segmentedControl.selectedSegmentIndex = 0
        firstview.isHidden = false
        secondview.isHidden = true
        thirdview.isHidden = true
        
//        // 設置切換選項時執行的動作
//        mySegmentedControl.addTarget(
//            self,
//            action:
//            #selector(PersonViewController.onChange),
//            forControlEvents: .ValueChanged)
        
        // 設置尺寸及位置並放入畫面中
        segmentedControl.frame.size = CGSize(
            width: fullScreenSize.width * 0.8, height: 30)
        segmentedControl.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.1)
        self.view.addSubview(segmentedControl)
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
