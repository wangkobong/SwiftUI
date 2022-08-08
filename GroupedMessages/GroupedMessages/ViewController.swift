//
//  ViewController.swift
//  GroupedMessages
//
//  Created by sungyeon kim on 2022/08/05.
//

import UIKit

struct ChatMessage: Hashable {
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
    
//    let chatMessages = [
//        [
//            ChatMessage(text: "Here's my very first message.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
//            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018"))
//        ],
//        [
//            ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
//            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
//            ChatMessage(text: "ㅋㅋㅋ", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018"))
//        ],
//        [
//            ChatMessage(text: "Third Section message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
//        ],
//    ]
    
    let messagesFromServer = [
        ChatMessage(text: "Here's my very first message.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
        ChatMessage(text: "ㅋㅋㅋ", isIncoming: false, date: .now),
        ChatMessage(text: "Third Section message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
    ]
    
    fileprivate func attemptToAssembleGroupMessages() {
        print("Attempt to group our messages together based on Date property")
        let groupedMessages = Dictionary(grouping: messagesFromServer) { message -> Date in
            return message.date
        }
        
        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach {
            let values = groupedMessages[$0]
            chatMessages.append(values ?? [])
        }
        


        
    }
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptToAssembleGroupMessages()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = .boldSystemFont(ofSize: 14)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            let width = originalContentSize.width + 20
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: width, height: height )
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let firstMessageInSection = chatMessages[section].first else { return UIView() }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: firstMessageInSection.date)

        let label = DateHeaderLabel()
        label.text = dateString
        let containerView = UIView()
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        return containerView
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

