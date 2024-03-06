import UIKit
import Foundation


/*
 Calendar Event:
 Design a struct to represent calendar events with properties for event title, start time, end time, and location. Include methods to check if two events overlap.
 */


struct CalendarEvent {
    var title: String
    var startTime: Date
    var endTime: Date
    var location: String
    
    func checkOverlap(with otherEvent: CalendarEvent) -> Bool {
        return (startTime <= otherEvent.endTime) && (otherEvent.startTime <= endTime)
    }
}

let event1 = CalendarEvent(title: "Meeting1", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), location: "Room 1")
let event2 = CalendarEvent(title: "Meeting2", startTime: Date(timeIntervalSinceNow: 1800), endTime: Date(timeIntervalSinceNow: 7200), location: "Room 2")

if event1.checkOverlap(with: event2) {
    print("Events overlap.")
} else {
    print("Event don't overlap.")
}

