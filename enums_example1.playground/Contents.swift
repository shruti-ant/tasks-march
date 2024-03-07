import UIKit


/*
 Traffic Light Simulator: Create a Swift program that simulates a traffic light system using enums. The program should allow the user to switch between different traffic light states (red, yellow, green) and display appropriate messages indicating the current state of the traffic light.
 */


enum TrafficLightState {
    case red, yellow, green
    
    func next() -> TrafficLightState {
        switch self {
        case .red:
            return .green
        case .yellow:
            return .red
        case .green:
            return .yellow
        }
    }
    
    func getMessage() -> String {
        switch self {
        case .red:
            return "Stop"
        case .yellow:
            return "Light about to change"
        case .green:
            return "Go"
        }
    }
}

class TrafficLightSimulator {
    var currentState: TrafficLightState = .red
    
    func switchState() {
        currentState = currentState.next()
    }
    
    func displayState() {
        print(currentState.getMessage())
    }
}

let simulator = TrafficLightSimulator()
simulator.displayState()
simulator.switchState()
simulator.displayState()
simulator.switchState()
simulator.displayState()
simulator.switchState()
simulator.displayState()

