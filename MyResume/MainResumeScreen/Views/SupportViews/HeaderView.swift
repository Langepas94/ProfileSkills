//
//  HeaderView.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

final class HeaderView: UICollectionReusableView {
    
    // MARK: - public properties
    
    static let reuseIdentifier = "header-reuse-identifier"
    var editingTapped: ((Bool) -> Void)?
    
    // MARK: - Private properties & methods
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var profileName: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .boldSystemFont(ofSize: 24)
        text.textAlignment = .center
        text.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1.0)
        text.numberOfLines = 2
        return text
    }()
    
    private lazy var detailData: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 14)
        text.textAlignment = .center
        text.numberOfLines = 2
        return text
    }()
    
    private lazy var location: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 14)
        text.textAlignment = .center
        text.numberOfLines = 1
        return text
    }()
    
    private lazy var habits: UILabel = {
        let habits = UILabel()
        habits.translatesAutoresizingMaskIntoConstraints = false
        habits.numberOfLines = 1
        habits.text = "Мои навыки"
        habits.font = .systemFont(ofSize: 16, weight: .medium)
        return habits
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    // MARK: - Init's
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - SetupUI

extension HeaderView {
    func configure(image: String, name: String, detail: String, locationText: String) {
        profileImage.image = UIImage(named: image)
        profileName.text = name
        detailData.text = detail
        location.text = locationText
    }
    
    func configureUI() {
        addSubview(habits)
        addSubview(editButton)
        
        NSLayoutConstraint.activate([
            habits.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            habits.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            habits.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            editButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        backgroundColor = .white
    }
    
    @objc func editButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        editingTapped?(sender.isSelected)
    }
}
