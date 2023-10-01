//
//  LaunchScreenBootcampApp.swift
//  LaunchScreenBootcamp
//
//  Created by MostlyiOS on 2023-09-30.
//

import SwiftUI


@main
struct LaunchScreenBootcampApp: App {
    
    @StateObject var launchScreenManager  = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()
                
                if(launchScreenManager.state != .completed){
                    LaunchScreenView()
                }
               
            }
            .environmentObject(launchScreenManager)
           
        }
    }
}
