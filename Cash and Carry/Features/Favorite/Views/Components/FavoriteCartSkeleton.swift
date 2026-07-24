//
//  FavoriteCartSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import SwiftUI

struct FavoriteCardSkeleton: View {

    var body: some View {

        VStack(spacing: 18) {

            HStack {

                // Heart icon placeholder
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 70, height: 70)


                VStack(alignment: .leading, spacing: 10) {

                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 150, height: 18)


                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.12))
                        .frame(width: 100, height: 14)

                }


                Spacer()


                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 12, height: 20)

            }



            HStack {


                HStack(spacing: -18) {

                    ForEach(0..<3, id: \.self) { _ in

                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 55, height: 55)
                            .overlay {
                                Circle()
                                    .stroke(
                                        Color.white,
                                        lineWidth: 3
                                    )
                            }
                    }

                }


                Spacer()


                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.15))
                    .frame(
                        width: 90,
                        height: 42
                    )

            }

        }
        .padding()
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 8
        )
        .redacted(reason: .placeholder)

    }
}
