//
//  ProfileViewSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import SwiftUI

struct ProfileViewSkeleton: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {

                // Profile Header
                VStack(spacing: 12) {

                    Circle()
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 80, height: 80)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 150, height: 20)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 200, height: 16)

                    Capsule()
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 150, height: 46)
                }

                // Account Information
                VStack(alignment: .leading, spacing: 24) {

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 170, height: 20)

                    skeletonRow()

                    skeletonRow()
                }

                // Preferences
                VStack(alignment: .leading, spacing: 18) {

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 120, height: 20)

                    menuRow()

                    menuRow()

                    menuRow()
                }

                Spacer(minLength: 20)
            }
            .padding()
            .redacted(reason: .placeholder)
        }
    }

    @ViewBuilder
    private func skeletonRow() -> some View {
        HStack(spacing: 16) {

            Circle()
                .fill(Color.gray.opacity(0.25))
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 8) {

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.25))
                    .frame(width: 120, height: 14)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.25))
                    .frame(width: 180, height: 16)
            }

            Spacer()
        }
    }

    @ViewBuilder
    private func menuRow() -> some View {
        HStack {

            Circle()
                .fill(Color.gray.opacity(0.25))
                .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.25))
                .frame(width: 160, height: 16)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.4))
        }
        .frame(height: 50)
    }
}

