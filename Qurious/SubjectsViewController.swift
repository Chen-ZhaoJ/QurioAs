//
//  SubjectsViewController.swift
//  Qurious
//
//  Created by 楊千緯 on 2018/2/7.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , UISearchBarDelegate {

 
    @IBAction func subject(segue:UIStoryboardSegue){
        
    }
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    var receiveData = [CellData]()
    var currentReceiveData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentReceiveData = receiveData
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentReceiveData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SubjectsVCTableViewCell else {
            return UITableViewCell()
        }
        cell.subjectName.text = currentReceiveData[indexPath.row].label

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let anserVC = storyboard.instantiateViewController(withIdentifier: "AnserVC")  as! AnserViewController
        var b = [Animal]()
        if indexPath.row == 0{
            b.append(Animal(name: "Econ請問經濟學在做什麼？", category: .unsolved, image: "8"))
            b.append(Animal(name: "ggg個體經濟學偏好理論", category: .unsolved, image: "8"))
            b.append(Animal(name: "hhh請問GDP/GNP的差別", category: .unsolved, image: "8"))

            b.append(Animal(name: "邊際成本問題", category: .solved, image: "7"))
            b.append(Animal(name: "什麼是邊際效用遞減？", category: .solved, image: "7"))
            b.append(Animal(name: "Morty", category: .solved, image: "7"))
            anserVC.animalArray = b
        }
        present(anserVC, animated: true, completion: nil)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        //if Search bar is empty 讓原本所有的值load回來
        guard !searchText.isEmpty else {
            currentReceiveData = receiveData
            //讓清除輸入值後 reload data
            table.reloadData()
            return
        }
        currentReceiveData = receiveData.filter({ cellData -> Bool in
        return cellData.label.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
    
}
class CellData{
    let label: String
    
    init(label: String){
        self.label = label

    }
}

