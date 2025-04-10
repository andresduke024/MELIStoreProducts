//
//  MockProductPictureResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductPictureResponse {
    static func build(
        id: String? = nil,
        url: String? = nil,
        suggestedForPicker: [String]? = nil,
        maxWidth: Int? = nil,
        maxHeight: Int? = nil
    ) -> ProductPictureResponse {
        ProductPictureResponse(
            id: id,
            url: url,
            suggestedForPicker: suggestedForPicker,
            maxWidth: maxWidth,
            maxHeight: maxHeight
        )
    }
}
