//
//  RegisterPage.swift
//  appdev7
//
//  Created by SKUBI on 21/03/23.
//

import SwiftUI
import Firebase

struct RegisterPage: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var rePassword = ""
    @State private var visible = false
    @State private var revisible = false
    @State var alert = false
    @State var error = ""
   
    
    var body: some View {
        NavigationView() {
            ZStack {
                ZStack{
                    LinearGradient(colors: [Color(red: 0, green: 0, blue: 0.153),Color(red: 0.15, green: 0, blue: 0.153)], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    Circle()
                        .foregroundColor(.purple)
                        .blur(radius: 100)
                        .frame(width: 250)
                        .offset(x: 140, y: -330)
                    
                    Circle()
                        .foregroundColor(.indigo)
                        .blur(radius: 200)
                        .padding(50)
                        .offset(x: -170, y: 23)
                    
                    Circle()
                        .foregroundColor(.purple)
                        .blur(radius: 100)
                        .frame(width: 200)
                        .offset(x: 290, y: 390)
                    
                    
                    VStack (){
                        
                        Spacer()
                        
                        HStack(alignment: .bottom) {
                            
                            
                            Text("Register to Continue!")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                            Spacer()
                            Image("Man2")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        VStack (alignment: .leading){
                            
                            
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                TextField("E-Mail",text: $email)
                                    .padding()
                                    .autocorrectionDisabled()
                                    .autocapitalization(.none)
                                    .background(RoundedRectangle(cornerRadius: 30)
                                        .frame(height: 50)
                                        .foregroundColor(.white)
                                        .opacity(0.08)
                                    )
                            }
                            .foregroundColor(.white)
                            .bold()
                            .padding([.leading, .trailing])
                            
                            
                            HStack{
                                Image(systemName: "lock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                
                                
                                if self.visible {
                                    TextField("Password",text: $password)
                                        .padding()
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                }
                                else {
                                    SecureField("Password",text: $password)
                                        .padding()
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                }
                                
                                Button {
                                    if self.visible == false {
                                        self.visible = true
                                    } else {
                                        self.visible = false
                                    }
                                } label: {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    //.padding(.trailing)
                                }
                            }
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 2)
                            .padding([.leading, .trailing])
                            
                            
                            HStack{
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                
                                if self.revisible {
                                    TextField("Re-Enter Password",text: $rePassword)
                                        .padding()
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                } else {
                                    SecureField("Re-Enter Password",text: $rePassword)
                                        .padding()
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                }
                                Button {
                                    if self.revisible == false {
                                        self.revisible = true
                                    } else {
                                        self.revisible = false
                                    }
                                } label: {
                                    Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                }
                                
                            }
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 8)
                            .padding([.leading, .trailing])
                            
                        }
                        
                        Text("or Register via")
                            .foregroundColor(.gray)
                            .bold()
                        
                        HStack{
                            Spacer()
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image("google")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 80, height: 40)
                                        .foregroundColor(.white)
                                        .opacity(0.08))
                            }
                            
                            Spacer(minLength: 10)
                            
                            Button {
                                
                            } label: {
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50,height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 80, height: 40)
                                        .foregroundColor(.white)
                                        .opacity(0.08))
                            }
                            
                            Spacer()
                            Spacer()
                        }
                        .padding(.bottom,40)
                        
                        NavigationLink {
                            
                            if email != "" {
                                AfterloginIn()
                            }
                            
                        } label: {
                            Text("Register")
                                .bold()
                                .foregroundColor(.white)
                                .font(.title3)
                                .padding()
                                .padding([.leading,.trailing], 50)
                                .background(
                                    LinearGradient(colors: [.purple, Color(red: 0, green: 0, blue: 1)], startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(20)
                        }
                        Spacer(minLength: 30)
                        }

                        
//                        Button {
//                            self.register()
//
//                        } label: {
//                            Text("Register")
//                                .bold()
//                                .foregroundColor(.white)
//                                .font(.title3)
//                                .padding()
//                                .padding([.leading,.trailing], 50)
//                                .background(
//                                    LinearGradient(colors: [.purple, Color(red: 0, green: 0, blue: 1)], startPoint: .leading, endPoint: .trailing)
//                                )
//                                .cornerRadius(20)
//                        }
//                        Spacer(minLength: 30)
//
//                    }
                }
                
                if self.alert {
                    ErrorViewRegister(alert: $alert, error: $error)
                }
            }
        }
    }
    
    func register() {
        
        if self.email != "" {
            if self.password == self.rePassword {
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                    if err != nil{
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                }
            }
            else {
                self.error = "Password mismatched."
                self.alert.toggle()
            }
        }
        else {
            self.error = "Please fill all the details properly."
            self.alert.toggle()
        }
    }
}

struct ErrorViewRegister: View {
    
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        GeometryReader{_ in
            
            VStack {
                
                Spacer()
                
                HStack(alignment: .center) {
                    Spacer()
                    VStack (alignment: .center){
                        
                        Text("Error")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                        Text(self.error)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 25)
                        
                        Button {
                            self.alert.toggle()
                        } label: {
                            Text("Cancel")
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
                        .padding(.bottom)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 70)
                        .opacity(0.15)
                        .blur(radius: 2)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.linearGradient(colors: [.white.opacity(0.5), .blue], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                                .foregroundColor(.white)
                                .opacity(0.2)
                        ))
                    Spacer()
                }
                .frame(alignment: .center)
                
                Spacer()
            }
        }
        .background(Color.black.opacity(0.85).ignoresSafeArea(.all))
    }
}


struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
            .preferredColorScheme(.dark)
    }
}
