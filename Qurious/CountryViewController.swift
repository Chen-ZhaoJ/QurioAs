//
//  CountryViewController.swift
//  0204SearchBarInTable
//
//  Created by 楊千緯 on 2018/2/6.
//  Copyright © 2018年 鄭致彥. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var receiveData:[Animal] = [Animal]()
    @IBOutlet weak var table: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
            return UITableViewCell()
        }
        cell.nameLbl.text = receiveData[indexPath.row].name
        cell.categoryLbl.text = receiveData [indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named: receiveData[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
    

    


