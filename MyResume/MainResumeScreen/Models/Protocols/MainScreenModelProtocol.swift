//
//  MainScreenModelProtocol.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

protocol MainScreenModelProtocol: Hashable, Codable {
    
    var profileImage: String { get set }
    
    var nameData: String { get set }
    
    var location: String { get set }
    
    var detailData: String { get set }
    
    var myHabits: [ResumeItem] { get set }
    
    var aboutMe: String { get set }
}
