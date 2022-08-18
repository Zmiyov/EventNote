//
//  AddEventCellName.swift
//  EventNote
//
//  Created by Vladimir Pisarenko on 19.08.2022.
//

import Foundation

enum AddEventCellName: CaseIterable, CustomStringConvertible {
    case kindOfShooting
    case name
    case date
    case amountOfHours
    case phone
    case additionalPhone
    case telegram
    case instagram
    case main
    case start
    case end
    case forHour
    case fullPrice
    case prepayment
    case alert
    
    var description: String {
        switch self {
        case .kindOfShooting:
            return "Kind of shooting"
        case .name:
            return "Name"
        case .date:
            return "Date"
        case .amountOfHours:
            return "Amount of Hours"
        case .phone:
            return "Phone"
        case .additionalPhone:
            return "Additional Phone"
        case .telegram:
            return "Telegram"
        case .instagram:
            return "Instagram"
        case .main:
            return "Main"
        case .start:
            return "Start"
        case .end:
            return "End"
        case .forHour:
            return "For Hour"
        case .fullPrice:
            return "Full Price"
        case .prepayment:
            return "Prepayment"
        case .alert:
            return "Alert"
        }
    }
}

