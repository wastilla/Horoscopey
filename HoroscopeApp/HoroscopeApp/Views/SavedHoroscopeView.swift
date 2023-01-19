//
//  SavedHoroscopeView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/19/23.
//

import Foundation
import SwiftUI

struct SavedHoroscopeView: View {
    let description: String
    let color: String
    let compatibility: String
    let luckyTime: String
    let luckyNumber: String
    let dateRange: String
    let currentDate: String
    
    @Environment(\.presentationMode) var presentationMode
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    var body: some View {
        ZStack {
            RadialGradient(colors: [.cyan, .white], center: .center, startRadius: 500, endRadius: 2)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 5) {
                    Text(currentDate)
                        .font(.title)
                        .bold()
                    Spacer()
                    DescriptionView(symbol: "📝", title: "Description", content: description)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ItemView(symbol: "🎨", title: "Color", content: color)
                        ItemView(symbol: "👩‍❤️‍👨", title: "Compatibility", content: compatibility)
                        ItemView(symbol: "🕰", title: "Lucky Time", content: luckyTime)

                        ItemView(symbol: "🧮", title: "Lucky Number", content: luckyNumber)

                        ItemView(symbol: "🗓", title: "Date Range", content: dateRange)
                    }
                }
                .padding()
                NavigationLink(destination:
                    ContentView(),
                    label: {
                        Image(systemName: "chevron.left")
                            .bold()
                        Text("Back To Home")

                    })
                    .foregroundColor(.black)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SaveHoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedHoroscopeView(description: "fl;kdsajf;laksjlasjlkjdaljdljdlsjlsadjldsjldsjldsa", color: "red", compatibility: "gemini", luckyTime: "12pm", luckyNumber: "4", dateRange: "Mar 14 - Jun 16", currentDate: "September")
    }
}
