//
//  MainTabView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: Tab = .home
    
    @StateObject private var productVM = DIContainer.shared.makeProductViewModel()

    var body: some View {

        TabView(selection: $selectedTab) {

            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.icon)
                }
                .tag(Tab.home)
                .environmentObject(productVM)

            ProductsView()
                .tabItem {
                    Label(Tab.products.title, systemImage: Tab.products.icon)
                }
                .tag(Tab.products)
                .environmentObject(productVM)

            VouchersView()
                .tabItem {
                    Label(Tab.vouchers.title, systemImage: Tab.vouchers.icon)
                }
                .tag(Tab.vouchers)

            CartView(selectedTab: $selectedTab)
                .tabItem {
                    Label(Tab.cart.title, systemImage: Tab.cart.icon)
                }
                .tag(Tab.cart)

            ProfileView()
                .tabItem {
                    Label(Tab.profile.title, systemImage: Tab.profile.icon)
                }
                .tag(Tab.profile)

        }
        .tint(.black) // Selected tab color
        .task {
            await productVM.fetchProducts(category: "")
        }
    }
}
