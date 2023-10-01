//
//  LaunchScreenView.swift
//  LaunchScreenBootcamp
//
//  Created by MostlyiOS on 2023-09-30.
//

import SwiftUI

struct LaunchScreenView: View {
    
    
    @EnvironmentObject var launchScreenManager : LaunchScreenManager
    
    @State  private var  firstIsAnimating : Bool = false
    @State private var secondIsAnimating : Bool = false
    
    private  let timer = Timer.publish(every: 0.55, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color("logo-color").edgesIgnoringSafeArea(.all)
            Image("logo")
                .scaleEffect(firstIsAnimating ? 0.7 : 1)
                .scaleEffect(secondIsAnimating ? UIScreen.main.bounds.size.height/5 : 1)
                .onReceive(timer){ _ in
                    
                    switch launchScreenManager.state{
                    case .first :
                        withAnimation(Animation.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.8)){
                            firstIsAnimating.toggle()
                        }
                    case .second:
                        withAnimation(Animation.easeInOut(duration: 1)){
                            secondIsAnimating.toggle()
                        }
                    case .completed:
                        break
                    }
                    
                }
                .opacity(secondIsAnimating ? 0.5 : 0.8)
        }
    }
    
    struct LaunchScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreenView()
        }
    }
}
