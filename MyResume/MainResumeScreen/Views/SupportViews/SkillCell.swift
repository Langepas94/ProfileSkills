//
//  SkillCell.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

final class SkillCell: UICollectionViewCell {
    
    // MARK: Public properties
    
    static let reuseID = "SkillCell"
    
    var deletingClosure: (() -> Void)?
    
    // MARK: - Private properties
    
    private var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private var textLeading: NSLayoutConstraint?
    private var textTop: NSLayoutConstraint?
    private var textBottom: NSLayoutConstraint?
    private var textTrailingWithButton: NSLayoutConstraint?
    private var textTrailing: NSLayoutConstraint?
    private var buttonTrailing: NSLayoutConstraint?
    private var buttonCenterY: NSLayoutConstraint?
    
    // MARK: - Public methods
    func configure(text: String, isEditing: Bool) {
        contentView.layoutIfNeeded()
        titleLabel.text = text
        deleteButton.isHidden = !isEditing
        textTrailingWithButton?.isActive = isEditing
        textTrailing?.isActive = !isEditing
        buttonTrailing?.isActive = isEditing
        buttonCenterY?.isActive = isEditing
        contentView.layoutIfNeeded()
    }
    
    @objc func deleteTapped() {
        deletingClosure?()
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(deleteButton)
        
        deleteButton.isHidden = true
        
        textLeading = titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        textLeading?.isActive = true
        textTop = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        textTop?.isActive = true
        textBottom = titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        textBottom?.isActive = true
        textTrailingWithButton = titleLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -12)
        textTrailing = titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        textTrailing?.isActive = true
        buttonCenterY = deleteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        buttonTrailing = deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8

        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
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
