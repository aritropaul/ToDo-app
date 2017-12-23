//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Aritro Paul on 23/12/17.
//  Copyright © 2017 NotACoder. All rights reserved.
//

import UIKit

var list = [" Buy Milk","Run 5 miles"]
var listItems = UserDefaults.standard
let listConstant = "1"


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        listItems.set(list, forKey: "1")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellValue = listItems.string(forKey: "1")
        cell.textLabel?.text = cellValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            list.remove(at: indexPath.row)
            listItems.set(list, forKey: "1")
            tableView.reloadData()
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

