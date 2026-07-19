//
//  HomeView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(spacing: 0) {

                HomeHeader()

                EventsSection()
                
                Spacer().frame(height: 18)

                ProductsSection(selectedTab: $selectedTab)

            }
            .padding(.bottom, 30)

        }
        .background(Color(.white))
    }
}
