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
    @Published var errorMessage: String?
    
    private var myVoucherRepository: MyVoucherRepository
    
    init(myVoucherRepository: MyVoucherRepository) {
        self.myVoucherRepository = myVoucherRepository
    }
    
    func fetchMyVouchers() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            vouchers = try await myVoucherRepository.fetchMyVouchers()
            
        } catch {
            if let apiError = error as? APIError {
                    errorMessage = apiError.localizedDescription
              } else {
                   errorMessage = error.localizedDescription
             }
        }
    }
}
