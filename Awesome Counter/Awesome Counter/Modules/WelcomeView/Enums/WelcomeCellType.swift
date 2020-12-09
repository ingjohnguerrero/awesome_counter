//
//  WelcomeCellType.swift
//  Awesome Counter
//
//  Created by John Guerrero on 9/12/20.
//

import Foundation
import UIKit

enum WelcomeCellType {

    case almostAnything
    case shareable
    case countYourThoughs

    var color: UIColor {
        switch self {
        case .almostAnything:
           return #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        case .shareable:
            return #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        case .countYourThoughs:
            return #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1)
        default:
           return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

    var imageName: String {
        switch self {
        case .almostAnything:
            return "42.circle.fill"
        case .shareable:
            return "person.2.fill"
        case .countYourThoughs:
            return "lightbulb.fill"
        default:
            ""
        }
    }

    var title: String {
        switch self {
        case .almostAnything:
            return "Add almost anything"
        case .shareable:
            return "Count to self, or with anyone"
        case .countYourThoughs:
            return "Count your thoughts"
        default:
            return ""
        }
    }

    var description: String {
        switch self {
        case .almostAnything:
            return "Capture cups of lattes, frapuccinos, or anything else that can be counted."
        case .shareable:
            return "Others can view or make changes. There’s no authentication API."
        case .countYourThoughs:
            return "Possibilities are literally endless."
        default:
            return ""
        }
    }
}
