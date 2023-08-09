//
//  FooterView.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

final class FooterView: UICollectionReusableView {
    
    // MARK - Public
    static let reuseIdentifier = "footerView"
    
    // MARK: Private
    
    private lazy var aboutMe: UILabel = {
        let habits = UILabel()
        habits.translatesAutoresizingMaskIntoConstraints = false
        habits.numberOfLines = 1
        habits.textAlignment = .left
        habits.text = "О себе"
        habits.font = .boldSystemFont(ofSize: 16)
        return habits
    }()
    private lazy var about: UILabel = {
        let habits = UILabel()
        habits.translatesAutoresizingMaskIntoConstraints = false
        habits.numberOfLines = 2
        habits.textAlignment = .left
        habits.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        habits.font = .systemFont(ofSize: 14)
        return habits
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(aboutMe)
        addSubview(about)
        aboutMe.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutMe.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            aboutMe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            about.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 16),
            about.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            about.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
