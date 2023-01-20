//
//  HoroscopeViewModel.swift
//  HoroscopeApp
//
//  Created by will astilla on 1/18/23.
//

import Foundation
class HoroscopeViewModel: ObservableObject {
    @Published var horoscope: HoroscopeModel = .example
    
    @Published var savedHoroscopes: [HoroscopeModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let horoscopeKey: String = "horoscope_key"
    
    func fetchHoroscope(sign: String, day: String) {
        let url = URL(string: "https://aztro.sameerkumar.website/?sign=\(sign)&day=\(day)")!
        var request = URLRequest(url: url)
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("fail")
                return
            }
            
            do {
                let quotes = try JSONDecoder().decode(HoroscopeModel.self, from: data)
                DispatchQueue.main.async {
                    self?.horoscope = quotes
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: horoscopeKey),
            let savedItems = try? JSONDecoder().decode([HoroscopeModel].self, from: data)
        else { return }

        savedHoroscopes = savedItems
    }
    
    func addHoroscope() {
        savedHoroscopes.append(horoscope)
    }
    
    func removeHoroscope(horoscope: HoroscopeModel){
        if let index = savedHoroscopes.firstIndex(where: {$0.id == horoscope.id}){
            savedHoroscopes.remove(at: index)
        }
        
    }

    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(savedHoroscopes) {
            UserDefaults.standard.set(encodedData, forKey: horoscopeKey)
        }
    }
}
