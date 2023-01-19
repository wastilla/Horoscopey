//
//  DescriptionView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
import SwiftUI

struct DescriptionView: View {
    let symbol: String
    let title: String
    let content: String
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack{
                VStack{
                    Text(symbol)
                        .font(.largeTitle)
                    Text(title + ":")
                        .font(.system(.title, design: .rounded))
                        .bold()

                }
                .padding(.bottom, 10)
                Text(content)
            }
            .padding()
            //.font(.system(size: 36))
            .cornerRadius(10)
        }
        .frame(width: 350, height: 350)
        .cornerRadius(20)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(symbol: "🕰", title: "Lucky Time", content: "6PM")
    }
}

