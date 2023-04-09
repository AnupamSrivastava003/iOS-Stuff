//
//  GetStartedPage.swift
//  appdev7
//
//  Created by SKUBI on 21/03/23.
//

import SwiftUI

struct GetStartedPage: View {
    var body: some View {
        NavigationView() {
            ZStack{
                LinearGradient(colors: [Color(red: 0, green: 0, blue: 0.153),Color(red: 0.15, green: 0, blue: 0.153)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Circle()
                    .foregroundColor(.purple)
                    .blur(radius: 50)
                    .frame(width: 90)
                    .offset(x: -100, y: -150)
                
                Circle()
                    .foregroundColor(.blue)
                    .blur(radius: 80)
                    .frame(width: 90)
                    .offset(x: 170, y: -290)
                
                Circle()
                    .foregroundColor(.indigo)
                    .blur(radius: 200)
                    .padding(50)
                    .offset(x: -170, y: 230)
                
                Circle()
                    .foregroundColor(.purple)
                    .blur(radius: 100)
                    .frame(width: 200)
                    .offset(x: 230, y: 300)
                
                VStack{
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(maxWidth: 250, maxHeight: 300)
                            .foregroundColor(.white)
                            .opacity(0.08)
                            .blur(radius: 2)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .blue], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                                    .foregroundColor(.white)
                                    .opacity(0.2)
                            )
                        
                        VStack{
                            Image(systemName: "sun.min")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .foregroundColor(.white)
                                .opacity(0.5)
                            
                            HStack (alignment: .top){
                                Text("18")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                                    .bold()
                                
                                Text("o")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .bold()
                                
                                Text("C")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                            }
                            .padding()
                            
                            Text("Lucknow, India")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                                .opacity(0.6)
                        }
                    }
                    .padding(50)
                    
                    Text("Know everything \nabout the weather")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    
                    Text("Start now and know more about \nlocal weather instantly")
                        .foregroundColor(.gray)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(25)

                    
                    NavigationLink {
                        RegisterPage()
                    } label: {
                        Text("Get Started")
                            .bold()
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding()
                            .padding([.leading,.trailing],50)
                            .background(
                                LinearGradient(colors: [.purple, Color(red: 0, green: 0, blue: 1)], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(20)
                            
                    }
                    
//                    .foregroundColor(.black)
//                    .padding([.leading,.trailing], 50)


                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding([.top, .bottom])
                        
                        NavigationLink {
                            LoginPage()
                        } label: {
                            Text("Sign In")
                                .bold()
                                .foregroundColor(.white)
                        }

                    }
                    Spacer(minLength: 20)
                }
            }
        }
        .tint(.white)
    }
}

struct GetStartedPage_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedPage()
            .preferredColorScheme(.dark)
    }
}
