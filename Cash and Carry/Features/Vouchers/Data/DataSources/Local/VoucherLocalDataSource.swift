//
//  VoucherLocalDataSource.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

protocol VoucherLocalDataSource {
    func getVouchers() -> [MyVoucherResponse]
    func saveVouchers(_ vouchers: [MyVoucherResponse])
    func clearVouchers()
}
