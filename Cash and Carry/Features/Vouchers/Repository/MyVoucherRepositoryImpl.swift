//
//  MyVoucherRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class MyVoucherRepositoryImpl: MyVoucherRepository {
    private var myVoucherService: MyVoucherService
    
    private var voucherLocalDataSource: VoucherLocalDataSource
    
    init(
        myVoucherService: MyVoucherService,
        voucherLocalDataSource: VoucherLocalDataSource
    ) {
        self.myVoucherService = myVoucherService
        self.voucherLocalDataSource = voucherLocalDataSource
    }
    
    func fetchMyVouchers() async throws -> [MyVoucherResponse] {
        let vouchers = try await myVoucherService.fetchMyVouchers()
        
        voucherLocalDataSource.saveVouchers(vouchers)
        
        return vouchers
    }
    
    func getCachedMyVouchers() -> [MyVoucherResponse] {
        voucherLocalDataSource.getVouchers()
    }
}
