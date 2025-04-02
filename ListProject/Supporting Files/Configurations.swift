//
//  Configurations.swift
//  ListProject
//
//  Created by Mina Malak on 02/04/2025.
//

import Foundation

final class AppConfiguration {
    
    enum EnvironmentKeys:String {
        case production = "Production"
        case staging = "Staging"
        case developmentTestFlight = "TestFlight"
        case development = "Development"
    }
    
    enum Variables:String {
        // MARK:- API
        case apiURL = "BaseURL"
        case apiKey = "apiKey"
        case apiPrefix = "apiPrefix"
    }
    
    public static let shared:AppConfiguration = AppConfiguration()
    private var configDictionary:NSDictionary? = nil
    
    private init() {}
    
    var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    }
}
