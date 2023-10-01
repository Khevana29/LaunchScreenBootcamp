//
//  LaunchScreenManager.swift
//  LaunchScreenBootcamp
//
//  Created by MostlyiOS on 2023-09-30.
//

import Foundation

enum LaunchScreenState{
    
    case first
     case second
    case  completed
    
}

final class LaunchScreenManager : ObservableObject{
    
    @Published private(set) var state : LaunchScreenState = .first
    func dismiss(){
        
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline : .now() + 1){
            self.state = .completed
        }
        
    }

    
}
