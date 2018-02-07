//
//  HomeViewController.swift
//  Qurious
//
//  Created by 楊千緯 on 2018/2/3.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController , UITabBarControllerDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    @IBAction func homeSegue(segue:UIStoryboardSegue){
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.index(of: viewController){
            if index == 2 && tabBarController.selectedViewController == viewController{
                if let navi = self.navigationController {
                    navi.viewControllers = [navi.viewControllers[0]]
                }
            }
        }
    }
    ////////////////////////////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        var isLogined = userDefaults.value(forKey: "isLogined") as? Bool
        if isLogined != nil && isLogined! {
            print("123")
        }
        else{
            print("456")
            var logVC = self.storyboard?.instantiateViewController(withIdentifier: "LogVC")
            present(logVC!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpSearchBar()
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 40)/2 , height: (self.collectionView.frame.size.height - 80)/3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    ////////////////////////////////////////////
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let subjects = ["Chinese國文", "Design設計", "ComputerSience資訊科學", "Education教育", "Phychology心裡學", "Business商業", "Math數學", "Music音樂"]
    
    var currentSubjects = [""]
    
    let subjectImages: [UIImage] = [
        UIImage(named: "Chinese")!,
        UIImage(named: "Design")!,
        UIImage(named: "ComputerScience")!,
        UIImage(named: "Education")!,
        UIImage(named: "Phychology")!,
        UIImage(named: "Business")!,
        UIImage(named: "Math")!,
        UIImage(named: "Music")!
    ]
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCollectionViewCell
        
        cell.subjectLabel.text = currentSubjects[indexPath.item]
        cell.subjectImageView.image = subjectImages[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let subjectsVC = storyboard.instantiateViewController(withIdentifier: "SubjectsVC")  as! SubjectsViewController

            var b = [CellData]()
            if indexPath.row == 0 {
            b.append(CellData(label: "Chinese國文"))
            subjectsVC.receiveData = b
            }
            if indexPath.row == 1 {
                b.append(CellData(label: "Design設計"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 2 {
                b.append(CellData(label: "ComputerSience資訊科學"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 3 {
                b.append(CellData(label: "Education教育"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 4 {
                b.append(CellData(label: "Phychology心裡學"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 5 {
                b.append(CellData(label: "Business商業"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 6 {
                b.append(CellData(label:"微積分"))
                b.append(CellData(label:"統計學"))
                b.append(CellData(label:"線性代數"))
                subjectsVC.receiveData = b
            }
            if indexPath.row == 7 {
                b.append(CellData(label: "Music音樂"))
                subjectsVC.receiveData = b
            }
        present(subjectsVC, animated: true, completion: nil)
    }

    
    //search Bar
    
    //預設 有所有類別的版面
    func setUpSearchBar(){
        searchBar.delegate = self
        currentSubjects = subjects
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentSubjects = subjects
            //讓清除輸入值後 reload data
            collectionView.reloadData()
            return
        }
        print(subjects)
        
        
        //        currentSubjects = subjects.filter({ subject -> Bool in
        //            return subject.lowercased().contains(searchText.lowercased())
        //        })
        currentSubjects = subjects.filter({ $0.lowercased().contains(searchText.lowercased())
        })
        collectionView.reloadData()
        print(currentSubjects)
    }
    
    

    
    

}
