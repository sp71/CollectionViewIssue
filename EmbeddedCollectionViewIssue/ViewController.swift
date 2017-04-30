//
//  ViewController.swift
//  EmbeddedCollectionViewIssue
//
//  Created by Satinder Singh on 4/30/17.
//  Copyright © 2017 Satinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // If horizontal layout, then display 3 rows (with heights 200)
    // If veritcal layout, then display 1 row (with height of full tableview height)
    var isHorizontal = true

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
        isHorizontal = !isHorizontal
        sender.title = isHorizontal ? "Vertical" : "Horizontal"
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isHorizontal ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmbeddedTableViewCell", for: indexPath) as! EmbeddedTableViewCell
        cell.setup(isHorizontal: isHorizontal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isHorizontal ? 200 : tableView.frame.height
    }
}

