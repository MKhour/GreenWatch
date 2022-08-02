//
//  OfficialComponent.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

import SwiftUI

struct OfficialComponent: View {
    
    @StateObject var viewModel: OfficialComponentViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Translucent light off white"))
            
            VStack(alignment: .center, spacing: 4){
                Text(viewModel.official.name)
                    .font(Constants.officialName)
                
                Text("\(viewModel.official.office) (\(viewModel.official.partyAbbreviation))")
                    .font(Constants.officialPosition)
                    .padding(.bottom)
                
                HStack {
                    if viewModel.official.urls != nil {
                        Link(destination: URL(string: viewModel.official.urls![0])! ) {
                            websiteButton
                        }
                    }
                    
                    if viewModel.official.emails != nil {
                        emailButton
                    }
                    
                    if viewModel.official.phones != nil {
                        callButton
                    }
                    
                }
            }
            .foregroundColor(Color("Deep green"))
            .padding(12)
        }
        .frame(height: 120)
    }
    
    private var emailButton: some View {
        Button(action: {viewModel.email()}) {
            Label {
                Text("EMAIL")
                    .font(Constants.bodyFont)
                    .padding(.vertical, 10)
                    .padding(.trailing, 10)
                    .padding(.leading, 2)
            } icon: {
                Image(systemName: "envelope")
                    .scaleEffect(1.5)
                    .padding(.leading, 10)
                    .padding(.trailing, 2)
            }
            .background(Color("Deeper offwhite"))
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
    
    private var callButton: some View {
        Button(action: {viewModel.call()}) {
            Label {
                Text("CALL")
                    .font(Constants.bodyFont)
                    .padding(.vertical, 10)
                    .padding(.trailing, 10)
                    .padding(.leading, 2)
            } icon: {
                Image(systemName: "phone")
                    .scaleEffect(1.5)
                    .padding(.leading, 10)
                    .padding(.trailing, 2)
            }
            .background(Color("Deeper offwhite"))
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
    
    private var websiteButton: some View {
        Label {
            Text("WEB")
                .font(Constants.bodyFont)
                .padding(.vertical, 10)
                .padding(.trailing, 10)
                .padding(.leading, 2)
        } icon: {
            Image(systemName: "safari")
                .scaleEffect(1.5)
                .padding(.leading, 10)
                .padding(.trailing, 2)
        }
        .background(Color("Deeper offwhite"))
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
