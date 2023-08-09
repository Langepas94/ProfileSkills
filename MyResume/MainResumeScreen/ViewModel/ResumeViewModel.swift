//
//  ResumeViewModel.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

final class MainScreenViewModel: MainScreenViewModelProtocol {
    
    @UserDefaultsStorage(defaultValue: MainScreenModel())
    private var allData: MainScreenModel
    
    
    // MARK: - public methods
    func getHabits() -> [ResumeItem] {
        
        return allData.myHabits
    }
    
    func passHabit(_ habit: ResumeItem) {
  
        if allData.myHabits.contains(habit) {
            print("don't repeat yourself")
        } else {
            allData.myHabits.append(habit)
        }
            
    }
    
    func deleteItem(_ index: Int) {
        allData.myHabits.remove(at: index)
    }
    
    func giveAllData() -> any MainScreenModelProtocol {
        return allData
    }
    
}
