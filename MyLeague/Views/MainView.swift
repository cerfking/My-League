//
//  MainView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/5.
//

import SwiftUI
struct MainView: View {
 
    var viewModel: MainViewViewModel
    @Binding var isMainViewPresented: Bool
    var puuid: String
    init(puuid: String, isMainViewPresented: Binding<Bool>) {
        self.viewModel = MainViewViewModel(puuid: puuid)
        self.puuid = puuid
        _isMainViewPresented = isMainViewPresented
     }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let summoner = viewModel.summoner {
                    ZStack {
                        Image("Mageseeker_CB")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                       
                        VStack {
                            AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/profileicon/\(summoner.profileIconId).png"), content: { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .frame(width: 100, height: 100)
                            }) {
                                ProgressView()
                            }
                            Text("\(summoner.summonerLevel)")
                                .bold()
                                .padding(.bottom)
                            Text("\(summoner.name)")
                                .bold()
                                .font(.title2)
                              
                        }
                    }
                    
                        
                    
                  
                    Text("Most Played")
                        .offset(x:-125)
        
                    HStack {
                        ForEach(viewModel.champions, id: \.id) { champion in
                            VStack {
                                ChampionSquareView(champion: champion)
                                    .frame(width: 80, height: 80)
                                    .padding(.leading)
                                    .padding(.trailing)
                            }
                            
                        }
                            
                    }
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(viewModel.matches, id: \.info.gameId) { match in
                               // MatchCardView(puuid: puuid, match: match)
                                NavigationLink(destination: MatchDetailsView(puuid: puuid, match: match)) {
                                    MatchCardView(puuid: puuid, match: match)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                               // MatchCardView(puuid: puuid, match: match)
                                    .scrollTransition { content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1.0 : 0.0)
                                            .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8, y: phase.isIdentity ? 1.0 : 0.8)
                                      
                                    }
                                   
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                    

                }
                
                Button("Switch account") {
                
                    isMainViewPresented = false
                }
             

            }
            .navigationTitle("Match History")
            .navigationBarTitleDisplayMode(.inline)
        }
        
       
    }
}


#Preview {
    MainView(puuid: "ufLHHGThkFK-xlzwVZpB_N-fvhX_Od03iR79BH-cYal6TqQozshOKXGJ2o15dcFTsfmSO_PD2MAHCg", isMainViewPresented: .constant(false))
}
