//
//  LoginView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 19/10/2023.
//

import Foundation
import SwiftUI

struct LoginView: View {

    @StateObject var vm = LoginVM()
    
    @State var loginState: LoginVM.LoginState = .ready
    @State var username: String = .init()
    @State var password: String = .init()

    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.lightGray.withAlphaComponent(0.4)).ignoresSafeArea()
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: Binding(get: {
                    loginState == .success
                }, set: { _, _ in
                    loginState = .ready
                })) {
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                
                VStack {
                    VStack(spacing: 20) {
                        ZStack {
                            TextField("Username", text: $username)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.teal).shadow(radius: 0, x: 8, y: 8))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 2)
                                }
                                
                        }
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.teal).shadow(radius: 0, x: 8, y: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            }
                            
                    }
                    .padding()
                    
                    HStack(spacing: 10) {
                        Button {
                            loginState = vm.login(with: username, password: password)
                        } label: {
                            Text("Login")
                                .font(Font.system(size: 15))
                                .foregroundColor(.some(.black.opacity(0.8)))
                                .fontWeight(.bold)
                                .frame(height: 30)
                                .cornerRadius(6)
                                .frame(width: 100, height: 40)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.black, lineWidth: 2)
                                }
                        }
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color.teal).shadow(radius: 0, x: 8, y: 8))
                        
                        
                        NavigationLink {
                            Text("Register page")
                        } label: {
                            HStack {
                                Text("Register")
                                    .font(Font.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.some(.black.opacity(0.8)))
                                    .frame(height: 30)
                            }
                            .cornerRadius(6)
                        }
                        .frame(width: 100, height: 40)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color.teal).shadow(radius: 0, x: 8, y: 8))
                        .overlay {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.black, lineWidth: 2)
                        }

                    }
                    .padding(.top, 4)
                }
            }
        }
        .alert(isPresented: Binding(get: {
            loginState == .failure
        }, set: { _, _ in
            loginState = .ready
        })) {
            Alert(title: Text("Error"),
                  message: Text("Invalid account"),
                  dismissButton: .default(Text("Dismiss")))
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
