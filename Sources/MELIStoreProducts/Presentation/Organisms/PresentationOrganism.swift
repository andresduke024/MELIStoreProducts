//
//  PresentationOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreDesignSystem

struct PresentationOrganism: View {
    @Environment(\.theme)
    private var theme: ThemeManager
    
    @State
    private var searchText: String = ""
    
    private let onSearch: (String) -> Void
    
    init(onSearch: @escaping (String) -> Void) {
        self.onSearch = onSearch
    }
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView {
                Title2TextAtom(
                    ModuleStrings.presentationTitle,
                    color: theme.current.onPrimaryColor
                )
                .padding(.vertical, DSSpacing.spacing16)
                
                HeadlineTextAtom(
                    ModuleStrings.presentationSubtitle,
                    color: theme.current.onPrimaryColor
                )
                .padding(.bottom, DSSpacing.spacing26)
                
                ImageAtom(image: ModuleImages.presentation)
                    .scaledToFit()
                    .padding(.horizontal)
            }

            Spacer()
            
            SearchTextFieldMolecule(
                text: $searchText,
                onCommit: { onSearch(searchText) }
            )
        }
        .onDisappear {
            searchText = ""
        }
    }
}
