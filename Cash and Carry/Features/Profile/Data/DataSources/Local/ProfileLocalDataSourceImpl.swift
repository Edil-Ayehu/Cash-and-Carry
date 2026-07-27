//
//  ProfileLocalDataSourceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

import Foundation

final class ProfileLocalDataSourceImpl: ProfileLocalDataSource {
    private var key = "cached_profile"
    
    func getProfile() -> ProfileResponse? {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let profile = try? JSONDecoder().decode(ProfileResponse.self, from: data)
        else {
            return nil
        }
        
        return profile
    }
    
    func saveProfile(_ profile: ProfileResponse) {
        guard let data = try? JSONEncoder().encode(profile) else { return }
    }
    
    func clearProfile() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
