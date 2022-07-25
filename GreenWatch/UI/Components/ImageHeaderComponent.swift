//
//  ImageHeaderComponent.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright Madelyn Khoury 2022.

import SwiftUI
import UIKit

struct ImageHeaderComponent: View {
    
    enum TitleType {
        case appTitle
        case tabTitle
    }
    
    private var title: String
    private var titleType: TitleType
    private var imagePath: String
    private var height: CGFloat? = 300
    private var minimumHeight: CGFloat = 100
    
    init(title: String, titleType: TitleType, imagePath: String, height: CGFloat?) {
        self.title = title
        self.titleType = titleType
        self.imagePath = imagePath
        if height != nil {
            if let height = height as? CGFloat, height > minimumHeight {
                self.height = height
            } else {
                self.height = minimumHeight
            }
        }
    }
    
    var body: some View {
        
        GeometryReader { gr in
            Image(imagePath)
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .mask {
                    Rectangle()
                        .fill(whiteGradient)
                }
                .overlay(alignment: .bottom) {
                    if titleType == .appTitle{
                        Text(title)
                            .font(Font.custom("Montserrat-SemiBold", size: Constants.appTitle))
                            .foregroundColor(Color("Deep green"))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    } else {
                        Text(title)
                            .font(Font.custom("Montserrat-Regular", size: Constants.tabTitle))
                            .foregroundColor(Color("Deep green"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }
        }
        
    }
    
    private var whiteGradient: LinearGradient {
        return LinearGradient(
            colors: [Color.white, Color.clear],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct ImageHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImageHeaderComponent(title: "Test Title", titleType: .tabTitle, imagePath: "cropped landing photo", height: nil)
            .ignoresSafeArea()
    }
}
