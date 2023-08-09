//
//  ResumeItem.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

class ResumeItem: Hashable, Codable, Equatable {
    
    private let identifier = UUID()
    
    let text: String
    
    static func == (lhs: ResumeItem, rhs: ResumeItem) -> Bool {
        return lhs.text == rhs.text
    }
    
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    hasher.combine(text)
    }
    
    init(text: String) {
        self.text = text
    }
    
}
