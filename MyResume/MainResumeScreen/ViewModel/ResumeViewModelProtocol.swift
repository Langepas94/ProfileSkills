//
//  ResumeViewModelProtocol.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

protocol MainScreenViewModelProtocol {
    
    func getHabits() -> [ResumeItem]
    
    func passHabit( _ habit: ResumeItem)
    
    func deleteItem(_ index: Int)
    
    func giveAllData() -> any MainScreenModelProtocol
}
