//
//  ContentView.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
    @State var sign: String = "None"
    @StateObject var viewModel: HoroscopeViewModel = .init()
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.cyan, .white], center: .center, startRadius: 500, endRadius: 2)
                    .ignoresSafeArea()
                VStack {
                    Text("Select A Zodiac Sign to Begin")
                        .font(.system(.title, design: .rounded))
                    // .bold()
                    // Spacer()
                    Picker("Please choose a Zodiac Sign", selection: $sign) {
                        ForEach(signs, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(WheelPickerStyle())

                    Spacer()
                    Text("Selected: " + sign)
                        .font(.system(.title, design: .rounded))
                    if self.sign != "None" {
                        NavigationLink(destination:
                            HoroscopeView(sign: self.sign, viewModel: self.viewModel),
                            label: {
                                Text("Get Started")
                                    .foregroundColor(.black)
                                    .padding(30)
                                    .background(Color.blue.opacity(0.18))
                                    .cornerRadius(10)

                            })
                    }
                    else {
                        Text("")
                            .foregroundColor(.black)
                            .padding(30)
                            .background(Color.black.opacity(0.0))
                            .cornerRadius(10)
                    }
                    Text("Your Favorites:")
                    ScrollView {
                        ForEach(self.viewModel.savedHoroscopes) { horoscope in
                            NavigationLink(destination:
                                SavedHoroscopeView(description: horoscope.description, color: horoscope.color,
                                                   compatibility: horoscope.compatibility, luckyTime: horoscope.luckyTime, luckyNumber: horoscope.luckyTime, dateRange: horoscope.dateRange, currentDate: horoscope.currentDate),
                                label: {
                                HStack(spacing: 20) {
                                        Text(horoscope.currentDate)
                                        
                                        Button(action: {
                                            self.viewModel.removeHoroscope(horoscope: horoscope)
                                            self.viewModel.saveItems()
                                        }) {
                                            Image(systemName: "minus.circle")
                                                .font(.title)
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(Color.cyan.opacity(0.1))
                                    .border(.gray, width: 0.5)
                                })
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Horoscopey 🌙")
            }
            .onAppear {
                self.viewModel.getItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
