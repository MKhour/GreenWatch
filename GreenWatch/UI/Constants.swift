//
//  Constants.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/20/22.
//  Copyright 2022 Madelyn Khoury.

import Foundation
import SwiftUI
import UIKit

struct Constants {
    
    static let appTitleFont: Font? = Font.custom("Montserrat-Bold", size: appTitleSize)
    static let tabTitleFont: Font? = Font.custom("Montserrat-Regular", size: tabTitleSize)
    static let subtitleFont: Font? = Font.custom("Montserrat-Light", size: subtitleSize)
    static let headingFont: Font? = Font.custom("Montserrat-Light", size: headingSize)
    static let articleTitle: Font? = Font.custom("Montserrat-Medium", size: subtitleSize)
    static let articleDescriptionFont: Font? = Font.custom("Montserrat-Regular", size: bodySize)
    static let bodyFont: Font? = Font.custom("Montserrat-Light", size: bodySize)
    static let italicFont: Font? = Font.custom("Montserrat-Italic", size: bodySize)
    
    static let appTitleSize: CGFloat = 40
    static let tabTitleSize: CGFloat = 32
    static let subtitleSize: CGFloat = 16
    static let headingSize: CGFloat = 24
    static let bodySize: CGFloat = 12
}
