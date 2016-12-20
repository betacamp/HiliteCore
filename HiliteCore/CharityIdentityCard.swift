import Foundation

public typealias CharityId = String

public protocol CharityIdentityCard {
    func name() -> String?
    func displayName() -> String?
    func id() -> CharityId?
}
