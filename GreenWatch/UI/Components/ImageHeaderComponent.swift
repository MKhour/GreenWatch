//
//  ImageHeaderComponent.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//

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
    
    init(title: String, titleType: TitleType, imagePath: String) {
        self.title = title
        self.titleType = titleType
        self.imagePath = imagePath
    }
    
    var body: some View {
        
        GeometryReader { gr in
            Image(imagePath)
                .resizable()
                .scaledToFill()
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
        ImageHeaderComponent(title: "Test Title", titleType: .appTitle, imagePath: "cropped landing photo")
    }
}
