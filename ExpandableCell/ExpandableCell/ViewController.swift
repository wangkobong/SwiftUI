//
//  ViewController.swift
//  ExpandableCell
//
//  Created by sungyeon kim	 on 2022/07/31.
//

import UIKit

class Section {
    let title: String
    let options: [String]
    var isOpened = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class ViewController: UIViewController {
    
    
//    let cellId = "cellId123123"
//
    var twoDimensionArray = [
        ExpandableNames(isExpanded: true, names: ["Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"]),
        ExpandableNames(isExpanded: true, names: ["Carl", "Chris", "Christina", "Cameron"]),
        ExpandableNames(isExpanded: true, names: ["David", "Dan"]),
        ExpandableNames(isExpanded: true, names: ["Patrick", "Patty"]),
    ]

//    var showIndexPaths = false
//
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.identifier)
        return tableView
    }()
    
    private var sections = [Section]()
    
    var showIndexPaths = false


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        sections = [
            Section(title: "메인업무1", options: ["메인 업무 1", "메인 업무 2"]),
            Section(title: "메인업무2", options: ["메인 업무 1", "메인 업무 2"]),
            Section(title: "메인업무3", options: ["메인 업무 1", "메인 업무 2"]),
        ]
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    @objc private func handleExpandClose() {
        print("Trying to expand and close section...")
        let section = 0
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionArray[0].names.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
//        twoDimensionArray[section].removeAll()
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        return button
        
//        let label = UILabel()
//        label.text? = "Header"
//        label.backgroundColor = .lightGray
//        return label
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        34
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        twoDimensionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        twoDimensionArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.identifier, for: indexPath) as? MyCell else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.tableLabel.text = sections[indexPath.section].title
            cell.tableLabel.textColor = .white
            cell.backgroundColor = .systemGray
            return cell
        } else {
            cell.tableLabel.text = sections[indexPath.section].options[indexPath.row - 1]
            cell.backgroundColor = .systemGray3
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
            
        } else {
            print("tapped sub cell")
        }
    }
}
