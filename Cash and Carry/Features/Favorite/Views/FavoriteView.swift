//
//  FavoriteView.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import SwiftUI

struct FavoriteView: View {

    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var favoriteVM = DIContainer.shared.makeFetchFavViewModel()
    
    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack(spacing: 0) {

            header

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 20) {

                    if favoriteVM.isLoading {

                        ForEach(0..<4, id: \.self) { _ in
                            FavoriteCardSkeleton()
                        }

                    } else {
                        
                        if favoriteVM.favorites.isEmpty {
                            // empty state view
                            Spacer().frame(height: 60)
                            FavoriteEmptyStateView()
                            
                        } else {
                            ForEach(favoriteVM.favorites) { favorite in

                                FavoriteCard(favorite: favorite)
                                    .onTapGesture {
                                        router.push(.favoriteDetail(favorite))
                                    }
                            }
                        }

                        
                    }

                }
                .padding()
            }
        }
        .background(Color.white)
        .task {
            await favoriteVM.fetchFavorites()
        }
        .navigationBarBackButtonHidden(true)
    }
}



private extension FavoriteView {

    var header: some View {

        HStack {

            Button {
                dismiss()
            } label: {

                Image(systemName: "chevron.left")
                    .font(.system(size: 22, weight: .medium))
            }


            Spacer()


            Text("My Favorites")
                .font(.custom("Outfit-Medium", size: 18))


            Spacer()


            // balance
            Image(systemName: "chevron.left")
                .opacity(0)
        }
        .foregroundColor(.black)
        .padding()
    }
}
