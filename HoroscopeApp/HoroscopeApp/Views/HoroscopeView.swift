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
    @ObservedObject var viewModel: HoroscopeViewModel
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
                                    .cornerRadius(10)
                                }
                                .frame(width: 175, height: 175)
                                .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                    HStack {
                        NavigationLink(destination:
                            YesterdayView(sign: self.sign, viewModel: self.viewModel),
                            label: {
                                Image(systemName: "chevron.left")
                                    .bold()
                                Text("Yesterday")

                            })

                        Spacer()
                        NavigationLink(destination:
                            TomorrowView(sign: self.sign, viewModel: self.viewModel),
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
        HoroscopeView(sign: "gemini", viewModel: HoroscopeViewModel())
    }
}
