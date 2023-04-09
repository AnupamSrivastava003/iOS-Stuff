//
//  ContentView.swift
//  appdev7
//
//  Created by SKUBI on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack {
            if self.status {
                AfterloginIn()
            } else {
                GetStartedPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
