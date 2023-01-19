//
//  TomorrowView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
import SwiftUI

struct TomorrowView: View {
    let sign: String
   // @StateObject var viewModel: HoroscopeViewModel = .init()
    @ObservedObject var viewModel: HoroscopeViewModel
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
                    Text("Tomorrow: " + viewModel.horoscope.currentDate)
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
                        
                        Button(action: {
                            self.viewModel.addHoroscope()
                            self.viewModel.saveItems()
                        }) {
                            ZStack {
                                Color.black.opacity(0.1)
                                VStack {
                                    VStack {
                                        Image(systemName: "square.and.arrow.down")
                                            .font(.largeTitle)
                                        Text("Save")
                                            .font(.system(.title2, design: .rounded))
                                            .bold()
                                    }
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                }
                                .padding()
                                // .font(.system(size: 36))
                                .cornerRadius(10)
                            }
                            .frame(width: 175, height: 175)
                            .cornerRadius(20)
                        }
                    }
                }
                .padding()
                NavigationLink(destination:
                                HoroscopeView(sign: self.sign, viewModel: self.viewModel),
                    label: {
                        Image(systemName: "chevron.left")
                            .bold()
                        Text("Today")

                    })
                .foregroundColor(.black)
            }
            
        }
        .navigationBarBackButtonHidden(true)

        .onAppear {
            Task {
                viewModel.fetchHoroscope(sign: self.sign, day: "tomorrow")
            }
        }
    }
}
