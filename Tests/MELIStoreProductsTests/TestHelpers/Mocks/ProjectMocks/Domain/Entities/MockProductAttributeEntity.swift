//
//  MockProductAttributeEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

final class MockProductAttributeEntity {
    static func build(
        id: String? = nil,
        name: String? = nil,
        valueID: String? = nil,
        valueName: String? = nil
    ) -> ProductAttributeEntity? {
        ProductAttributeEntity(
            id: id,
            name: name,
            valueID: valueID,
            valueName: valueName
        )
    }
}
