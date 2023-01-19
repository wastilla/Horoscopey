//
//  HoroscopeView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
import SwiftUI

struct HoroscopeView: View {
    @Environment(\.presentationMode) var presentationMode
    let sign: String
    @StateObject var viewModel: HoroscopeViewModel = .init()
    //@EnvironmentObject var viewModel: HoroscopeViewModel
    let columns = [
        GridItem(.adaptive(minimum: 130))
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.cyan, .white], center: .center, startRadius: 500, endRadius: 2)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 5) {
                        Text("Today: " + viewModel.horoscope.currentDate)
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
                    HStack {
                        NavigationLink(destination:
                            YesterdayView(sign: self.sign),
                            label: {
                                Image(systemName: "chevron.left")
                                    .bold()
                                Text("Yesterday")

                            })

                        Spacer()
                        NavigationLink(destination:
                            TomorrowView(sign: self.sign),
                            label: {
                                Text("Tomorrow")
                                Image(systemName: "chevron.right")
                                    .bold()

                            })
                    }
                    .foregroundColor(.black)
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                /* Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back to Home")
                        }
                        .foregroundColor(.black)
                    } */
                NavigationLink(destination:
                    ContentView(sign: self.sign),
                    label: {
                        Image(systemName: "chevron.left")
                            .bold()
                        Text("Back to Home")

                    })
                    .foregroundColor(.black

                    ))
        }

        .onAppear {
            Task {
                viewModel.fetchHoroscope(sign: self.sign, day: "today")
            }
        }
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView(sign: "gemini")
    }
}
