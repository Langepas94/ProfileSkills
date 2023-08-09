//
//  MainScreenModel.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

struct MainScreenModel: MainScreenModelProtocol {
    
    private let identifier = UUID()
    
    var profileImage: String = "image"
    
    var nameData: String = "Tyurmorezov Artem Vladimirovich"
    
    var location: String = "Volgograd"
    
    var detailData: String = "iOS разработчик, который хочет работать в Surf."
    
    var myHabits: [ResumeItem] = []
    
    var aboutMe: String = "Дополнить"
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
}
