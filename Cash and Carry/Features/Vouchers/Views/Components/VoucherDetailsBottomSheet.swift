//
//  VoucherDetailsBottomSheet.swift
//  Cash and Carry
//
//  Created by Edil on 23/07/2026.
//

import SwiftUI

struct VoucherDetailsBottomSheet: View {

    let voucher: MyVoucherResponse

    var body: some View {

        VStack(alignment: .leading, spacing: 24) {

            VStack(alignment: .leading, spacing: 8) {
                
                Spacer().frame(height: 8)

                Text("Voucher Details")
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 8)

                HStack {

                    Text(voucher.code)
                        .font(.custom("Outfit-SemiBold", size: 20))

                    Button {
                        UIPasteboard.general.string = voucher.code
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
            }

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 18) {

                    ForEach(voucher.items) { item in

                        VoucherProductRow(item: item)
                    }
                }
            }
        }
        .padding()
    }
}
