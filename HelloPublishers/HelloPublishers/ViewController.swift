//
//  ViewController.swift
//  HelloPublishers
//
//  Created by sungyeon kim on 2022/08/28.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
        
    typealias Input = String
    typealias Failure = Never

    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) // backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        print("Completed")
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification.Name("MyNotification")
        
//        let center = NotificationCenter.default
//        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { noti in
//            print("Notification recevied!")
//        }
//        center.post(name: notification, object: nil)
//        center.removeObserver(observer)
        
//        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
//
//        let subscription = publisher.sink { _ in
//            print("Notification recevied!")
//        }
//        NotificationCenter.default.post(name: notification, object: nil)
//
//        subscription.cancel()
//
//        NotificationCenter.default.post(name: notification, object: nil)
//        NotificationCenter.default.post(name: notification, object: nil)
//        NotificationCenter.default.post(name: notification, object: nil)
//        subscription.cancel()
        
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
        
        let subscriber = StringSubscriber()
        
        publisher.subscribe(subscriber)
    }


}

