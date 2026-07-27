//
//  ProfileLocalDataSource.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

protocol ProfileLocalDataSource {
    func getProfile() -> ProfileResponse?
    func saveProfile(_ profile: ProfileResponse)
    func clearProfile()
}
