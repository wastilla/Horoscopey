//
//  YesterdayView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
import SwiftUI

struct YesterdayView: View {
    let sign: String
    @StateObject var viewModel: HoroscopeViewModel = .init()
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.cyan, .white], center: .center, startRadius: 500, endRadius: 2)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 5) {
                        Text("Yesterday: " + viewModel.horoscope.currentDate)
                            .font(.title)
                            .bold()
                        Spacer()
                        DescriptionView(symbol: "📝", title: "Description", content: viewModel.horoscope.description)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ItemView(symbol: "🎨", title: "Color", content: viewModel.horoscope.color)
                            ItemView(symbol: "👩‍❤️‍👨", title: "Compatibility", content: viewModel.horoscope.compatibility)
                            ItemView(symbol: "🕰", title: "Lucky Time", content: viewModel.horoscope.luckyTime)

                            ItemView(symbol: "🧮", title: "Lucky Number", content: viewModel.horoscope.luckyNumber)

                            ItemView(symbol: "🗓", title: "Date Range", content: viewModel.horoscope.dateRange)
                        }
                    }
                    .padding()
                    NavigationLink(destination:
                        HoroscopeView(sign: self.sign),
                        label: {
                            
                            Text("Today")
                        Image(systemName: "chevron.right")
                            .bold()

                        })
                    .foregroundColor(.black)
                }
            }
            .navigationBarBackButtonHidden(true)
        }

        .onAppear {
            Task {
                viewModel.fetchHoroscope(sign: self.sign, day: "yesterday")
            }
        }
    }
}