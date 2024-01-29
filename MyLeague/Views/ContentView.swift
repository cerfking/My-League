//
//  ContentView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/5.
//

import SwiftUI
import Observation

struct ContentView: View {
    //@State var username = ""
    @State private var showMainView = false
    @State var viewModel = LoginViewViewModel()
    @State private var mainViewPuuid: String? // Declare mainViewPuuid here
   
    var body: some View {
       
        VStack(alignment: .center) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .offset(y: 30)
            
            
            TextField("Game Name", text: $viewModel.gameName)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            
                .offset(y: 100)
        
            TextField("Tag Line", text: $viewModel.tagLine)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .offset(y: 120)
            
            Button {
             
                showMainView = true
            
               
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                    Text("Enter Account")
                        .foregroundColor(.white)
                        .bold()
                    
                }
            }
            .frame(height: 50)
            .offset(y: 140)
            Spacer()
        }
      
            .task(id: showMainView) {
                guard showMainView == true else {
                    return
                }
                do {
                    let account = try await viewModel.getAccount()
                    print(account)
                    mainViewPuuid = account.puuid
                } catch {
                    print("error")
                }
            }
            .padding()
            .background(Color(uiColor: .init(red: 3/255, green: 59/255, blue: 70/255, alpha: 1)))

            .fullScreenCover(isPresented: $showMainView, onDismiss: {
                self.mainViewPuuid = nil
            }) {
                if let puuid = mainViewPuuid {
                    MainView(puuid: puuid, isMainViewPresented: $showMainView)
                        
                }
            }
    }
}

#Preview {
    ContentView()
}
