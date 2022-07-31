//
//  ContactCell.swift
//  TableViewExample
//
//  Created by sungyeon kim on 2022/08/01.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var link: ViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // kind of cheat and use a hack
        let startButton = UIButton(type: .system)
        startButton.setImage(UIImage(systemName: "star"), for: .normal)
        startButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        startButton.tintColor = .red
        startButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = startButton
    }
    
    @objc func handleMarkAsFavorite() {
        print("didTap star")
        link?.someMethodIWantToCall(cell: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
