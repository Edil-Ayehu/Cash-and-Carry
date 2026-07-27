//
//  VoucherLocalDataSourceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

import Foundation

final class VoucherLocalDataSourceImpl: VoucherLocalDataSource {
    
    private let key = "cached_vouchers"
    
    func getVouchers() -> [MyVoucherResponse] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let vouchers = try? JSONDecoder().decode([MyVoucherResponse].self, from: data)
        else {
            return []
        }
        
        return vouchers
    }
    
    func saveVouchers(_ vouchers: [MyVoucherResponse]) {
        guard let data = try? JSONEncoder().encode(vouchers) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func clearVouchers() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
