import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8f63756dfcc2be5d0904f240efe203d5&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1.create a url
        if let url = URL(string: urlString) {
            //2.create a urlsession
            let session = URLSession(configuration: .default)
            
            //3. give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
}
