//
//  PresentationOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreDesignSystem

struct PresentationOrganism: View {
    @Environment(\.theme)
    private var theme: ThemeManager
    
    @State
    private var searchText: FieldContentWrapper = SearchTextContentWrapper.value()
    
    private let onSearch: (String) -> Void
    
    init(onSearch: @escaping (String) -> Void) {
        self.onSearch = onSearch
    }
    
    var body: some View {
        VStack(
            alignment: .center
        ) {
            ScrollView {
                title
                subtitle
                image
            }
            Spacer()
            search
        }
        .onDisappear {
            searchText = SearchTextContentWrapper.value()
        }
    }
    
    @ViewBuilder
    private var title: some View {
        Title2TextAtom(
            ModuleStrings.presentationTitle,
            color: theme.current.onPrimaryColor
        )
        .padding(.vertical, DSSpacing.spacing16)
    }
    
    @ViewBuilder
    private var subtitle: some View {
        HeadlineTextAtom(
            ModuleStrings.presentationSubtitle,
            color: theme.current.onPrimaryColor
        )
        .padding(.bottom, DSSpacing.spacing26)
    }
    
    @ViewBuilder
    private var image: some View {
        ImageAtom(image: ModuleImages.presentation)
            .scaledToFit()
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private var search: some View {
        SearchTextFieldMolecule(
            text: $searchText.content,
            onEditingChange: { _ in
                searchText.validate(always: false)
            },
            onCommit: {
                guard searchText.validate() else { return }
                
                onSearch(searchText.content)
            },
            error: searchText.error
        )
    }
}
