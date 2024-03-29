//
//  ViewController.swift
//  TableViewExample
//
//  Created by sungyeon kim on 2022/07/31.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    //https://www.letsbuildthatapp.com/course_video?id=1502
    //https://www.letsbuildthatapp.com/course_video?id=1802
    
    // you should use custom delegation properly instead
    func someMethodIWantToCall(cell: UITableViewCell) {
        // we're going to figure out which name we're clicking on
        guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
        print(indexPathTapped)
        
        let contact = twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row]
        print(contact)
        
        let hasFavorited = contact.hasFavorited
        
        twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row].hasFavorited = !hasFavorited
//        tableView.reloadRows(at: [indexPathTapped], with: .fade)
        
        cell.accessoryView?.tintColor = hasFavorited ? .lightGray : .red
    }
    
    var twoDimensionalArray = [
        ExpandableNames(isExpanded: true, names: ["Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"].map{ Contact(name: $0, hasFavorited: false) }),
        ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christina", "Cameron"].map { Contact(name: $0, hasFavorited: false)}),
        ExpandableNames(isExpanded: true, names: ["David", "Dan"].map { Contact(name: $0, hasFavorited: false) }),
        ExpandableNames(isExpanded: true, names: [Contact(name: "Patrick", hasFavorited: false)]),
    ]
    
    var showIndexPaths = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc private func handleShowIndexPath() {
        
        
        // build all the indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            print("----------------")
            for row in twoDimensionalArray[section].names.indices {
                print(section, row)
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
//        for index in twoDimensionalArray[0].indices {
//            let indexPath = IndexPath(row: index, section: 0)
//            indexPathsToReload.append(indexPath)
//        }
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableView.RowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }
    
    @objc private func handleExpandClose(button: UIButton) {
    
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        let section = button.tag
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
     
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
    
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleExpandClose(button:)), for: .touchUpInside)
        button.tag = section
        return button
        
//        let label = UILabel()
//        label.text = "Header"
//        label.backgroundColor = .lightGray
//        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        34
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        cell.link = self
        
        let contact = twoDimensionalArray[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        cell.accessoryView?.tintColor = contact.hasFavorited ? .red : .lightGray
        
        if showIndexPaths {
            cell.textLabel?.text = "\(contact.name) || Section: \(indexPath.section) Row: \(indexPath.row)"
        }

        return cell
    }
}

