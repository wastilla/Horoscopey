//
//  ItemView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
import SwiftUI

struct ItemView: View {
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
                    Text(title)
                        .font(.system(.title2, design: .rounded))
                        .bold()

                }
                .padding(.bottom, 10)
                Text(content)
            }
            .padding()
            //.font(.system(size: 36))
            .cornerRadius(10)
        }
        .frame(width: 175, height: 175)
        .cornerRadius(20)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(symbol: "🕰", title: "Lucky Time", content: "6PM")
    }
}
