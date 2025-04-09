//
//  DefaultEmptyValidator.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import MELIStoreCore

struct SearchTextContentWrapper {
    static func value(
        _ initialValue: String = ""
    ) -> FieldContentWrapper {
        .build(
            initialValue: initialValue,
            rules: [ EmptyValidator(message: ModuleStrings.emptySearchError) ]
        )
    }
}
