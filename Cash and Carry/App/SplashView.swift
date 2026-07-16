//
//  SplashView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var router: AppRouter
    
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            
            // white background
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Cash & Carry")
                    .font(.custom("Outfit-SemiBold", size: 32))
                    .foregroundColor(.black)
                
                ProgressView()
            }
        }
        .task {
            await checkAppState()
        }
    }
    
    private func checkAppState() async {

        try? await Task.sleep(
            // 2 seconds delay
            nanoseconds: 2_000_000_000
        )

        let isLoggedIn = false

        await MainActor.run {
            
            router.finishSplash()
            
            if isLoggedIn {
                router.setRoot(.mainTab)
            } else {
                router.setRoot(.login)
            }
        }
    }
}
