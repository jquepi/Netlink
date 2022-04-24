//
//  NL80211GetWiphyCommand.swift
//  
//
//  Created by Alsey Coleman Miller on 4/23/22.
//


import Foundation
import Netlink
import NetlinkGeneric

public struct NL80211GetWiphyCommand: Equatable, Hashable, Codable, Identifiable {
    
    public static var command: NetlinkGenericCommand { NetlinkGenericCommand.NL80211.getWiphy }
    
    public static var version: NetlinkGenericVersion { 0 }
    
    public let id: UInt32 // NL80211_ATTR_IFINDEX
    
    public init(id: UInt32) {
        self.id = id
    }
    
    internal enum CodingKeys: String, NetlinkAttributeCodingKey {
        
        case id
        
        init?(attribute: NetlinkAttributeType) {
            
            switch attribute {
            case NetlinkAttributeType.NL80211.interfaceIndex:
                self = .id
            default:
                return nil
            }
        }
        
        var attribute: NetlinkAttributeType {
            
            switch self {
            case .id:
                return NetlinkAttributeType.NL80211.interfaceIndex
            }
        }
    }
}
