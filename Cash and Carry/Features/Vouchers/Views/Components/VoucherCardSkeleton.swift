//
//  VoucherCardSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import SwiftUI

struct VoucherCardSkeleton: View {

    var body: some View {

        VStack(spacing: 0) {

            // Header
            HStack(spacing: 14) {

                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 40, height: 40)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.25))
                    .frame(width: 100, height: 18)

                Spacer()
            }
            .padding(12)
            .background(Color.gray.opacity(0.8))

            VStack(alignment: .leading, spacing: 16) {

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.25))
                    .frame(width: 110, height: 16)

                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 58)

                HStack(spacing: 8) {

                    Circle()
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 18, height: 18)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.25))
                        .frame(width: 170, height: 14)

                    Spacer()
                }
            }
            .padding(20)
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 12)
        .redacted(reason: .placeholder)
    }
}

