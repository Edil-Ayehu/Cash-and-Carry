//
//  GenerateVoucherViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

@MainActor
final class GenerateVoucherViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var code: String?
    @Published var errorMessage: String?
    
    private var voucherRepository: VoucherRepository
    
    init(voucherRepository: VoucherRepository) {
        self.voucherRepository = voucherRepository
    }
    
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async {
        isLoading = true
        errorMessage = nil
        code = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await voucherRepository.generateVoucher(request: request)
            
            code = response.code
            
        } catch {
            if let apiError = error as? APIError {
                 errorMessage = apiError.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
