//
//  ViewController.swift
//  tableJson
//
//  Created by Alex Rudoi on 183//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tv: UITableView!
    
    var cellID = "tableCell"
    var companiesArray: [String] = []
    var colors: [UIColor] = [.systemBlue, .cyan, .systemGreen, .systemIndigo, .systemPink, .systemOrange, .systemRed, .systemPurple, .systemTeal, .systemYellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        config()
    }

    func delegates() {
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 75
        tv.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
    }
    
    func config() {
        APIClient(viewController: self).fetchData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)as! TableViewCell
        
        cell.companyName.text = companiesArray[indexPath.row]
        cell.backView.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let infoSwipe = UIContextualAction(style: .destructive, title: "Info") { (contextualAction, view, boolValue) in
            
            let alert = UIAlertController(title: "This is an alert.", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        infoSwipe.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        let swipeActions = UISwipeActionsConfiguration(actions: [infoSwipe])
        
        return swipeActions
    }
    
}

