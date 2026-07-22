//
//  APIEndpoints.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//


enum APIEndpoints {

    static let baseURL = "https://cash-carry-smart-ordering-system.onrender.com"

    // MARK: Auth
    static let login = "\(baseURL)/auth/login"
    static let register = "\(baseURL)/auth/register"
    static let forgotPassword = "\(baseURL)/auth/forgot-password"
    static let resetPassword = "\(baseURL)/auth/reset-password"
    
    // MARK: Products
    static let products = "\(baseURL)/products"
    static let categories = "\(baseURL)/categories"
    
    // MARK: Events
    static let events = "\(baseURL)/events/active"
    
    // MARK: Vouchers
    static let myVouchers = "\(baseURL)/vouchers/my-vouchers"
    static let generateVoucher = "\(baseURL)/vouchers"
    
    // MARK: Profile
    static let profile = "\(baseURL)/auth/me"
    static let changePassword = "\(baseURL)/auth/change-password"
}
