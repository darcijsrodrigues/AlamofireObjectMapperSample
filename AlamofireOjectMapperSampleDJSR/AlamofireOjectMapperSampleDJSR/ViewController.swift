//
//  ViewController.swift
//  AlamofireOjectMapperSampleDJSR
//
//  Created by Fourtime on 24/04/2018.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
 
    var projects:[Project] = []
    var threeDayForecastX: [Forecast]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
        tableView.reloadData()
//        fetchWeatherData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Example 1
    func fetchWeatherData(){
        
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(URL).responseObject{(response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value // getting JSON response here
            print(weatherResponse?.location)
            
            if let threeDayForecast = weatherResponse?.threeDayForecast{
                for forecast in threeDayForecast{
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
        }
    }
    
    // Example 2 - Using keyPath
    func fetchData(){
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/2ee8f34d21e8febfdefb2b3a403f18a43818d70a/sample_keypath_json"
        
        Alamofire.request(URL).responseObject(keyPath: "data"){ (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.location)
            
            if let threeDayForecast = weatherResponse?.threeDayForecast{
                self.threeDayForecastX = threeDayForecast
                for forecast in threeDayForecast{
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = threeDayForecastX![indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("celulaReuso", owner: self, options: nil)?.first as! WeatherTableViewCell

        cell.conditionLabel.text = not.conditions
        cell.dayLabel.text = not.day
        cell.temperatureLabel.text = String( not.temperature!)
        
        return cell
    }
    
}

