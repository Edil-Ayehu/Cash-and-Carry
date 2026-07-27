//
//  MyVoucherViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

@MainActor
final class MyVoucherViewModel: ObservableObject {
    @Published var vouchers: [MyVoucherResponse] = []
    
    @Published var isLoading: Bool = false
    @Published var isRefreshing: Bool = false
    @Published var errorMessage: String?
    
    private var myVoucherRepository: MyVoucherRepository
    
    init(myVoucherRepository: MyVoucherRepository) {
        self.myVoucherRepository = myVoucherRepository
    }
    
    func fetchMyVouchers(refresh: Bool = false) async {
        
        if !refresh {
            vouchers = myVoucherRepository.getCachedMyVouchers()
        }
        
        if refresh {
            isRefreshing = true
        } else {
            isLoading = vouchers.isEmpty
        }
        errorMessage = nil
        
        defer {
            isRefreshing = false
            
            isLoading = false
            
        }
        
        do {
            vouchers = try await myVoucherRepository.fetchMyVouchers()
            
        } catch {
            
            // show error only if voucher is empty
            if vouchers.isEmpty {
                errorMessage = error.localizedDescription
            }
        }
    }
}
