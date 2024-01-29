//
//  ItemView.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/28.
//

import SwiftUI

struct ItemView: View {
    private let itemId: Int
    init(itemId: Int) {
        self.itemId = itemId
    }
    var body: some View {
        AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/\(itemId).png"),
                   content: { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
        }) {
            EmptyView()
        }
    }
}

#Preview {
    ItemView(itemId: 1001)
}
