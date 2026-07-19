//
//  MyVoucherRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class MyVoucherRepositoryImpl: MyVoucherRepository {
    private var myVoucherService: MyVoucherService
    
    init(myVoucherService: MyVoucherService) {
        self.myVoucherService = myVoucherService
    }
    
    func fetchMyVouchers() async throws -> [MyVoucherResponse] {
        try await myVoucherService.fetchMyVouchers()
    }
}
