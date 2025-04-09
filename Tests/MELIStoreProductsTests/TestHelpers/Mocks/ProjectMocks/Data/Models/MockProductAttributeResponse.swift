//
//  MockProductAttributeResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductAttributeResponse {
    static func build(
        id: String? = nil,
        name: String? = nil,
        valueID: String? = nil,
        valueName: String? = nil
    ) -> ProductAttributeResponse {
        ProductAttributeResponse(
            id: id,
            name: name,
            valueID: valueID,
            valueName: valueName
        )
    }
}
