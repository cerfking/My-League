//
//  ChampionView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/25.
//

import SwiftUI
import GLTFKit2


struct ChampionView: View {
    private let champion: Champion
    @State private var viewModel: ChampionViewViewModel
    
    init(champion: Champion) {
        self.champion = champion
        self.viewModel = ChampionViewViewModel(champion: champion)
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack(alignment:.topLeading) {
                        ChampionSplashView(championId: champion.id)
                        Rectangle()
                               .foregroundColor(.clear)
                               .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                        
         
                        VStack(alignment: .leading) {
                            Text(champion.title)
                                .bold()
                                .font(.title3)
                            Text(champion.name)
                                .bold()
                                .font(.largeTitle)
                            HStack {
                                ForEach(champion.tags, id: \.self) {tag in
                                        Text(tag)
                                }
                            }
                            NavigationLink(destination: Test()) {
                                Text("Test")
                            }
                            
                        }
                        .padding(20)
                        
                    }
                    HStack {
                        PassiveView(passive: champion.passive)
                            .onTapGesture {
                                viewModel.spell = nil
                                viewModel.passive = champion.passive
                                viewModel.spellTag = "P"
                                viewModel.updateVideoURL()
                            }
                            .padding(3)
                        ForEach(Array(champion.spells.enumerated()), id: \.element.id) { index, spell in
                            SpellView(spell: spell)
                                .padding(3)
                                .onTapGesture {
                                    viewModel.spell = spell
                                    switch index {
                                    case 0:
                                        viewModel.spellTag = "Q"
                                    case 1:
                                   
                                        viewModel.spellTag = "W"
                                    case 2:
                                    
                                        viewModel.spellTag = "E"
                                       
                                    case 3:
                                    
                                        viewModel.spellTag = "R"
                                        
                                    default:
                                  
                                        viewModel.spellTag = ""
                                        }
                                    viewModel.updateVideoURL()
                                }
                        }
                    }
                    
                    .padding()
                    .offset(y:-30)
                    Text(viewModel.spell != nil ? viewModel.spell!.name : viewModel.passive?.name ?? "")
                        .font(.title3)
                    
                        
                    //Text(viewModel.spell?.description.htmlToString ?? "HEHE")
                        
                    
                 
                    Text(viewModel.spell != nil ? viewModel.spell!.description : viewModel.passive?.description ?? "")
                        .padding()
                        .lineSpacing(5)
                    
        
                    
                    if let _ = viewModel.videoURL {
                        VideoViewRepresented(mediaUrl: $viewModel.videoURL)
                            .frame(height: UIScreen.main.bounds.height * 0.3, alignment: .top)
                        
                        
                    } else {
                        Text("novalue")
                    }
                }
            }
            .scrollIndicators(.never)
            .navigationTitle(champion.name)
            .navigationBarTitleDisplayMode(.inline)
        
        }
        
       
    }
}

