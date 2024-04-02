//
//  ContentView.swift
//  InstaFilter
//
//  Created by Christopher Peralta on 26/03/24.
//

import StoreKit
import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
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
    
    func changeFilter() {
        
    }

    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
        }
    }
}



    
//https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-photospicker

#Preview {
    ContentView()
}


