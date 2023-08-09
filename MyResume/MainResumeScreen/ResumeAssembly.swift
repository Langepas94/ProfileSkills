//
//  ResumeAssembly.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation
import UIKit

struct ResumeAssembly {
    
    let viewModel: MainScreenViewModelProtocol = MainScreenViewModel()
    
    func getResumeViewController() -> UIViewController {
        let resumeViewController = MainResumeViewController(viewModel: viewModel)
        return resumeViewController
    }
}
