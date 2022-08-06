//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by sungyeon kim on 2022/08/06.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    static let identifier = "ChatMessageCell"

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        // MARK: - MESSAGE LABEL
        [messageLabel, bubbleBackgroundView].forEach {
            addSubview($0)
        }
 
//        messageLabel.backgroundColor = .green
  
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
       let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
       ]
        
        
        
        NSLayoutConstraint.activate(constraints)
        
        // MARK: - BACKGROUND VIEW
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 5
        
        
    }
}
