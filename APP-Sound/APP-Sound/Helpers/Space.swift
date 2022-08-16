import UIKit

public enum Space: RawRepresentable, Equatable, Hashable, CaseIterable {
    public typealias RawValue = CGFloat
    case none
    case base00
    case base01
    case base02
    case base03
    case base07
    case base05
    case base06
    case base04
    case base08
    case base09
    case base10
    case base11
    case base12
    case base13
    case base14
    
    public var rawValue: RawValue {
        switch self {
        case .base00:
            return 4
        case .base01:
            return 8
        case .base02:
            return 12
        case .base03:
            return 16
        case .base04:
            return 20
        case .base05:
            return 24
        case .base06:
            return 32
        case .base07:
            return 40
        case .base08:
            return 48
        case .base09:
            return 56
        case .base10:
            return 64
        case .base11:
            return 72
        case .base12:
            return 80
        case .base13:
            return 88
        case .base14:
            return 96
        default:
            return 0
        }
    }
    
    public init(rawValue: CGFloat){
        self = Space
            .allCases
            .first { $0.rawValue == rawValue } ?? .none
    }
}