#Preview {
    ChampionView(champion: Champion(id: "Ahri", key: "103", name: "Ahri", title: "the Nine-Tailed Fox", image: MyLeague.ChampionImage(full: "Ahri.png", sprite: "champion0.png", group: "champion", x: 48, y: 0, w: 48, h: 48), skins: [MyLeague.ChampionSkin(id: "103000", num: 0, name: "default", chromas: false), MyLeague.ChampionSkin(id: "103001", num: 1, name: "Dynasty Ahri", chromas: true), MyLeague.ChampionSkin(id: "103002", num: 2, name: "Midnight Ahri", chromas: true), MyLeague.ChampionSkin(id: "103003", num: 3, name: "Foxfire Ahri", chromas: true), MyLeague.ChampionSkin(id: "103004", num: 4, name: "Popstar Ahri", chromas: true), MyLeague.ChampionSkin(id: "103005", num: 5, name: "Challenger Ahri", chromas: true), MyLeague.ChampionSkin(id: "103006", num: 6, name: "Academy Ahri", chromas: true), MyLeague.ChampionSkin(id: "103007", num: 7, name: "Arcade Ahri", chromas: true), MyLeague.ChampionSkin(id: "103014", num: 14, name: "Star Guardian Ahri", chromas: true), MyLeague.ChampionSkin(id: "103015", num: 15, name: "K/DA Ahri", chromas: true), MyLeague.ChampionSkin(id: "103016", num: 16, name: "Prestige K/DA Ahri", chromas: false), MyLeague.ChampionSkin(id: "103017", num: 17, name: "Elderwood Ahri", chromas: true), MyLeague.ChampionSkin(id: "103027", num: 27, name: "Spirit Blossom Ahri", chromas: true), MyLeague.ChampionSkin(id: "103028", num: 28, name: "K/DA ALL OUT Ahri", chromas: true), MyLeague.ChampionSkin(id: "103042", num: 42, name: "Coven Ahri", chromas: true), MyLeague.ChampionSkin(id: "103065", num: 65, name: "Prestige K/DA Ahri (2022)", chromas: false), MyLeague.ChampionSkin(id: "103066", num: 66, name: "Arcana Ahri", chromas: true), MyLeague.ChampionSkin(id: "103076", num: 76, name: "Snow Moon Ahri", chromas: true)], lore: "Innately connected to the magic of the spirit realm, Ahri is a fox-like vastaya who can manipulate her prey\'s emotions and consume their essence—receiving flashes of their memory and insight from each soul she consumes. Once a powerful yet wayward predator, Ahri is now traveling the world in search of remnants of her ancestors while also trying to replace her stolen memories with ones of her own making.", blurb: "Innately connected to the magic of the spirit realm, Ahri is a fox-like vastaya who can manipulate her prey\'s emotions and consume their essence—receiving flashes of their memory and insight from each soul she consumes. Once a powerful yet wayward...", allytips: ["Use Charm to set up your combos, it will make landing Orb of Deception and Fox-Fire dramatically easier.", "Initiate team fights using Charm, and chase down stragglers with Spirit Rush.", "Spirit Rush enables Ahri\'s abilities, it opens up paths for Charm, helps double hitting with Orb of Deception, and closes to make use of Fox-Fire."], enemytips: ["Ahri\'s survivability is dramatically reduced when her Ultimate, Spirit Rush, is down.", "Stay behind minions to make Charm difficult to land, this will reduce Ahri\'s damage potential significantly."], tags: ["Mage", "Assassin"], partype: "Mana", info: MyLeague.ChampionInfo(attack: 3, defense: 4, magic: 8, difficulty: 5), spells: [MyLeague.ChampionSpell(id: "AhriQ", name: "Orb of Deception", description: "Ahri sends out and pulls back her orb, dealing magic damage on the way out and true damage on the way back. ", cooldownBurn: "7", costBurn: "55/65/75/85/95", image: MyLeague.ChampionImage(full: "AhriQ.png", sprite: "spell0.png", group: "spell", x: 96, y: 96, w: 48, h: 48)), MyLeague.ChampionSpell(id: "AhriW", name: "Fox-Fire", description: "Ahri gains a brief burst of Move Speed and releases three fox-fires, that lock onto and attack nearby enemies.", cooldownBurn: "9/8/7/6/5", costBurn: "30", image: MyLeague.ChampionImage(full: "AhriW.png", sprite: "spell0.png", group: "spell", x: 144, y: 96, w: 48, h: 48)), MyLeague.ChampionSpell(id: "AhriE", name: "Charm", description: "Ahri blows a kiss that damages and charms an enemy it encounters, instantly stopping movement abilities and causing them to walk harmlessly towards her.", cooldownBurn: "14", costBurn: "60", image: MyLeague.ChampionImage(full: "AhriE.png", sprite: "spell0.png", group: "spell", x: 192, y: 96, w: 48, h: 48)), MyLeague.ChampionSpell(id: "AhriR", name: "Spirit Rush", description: "Ahri dashes forward and fires essence bolts, damaging nearby enemies. Spirit Rush can be cast up to three times before going on cooldown, and gains additional recasts when taking down enemy champions.", cooldownBurn: "130/105/80", costBurn: "100", image: MyLeague.ChampionImage(full: "AhriR.png", sprite: "spell0.png", group: "spell", x: 240, y: 96, w: 48, h: 48))], passive: MyLeague.ChampionPassive(name: "Essence Theft", description: "After killing 9 minions or monsters, Ahri heals.<br>After taking down an enemy champion, Ahri heals for a greater amount.", image: MyLeague.ChampionImage(full: "Ahri_SoulEater2.png", sprite: "passive0.png", group: "passive", x: 48, y: 0, w: 48, h: 48))))
}
