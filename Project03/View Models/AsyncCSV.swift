//
//  AsyncCSV.swift
//  Project03
//
//  Created by Kirtland Ross on 5/27/21.
//

import Foundation
import CoreData
class AsyncCSV : Operation{
    let context : NSManagedObjectContext?
    private let lockQueue = DispatchQueue(label: "LamNguyen.Project03.AsyncCSV", attributes: .concurrent)

    init(context: NSManagedObjectContext){
        self.context = context
        super.init()
    }
    override var isAsynchronous: Bool {
        return true
    }

    private var _isExecuting: Bool = false
    override private(set) var isExecuting: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isExecuting
            }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            lockQueue.sync(flags: [.barrier]) {
                _isExecuting = newValue
            }
            didChangeValue(forKey: "isExecuting")
        }
    }

    private var _isFinished: Bool = false
    override private(set) var isFinished: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isFinished
            }
        }
        set {
            willChangeValue(forKey: "isFinished")
            lockQueue.sync(flags: [.barrier]) {
                _isFinished = newValue
            }
            didChangeValue(forKey: "isFinished")
        }
    }

    override func start() {
        print("Starting")
        isFinished = false
        isExecuting = true
        main()
    }

    override func main() {

        DispatchQueue.global().async(execute: {
            DataDelegate(context: self.context!).generateInitialProducts()
            print("Executing")
            self.finish()
        })
    }

    func finish() {
        isExecuting = false
        isFinished = true
    }
}


