//
//  ViewController.swift
//  HelloSubject
//
//  Created by sungyeon kim on 2022/08/28.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
    
}

class StringSubscriber: Subscriber {

    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
        print("Subscription Recevied")
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("input: \(input)")
        return .max(0)
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }

}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Subjects
            // - Publisher
            // - Subscribers
        
        let subject = PassthroughSubject<String, MyError>()
        
        let subscriber = StringSubscriber()
        
        subject.subscribe(subscriber)
        
        let subscription = subject.sink { completion in
            print("Received Completion form sink")
        } receiveValue: { value in
            print("Received value form sink")
        }

        
        subject.send("A")
        subject.send("B")
        subscription.cancel()
        subject.send("C")
        subject.send("D")
        subject.send("E")
        subject.send("F")
    }
    
}

