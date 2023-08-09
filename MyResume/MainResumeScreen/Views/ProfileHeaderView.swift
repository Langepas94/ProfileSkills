//
//  ProfileViewCell.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

final class ProfileHeaderView: UICollectionReusableView {
    
    // MARK: - Public
    static let reuseID = "ProfileCell"
    
    // MARK: - Private
    
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
        text.numberOfLines = 2
        return text
    }()
    
    private lazy var detailData: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1.0)
        text.textAlignment = .center
        text.numberOfLines = 2
        return text
    }()
    
    private lazy var location: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textAlignment = .center
        text.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1.0)
        text.numberOfLines = 1
        return text
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

extension ProfileHeaderView {
    func configure(image: String, name: String, detail: String, locationText: String) {
        profileImage.image = UIImage(named: image)
        profileName.text = name
        detailData.text = detail
        location.text = locationText
    }
    
    func configureUI() {
        
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(detailData)
        addSubview(location)
        
        backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            profileName.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 16),
            profileName.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            profileName.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            
            
            detailData.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 8),
            detailData.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 16),
            detailData.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            detailData.centerXAnchor.constraint(equalTo: profileName.centerXAnchor),
            
            location.topAnchor.constraint(equalTo: detailData.bottomAnchor, constant: 8),
            location.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 16),
            location.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            location.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
}
