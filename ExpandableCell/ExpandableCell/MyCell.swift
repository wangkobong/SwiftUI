//
//  MyCell.swift
//  ExpandableCell
//
//  Created by sungyeon kim on 2022/07/31.
//

import UIKit
import SnapKit

class MyCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    private var toggleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "triangle.fill")
        return imageView
    }()
    
    private(set) var tableLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    private func configureUI() {

        [toggleImage, tableLabel].forEach {
            contentView.addSubview($0)
        }
        
        toggleImage.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(20)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.top.equalTo(self.snp.top).offset(10)
        }
        
        tableLabel.snp.makeConstraints {
            $0.leading.equalTo(toggleImage.snp.trailing).offset(10)
            $0.top.equalTo(toggleImage)
        }
        
    }
}
