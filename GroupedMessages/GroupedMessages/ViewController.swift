//
//  ViewController.swift
//  GroupedMessages
//
//  Created by sungyeon kim on 2022/08/05.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "id"
    
    let textMessages = [
        "Here's my very first message.",
        "I'm going to message another long message that will word wrap",
        "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap ",
        "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = textMessages[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as? ChatMessageCell else {
            return UITableViewCell()
        }
//        cell.messageLabel.text = "We want to provide a longer string that is actually going to wrap into the next line and maybe even third line."
//        cell.messageLabel.numberOfLines = 0
        cell.messageLabel.text = message
        return cell
    }
    

}

