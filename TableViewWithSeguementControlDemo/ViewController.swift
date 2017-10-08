//
//  ViewController.swift
//  TableViewWithSeguementControlDemo
//
//  Created by Centell on 2017. 8. 23..
//  Copyright © 2017년 Centell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var firstTitle = [String?]()
    var secondTitle = [String?]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFirstData()
        
    }
    
// MARK: - Functions
    func getFirstData(){
        firstTitle = ["a","b","c","d"]
        
        tableView.reloadData()
    }
    
    func getSecondData() {
        secondTitle = ["1","2","3","4","5"]
        tableView.reloadData()
    }
    
    func removeData() {
        firstTitle.removeAll()
        secondTitle.removeAll()
    }
    
// MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("0")
            return firstTitle.count
        case 1:
            print("1")
            return secondTitle.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("0")
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCell", for: indexPath) as! FirstTableViewCell
            firstCell.titleLbl.text = firstTitle[indexPath.row]
            cell = firstCell as FirstTableViewCell
            
        case 1:
            print("1")
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as! SecondTableViewCell
            secondCell.titleLbl.text = secondTitle[indexPath.row]
            cell = secondCell as SecondTableViewCell
            
        default:
            break
        }
        
        return cell
    }
    
// MARK: - Actions
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        removeData()
        tableView.reloadData()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("0")
            getFirstData()
        case 1:
            print("1")
            getSecondData()
        default:
            break
        }
    }


}

