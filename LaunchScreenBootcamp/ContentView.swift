import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State var animateGradiant: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors:  [Color.white,Color(#colorLiteral(red: 1, green: 0.4705882353, blue: 0, alpha: 1))],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            .hueRotation(Angle.degrees(animateGradiant ? 45 : 0))
            
            VStack {
                Text("Welcome to MostlyiOS")
                                    .foregroundColor(.white)
                                    .font(.system(size: 36, weight: .bold))
                                    .padding(.bottom, 20)
                                   
                                    .cornerRadius(10) // Round the corners
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)) // Add padding around the text
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            launchScreenManager.dismiss()
                        }
                    }
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                animateGradiant.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}

