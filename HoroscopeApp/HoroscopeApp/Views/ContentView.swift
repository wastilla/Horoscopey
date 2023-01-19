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
    var body: some View {
        NavigationStack {
            ZStack{
                RadialGradient(colors: [.cyan,.white], center: .center, startRadius: 500, endRadius: 2)
                    .ignoresSafeArea()
                VStack {
                    Text("Select A Zodiac Sign to Begin")
                        .font(.system(.title, design: .rounded))
                        //.bold()
                    //Spacer()
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
                            HoroscopeView(sign: self.sign),
                            label: {
                                Text("Get Started")
                                    .foregroundColor(.black)
                                    .padding(30)
                                    .background(Color.black.opacity(0.18))
                                    .cornerRadius(10)

                            })
                    }
                    else{
                        Text("")
                            .foregroundColor(.black)
                            .padding(30)
                            .background(Color.black.opacity(0.0))
                            .cornerRadius(10)
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Horoscopey 🌙")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
