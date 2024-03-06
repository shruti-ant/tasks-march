import UIKit

/*
 Example Scenario: Suppose we are developing a weather app that fetches weather data from different APIs based on user preferences. The app consists of two classes: WeatherService to handle data retrieval and SettingsManager to manage user preferences.
 */

enum WeatherAPI {
    case openWeather
    case other
}

//Just few dummy vars/funcs so code compiles
struct WeatherData {}
struct WeatherAPIClient {}
func createAPIClientFromPreference() -> WeatherAPIClient {return WeatherAPIClient()}

// ** Singleton Example **

class WeatherService {
    static let shared = WeatherService()
    private init() {}

    func fetchWeatherData() -> WeatherData? {
        // Implementation to fetch weather data from the selected API
        return nil
    }
}

class SettingsManager {
    static let shared = SettingsManager()
    private init() {}

    var selectedAPI: WeatherAPI = .openWeather // Default API

    func updateSelectedAPI(api: WeatherAPI) {
        self.selectedAPI = api
    }
}

// Fetch weather data using Singleton
let weatherData = WeatherService.shared.fetchWeatherData()

// Update selected API using Singleton
SettingsManager.shared.updateSelectedAPI(api: .openWeather)



// ** Dependency injection example **

class WeatherService2 {
    let apiClient: WeatherAPIClient
    
    // we use Dependency Injection to pass the WeatherAPIClient to the WeatherService
    init(apiClient: WeatherAPIClient) {
        self.apiClient = apiClient
    }
    
    func fetchWeatherData() -> WeatherData? {
        // Implementation to fetch weather data using the provided API client
        return nil
    }
}

class SettingsManager2 {
    var selectedAPI: WeatherAPI = .openWeather // Default API

    func updateSelectedAPI(api: WeatherAPI) {
        self.selectedAPI = api
    }
}

// Create WeatherAPIClient based on user preference
let apiClient = createAPIClientFromPreference()

// Inject the WeatherAPIClient into WeatherService
let weatherService = WeatherService2(apiClient: apiClient)

// Fetch weather data using Dependency Injection
let weatherData2 = weatherService.fetchWeatherData()

// Update selected API
let settingsManager = SettingsManager2()
settingsManager.updateSelectedAPI(api: .openWeather)

