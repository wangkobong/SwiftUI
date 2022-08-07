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
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString)!
    }
}

class ViewController: UITableViewController {
    
    private let cellID = "id"
    
//    let chatMessages = [
//        ChatMessage(text: "Here's my very first message.", isIncoming: true),
//        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true),
//        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false),
//        ChatMessage(text: "ㅋㅋㅋ", isIncoming: false),
//    ]
    
    let chatMessages = [
        [
            ChatMessage(text: "Here's my very first message.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018"))
        ],
        [
            ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
            ChatMessage(text: "ㅋㅋㅋ", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018"))
        ],
        [
            ChatMessage(text: "Third Section message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let firstMessageInSection = chatMessages[section].first else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: firstMessageInSection.date)
        return "Date: \(dateString)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = chatMessages[indexPath.section][indexPath.row].text
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as? ChatMessageCell else {
            return UITableViewCell()
        }
        
        cell.chatMessage = chatMessage
        cell.messageLabel.text = message
        return cell
    }
    

}

