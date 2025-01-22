//
//  OneCourse.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 22/07/1446 AH.
//

import SwiftUI

struct OneCourse: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
                .shadow(radius: 5, x: 0 , y: 0.5)
                .frame(width: 390, height: 100)
            
            
            HStack{
                RoundedRectangle(cornerRadius: 4.5)
                    .fill(Color.red)
                    .frame(width: 94, height: 85)
                
                
                VStack {
                    Text("Course Name")
                        .font(.system(size: 16, weight: .semibold))
                       
                    
                ZStack{
                    RoundedRectangle(cornerRadius: 39)
                        .fill(Color.blue)
                        .shadow(radius: 5, x: 0 , y: 0.5)
                        .frame(width: 67, height: 14)
                        
                    Text ("LEVEL")
                        .font(.system(size: 10, weight: .medium))
                        
                    }
                
                    HStack{
                        Image(systemName: "hourglass")
        
                        Text("2h")
                        
                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text("19 Feb - 4:00")
                        
                    }
                    
                }
                Spacer(minLength: 20)

            }
            
            .padding()
        }
     
        
    }
}

#Preview {
    OneCourse()
}
