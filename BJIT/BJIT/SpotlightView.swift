//
//  SpotlightView.swift
//  BJIT
//
//  Created by Md Zahidul Islam Mazumder on 19/12/22.
//

import SwiftUI
import CoreSpotlight

struct SpotlightView: View {
    let appData = [102, 503, 653, 998, 124, 587, 776, 354, 449, 287]
        @State private var selection: Int?

        var body: some View {
            NavigationView {
                List {
                    Section {
                        ForEach(appData, id: \.self) { value in
                            Text("\(value)")
                        }
                    }

                    Section {
                        Button("Index Data", action: indexData)
                        //Button("Delete Data", role: .destructive, action: deleteData)
                    }
                }
                .navigationTitle("My App")
            }
            .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
        }

        func indexData() {
            var searchableItems = [CSSearchableItem]()

            appData.forEach {
                let attributeSet = CSSearchableItemAttributeSet(contentType: .content)
                attributeSet.displayName = $0.description
    //            attributeSet.thumbnailData = UIImage(named: "custom")?.jpegData(compressionQuality: 0.7)
    //            attributeSet.phoneNumbers = ["12345678"]
    //             attributeSet.supportsPhoneCall = true
                let searchableItem = CSSearchableItem(uniqueIdentifier: $0.description, domainIdentifier: "sample", attributeSet: attributeSet)
                searchableItems.append(searchableItem)
            }

            CSSearchableIndex.default().indexSearchableItems(searchableItems)
        }

        func deleteData() {
            CSSearchableIndex.default().deleteSearchableItems(withDomainIdentifiers: ["sample"])
        }

        func handleSpotlight(userActivity: NSUserActivity) {
            guard let element = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String else {
                return
            }

            // Handle spotlight interaction
            // Maybe deep-link, or something else entirely
            // This totally depends on your app's use-case
            self.selection = Int(element)
        }
}

struct SpotlightView_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightView()
    }
}
