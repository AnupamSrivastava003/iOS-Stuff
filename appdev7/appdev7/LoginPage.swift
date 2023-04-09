//
//  LoginPage.swift
//  appdev7
//
//  Created by SKUBI on 22/03/23.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    
    @State private var lemail = ""
    @State private var lpassword = ""
    @State private var visible = false
    @State var alert = false
    @State var error = ""
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        VStack {
            if self.status {
                AfterloginIn()
            } else {
                ZStack{
                    
                    ZStack{
                        LinearGradient(colors: [Color(red: 0, green: 0, blue: 0.153),Color(red: 0.15, green: 0, blue: 0.153)], startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        
                        Circle()
                            .foregroundColor(.purple)
                            .blur(radius: 100)
                            .frame(width: 250)
                            .offset(x: -140, y: -330)
                        
                        Circle()
                            .foregroundColor(.indigo)
                            .blur(radius: 200)
                            .padding(50)
                            .offset(x: 170, y: 23)
                        
                        Circle()
                            .foregroundColor(.purple)
                            .blur(radius: 100)
                            .frame(width: 200)
                            .offset(x: 290, y: -390)
                        
                        VStack{
                            
                            Spacer()
                            
                            HStack(alignment: .bottom){
                                Text("Welcome Back!")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                                Image("loginPhoto")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .padding()
                            
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                TextField("E-Mail",text: $lemail)
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
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                if self.visible {
                                    TextField("Password",text: $lpassword)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                }
                                else {
                                    SecureField("Password",text: $lpassword)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 30)
                                            .frame(height: 50)
                                            .foregroundColor(.white)
                                            .opacity(0.08)
                                        )
                                }
                                
                                Button {
                                    if self.visible == false{
                                        self.visible = true
                                    } else {
                                        self.visible = false
                                    }
                                } label: {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                }

                                
                            }
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 2)
                            .padding([.leading, .trailing, .bottom])
                            
                            HStack{
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("Forgot Password ?")
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .bold()
                                }
                            }
                            .padding(.trailing)
                            
                            Spacer()
                            
                            Text("or Login via")
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
                            
                            Button {
                                self.verify()
                            } label: {
                                Text("Login")
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

                        Spacer()
                        }
                    }
                    
                    if self.alert {
                        ErrorView(alert: $alert, error: $error)
                    }
                }
            }
            
        }
    }
    
    func verify(){
        if self.lemail != "" && self.lpassword != "" {
            Auth.auth().signIn(withEmail: lemail, password: lpassword) {res, err in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else {
            self.error = "Please fill all the content properly."
            self.alert.toggle()
        }
    }
}

struct AfterloginIn: View {
    var body: some View {
        
        VStack{
            Text("You are logged in!")
            Button {
                //self.verify()
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            } label: {
                Text("Logout")
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
        }
    }
}

struct ErrorView: View {
    
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

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .preferredColorScheme(.dark)
    }
}
