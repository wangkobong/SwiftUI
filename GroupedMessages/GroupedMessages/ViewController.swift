//
//  ViewController.swift
//  GroupedMessages
//
//  Created by sungyeon kim on 2022/08/05.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

class ViewController: UITableViewController {
    
    private let cellID = "id"
    
    let chatMessages = [
        ChatMessage(text: "Here's my very first message.", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text: "ㅋㅋㅋ", isIncoming: false),
    ]
    
//    let textMessages = [
//        "Here's my very first message.",
//        "I'm going to message another long message that will word wrap",
//        "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap ",
//        "Yo, dawg, whaddup!",
//        "z"
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = chatMessages[indexPath.row].text
        let chatMessage = chatMessages[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as? ChatMessageCell else {
            return UITableViewCell()
        }
        
        cell.chatMessage = chatMessage
        cell.messageLabel.text = message
        return cell
    }
    

}

