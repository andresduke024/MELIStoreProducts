//
//  ProductDetailsOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import SwiftUI
import MELIStoreDesignSystem

struct ProductDetailsOrganism: View {

    @Environment(\.theme)
    private var theme: ThemeManager

    let product: ProductDetailsUIModel

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DSSpacing.spacing16
            ) {
                title.padding(.bottom, DSSpacing.spacing6)

                images.frame(height: 300)
                
                description

                if !product.mainFeatures.isEmpty { features }

                if !product.attributes.isEmpty { attributes }
            }
            .padding()
            .background(theme.current.backgroundColor)
        }
    }

    @ViewBuilder
    private var title: some View {
        TitleTextAtom(
            product.name,
            color: theme.current.secondaryColor
        )
    }

    @ViewBuilder
    private var images: some View {
        ImagesCarouselMolecule(
            images: product.pictures
        )
    }
    
    @ViewBuilder
    private var description: some View {
        HeadlineTextAtom(
            product.description,
            color: theme.current.secondaryColor,
            align: .leading
        )
    }

    @ViewBuilder
    private var features: some View {
        AttributeListItemMolecule(
            title: ModuleStrings.aboutTitle,
            icon: .checkSeal,
            useDivider: true,
            attributes: product.mainFeatures
        )
    }

    @ViewBuilder
    private var attributes: some View {
        AttributeListItemMolecule(
            title: ModuleStrings.featuresTitle,
            icon: .checkCircle,
            useDivider: true,
            attributes: product.attributes
        )
    }
}

#Preview {
    ProductDetailsOrganism(
        product: ProductDetailsUIModel(
            id: "MCO37965307",
            description:
                "Si estás buscando un dispositivo que te permita estar siempre en contacto...",
            name: "Celular Samsung Samsung Zflip",
            pictures: [
                "https://http2.mlstatic.com/D_NQ_NP_631627-MLU77166846506_072024-F.jpg",
                "https://http2.mlstatic.com/D_NQ_NP_631627-MLU77166846506_072024-F.jpg",
            ],
            mainFeatures: [
                AttributeUIModel(
                    id: "1",
                    name:
                        "Dispositivo desbloqueado para que elijas tu compañía telefónica preferida.",
                    description: ""
                )
            ],
            attributes: [
                AttributeUIModel(
                    id: "1",
                    name: "Marca:",
                    description: "Samsung"
                ),
                AttributeUIModel(
                    id: "2",
                    name: "Modelo:",
                    description: "Samsung Zflip"
                ),
                AttributeUIModel(
                    id: "3",
                    name: "Es Dual SIM:",
                    description: "No"
                ),
            ]
        )
    )
}
