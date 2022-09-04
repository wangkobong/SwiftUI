//
//  ViewController.swift
//  WeatherAppCombine
//
//  Created by sungyeon kim on 2022/09/04.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var webservice: WebService = WebService()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPublisher()
        
//        cancellable = webservice.fetchWeather(city: "seoul")
//            .catch { _ in Just(Weather.placeholder)}
//            .map { weather in
//                if let temp = weather.temp {
//                    return "\(temp) ℉"
//                } else {
//                    return "Error getting weather!"
//                }
//            }
//            .assign(to: \.text, on: temperatureLabel)
    }
    
    private func setupPublisher() {
        
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: cityTextField)
        
        // San Antonio
        // San%20Antonio // encoded
        
        cancellable = publisher
            .compactMap {
                ($0.object as! UITextField).text?
                .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webservice.fetchWeather(city: city)
                    .catch { _ in
                        Just(Weather.placeholder)
                    }
            }.sink {
                if let temp = $0.temp {
                    self.temperatureLabel.text = "\(temp) ℉"
                } else {
                    self.temperatureLabel.text = "정보 없음"
                }
            }
    }
}

