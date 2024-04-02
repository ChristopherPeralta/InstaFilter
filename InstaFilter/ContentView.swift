//
//  ContentView.swift
//  InstaFilter
//
//  Created by Christopher Peralta on 26/03/24.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    

    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter", action: changeFilter)

                    Spacer()

                    
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            }
    }
}

func changeFilter() {
    
}

    
//https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-photospicker

#Preview {
    ContentView()
}


