//
//  ViewController.swift
//  0204SearchBarInTable
//
//  Created by 鄭致彥 on 2018/2/4.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class AnserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate  {

    @IBAction func Anser(segue:UIStoryboardSegue){
    }
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    ///?????????????????\\\
    var animalArray = [Animal]() //To Set Up Table
    ///?????????????????\\\
    var currentAnimalArray = [Animal]() // Update table

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimals()
        setUpSearchBar()


    }
    
     func setUpAnimals(){
        //unsolved
//        animalArray.append(Animal(name: "Econ請問經濟學在做什麼？", category: .unsolved, image: "8"))
//        animalArray.append(Animal(name: "ggg個體經濟學偏好理論", category: .unsolved, image: "8"))
//        animalArray.append(Animal(name: "hhh請問GDP/GNP的差別", category: .unsolved, image: "8"))
//        //solved
//        animalArray.append(Animal(name: "邊際成本問題", category: .solved, image: "7"))
//        animalArray.append(Animal(name: "什麼是邊際效用遞減？", category: .solved, image: "7"))
//        animalArray.append(Animal(name: "Morty", category: .solved, image: "7"))
        
        currentAnimalArray = animalArray
    }
    
     func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    //Search Bar Stays on Top
//    func alterLayout() {
//        table.tableHeaderViews = UIView()
//        table.estimatedSectionHeaderHeight = 50
//    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
            return UITableViewCell()
        }
        cell.nameLbl.text = currentAnimalArray[indexPath.row].name
        cell.categoryLbl.text = currentAnimalArray [indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named: currentAnimalArray[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NextVC")  as! CountryViewController
        nextVC.receiveData = [currentAnimalArray[indexPath.row]]
        present(nextVC, animated: true, completion: nil)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        //if Search bar is empty 讓原本所有的值load回來
        guard !searchText.isEmpty else {
            currentAnimalArray = animalArray
            //讓清除輸入值後 reload data
            table.reloadData()
            return
        }
        currentAnimalArray = animalArray.filter({ animal -> Bool in
            return animal.name.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    

}
class Animal{
    let name: String
    var category: AnimalType
    let image: String
    
    init(name: String, category: AnimalType, image: String){
        self.name = name
        self.category = category
        self.image = image
    }
}

//把AnimalType轉換成一個型別
enum AnimalType: String {
    case unsolved = "未解答"
    case solved = "已解答"
}

