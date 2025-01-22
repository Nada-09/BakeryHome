//
//  SplashScreen.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 19/07/1446 AH.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    
    var body: some View {
        Image("Home Bakery Logo")
            .resizable()
            .frame(width:220, height: 260)

            .onAppear {
                DispatchQueue.main.asyncAfter (deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
    }
}

#Preview {
    SplashScreen()
}
