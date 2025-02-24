//
//  Date+Extension.swift
//  BBDB
//
//  Created by Илья Валито on 13.02.2025.
//

import Foundation

extension Date {
    static var charactersLastLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .charactersLastLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .charactersLastLoadedDate)
        }
    }
    
    static var episodesLastLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .episodesLastLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .episodesLastLoadedDate)
        }
    }
    
    static var nextDoorStoresLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .nextDoorStoresLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .nextDoorStoresLoadedDate)
        }
    }
    
    static var pestControlTrucksLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .pestControlTrucksLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .pestControlTrucksLoadedDate)
        }
    }
    
    static var endCreditsSequenceLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .endCreditsSequenceLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .endCreditsSequenceLoadedDate)
        }
    }
    
    static var burgersOfTheDayLoadedDate: Date {
        get {
            let dateString = UserDefaults.loadData(withKey: .burgersOfTheDayLoadedDate) as String
            if dateString.isEmpty {
                return self.distantPast
            } else {
                return self.convertStringToDate(dateString)
            }
        }
        set {
            let dateString = newValue.convertDateToString()
            UserDefaults.saveData(dateString, withKey: .burgersOfTheDayLoadedDate)
        }
    }
    
    static func convertStringToDate(_ dateString: String) -> Date {
        let formatter = ISO8601DateFormatter()
        if let parsedDate = formatter.date(from: dateString) {
            return parsedDate
        } else {
            return Date.distantPast
        }
    }
    
    func convertDateToString() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}

