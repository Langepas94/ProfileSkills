//
//  AddSkillCell.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

final class AddSkillCell: UICollectionViewCell {
    
    // MARK: Pulic properties
    
    static let reuseID = "AddCell"
    
    // MARK: - Private properties & methods
    
    private lazy var titleLabel = UILabel()
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .systemGray6
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 8
        titleLabel.numberOfLines = 1
        
        titleLabel.text = "+"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width,
                                height: layoutAttributes.frame.height)
        let targetAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
        let textSize = titleLabel.sizeThatFits(targetSize)
        targetAttributes.frame.size = CGSize(width: ceil(textSize.width + 20) ,
                                             height: ceil(textSize.height) )
        return targetAttributes
    }
    
    // MARK: Init's
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
