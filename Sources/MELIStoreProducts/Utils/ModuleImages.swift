//
//  ModuleImages.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import Foundation
import MELIStoreDesignSystem

enum ModuleImages: ImageProtocol {
    case presentation
    
    var name: String {
        switch self {
        case .presentation:
            return "Presentation"
        }
    }
    
    var bundle: Bundle? { .module }
}
