//
//  CategoryChipSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import SwiftUI

struct CategoryChipSkeleton: View {

    var body: some View {

        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray.opacity(0.18))
            .frame(width: 90, height: 50)
            .redacted(reason: .placeholder)
    }
}

