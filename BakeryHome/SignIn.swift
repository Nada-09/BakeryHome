//
//  SignIn.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack{
                Spacer()
                Capsule()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                Spacer()
            }
            .padding(.top, 8)
            
            HStack{
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            VStack(alignment: .leading) {
                
                Text("Email")
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 335, height: 48)
                    .background(Color.white)
                    .shadow(radius: 5, x: 0, y: 2)
                    .cornerRadius(12)
                    .shadow(radius: 5, x: 0, y: 2)
                    
            }
            .padding(.horizontal)
            
            VStack (alignment: .leading) {
                
                Text("Password")
                
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    }
                    else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
                .padding()
                .frame(width: 335, height: 48)
                .background(Color.white)
                .shadow(radius: 5, x: 0, y: 2)
                .cornerRadius(12)
                .shadow(radius: 5, x: 0, y: 2)
            }
            .padding(.horizontal)
            
            
            Button(action: {
                
            }) {
                Text("Sign In")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 48)
                    .background(Color.qolange)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
        }
        .padding(.bottom, 70)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


#Preview {
    SignIn()
}
