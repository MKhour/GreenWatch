//
//  ImageScrollBarView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/24/22.
//  Copyright Madelyn Khoury 2022.

// Idea for generic type from https://www.fivestars.blog/articles/swiftui-patter-passing-views/

// future dev: look into having image offset from body and keep that distance as the body content moves

import SwiftUI

struct ImageScrollBarView<Content>: View where Content: View {
    private var title: String
    private var titleType: ImageHeaderComponent.TitleType
    private var imageURL: String
    @State private var headerHeight: CGFloat = 300
    private var header: ImageHeaderComponent? {
        ImageHeaderComponent(title: title, titleType: titleType, imagePath: imageURL, height: headerHeight)
    }
    private var bodyContent: Content
    private var minimumHeaderHeight: CGFloat = 100
    private var maximumHeaderHeight: CGFloat = 300
    private var transitionOffset: CGFloat = 5
    
    init(
        title: String,
        titleType: ImageHeaderComponent.TitleType,
        imageURL: String,
        @ViewBuilder bodyContent: @escaping () -> Content
    ) {
        self.title = title
        self.titleType = titleType
        self.imageURL = imageURL
        self.bodyContent = bodyContent()
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                // body
                bodyContent
                    .padding()
                    .padding(.top, headerHeight)
                
                // header
                GeometryReader { gr in
                    VStack {
                        header
                            .offset(y:
                                        gr.frame(in: .global).origin.y < 0
                                    ? abs(gr.frame(in: .global).origin.y)
                                    : -abs(gr.frame(in: .global).origin.y)
                            )
                        
                        Spacer()
                    }
                    .onChange(of: gr.frame(in: .global).origin.y) { offset in
                        findHeaderSize(offset)
                    }
                }
            }
        }
    }
    
    private func findHeaderSize(_ currentOffset: CGFloat) -> Void {
        if headerHeight < minimumHeaderHeight {
            headerHeight = minimumHeaderHeight
        }
        else if currentOffset < 0 {
            headerHeight = headerHeight - transitionOffset
        } else if headerHeight < maximumHeaderHeight {
            headerHeight = headerHeight + transitionOffset
        }
        else {
            headerHeight = maximumHeaderHeight
        }
    }
    
}

struct ImageNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        ImageScrollBarView(
            title: "Title",
            titleType: .tabTitle,
            imageURL: "cropped government photo"
        ) {
            VStack(spacing: 100) {
                Text("Test if this will work")
                Text("Test 2")
                Text("Test 3")
                Text("Test 4")
                Text("Test 5")
                Text("Test 2")
                Text("Test 3")
                Text("Test 4")
                Text("Test 5")
                Text("Test 2")
            }
            .padding(.vertical, 30)
        }
    }
}
