//
//  Adaptable.swift
//  TableViewAdapter
//
//  Created by Anton Ukhankin on 29.03.2020.
//  Copyright © 2020 idpuzzle1. All rights reserved.
//

public protocol Adaptable {
    associatedtype Model
    associatedtype Configuration
    
    func reset()
    func adapt(model: Model, configuration: Configuration)
}

public extension Adaptable {
    func reset() {}
}

open class ViewAdapter<Model, Configuration, View> where View: Adaptable, View.Model == Model, View.Configuration == Configuration {
    public let model: Model
    public let configuration: Configuration
    
    public init(model: Model, configuration: Configuration) {
        self.model = model
        self.configuration = configuration
    }
    
    public func reset(view: View) {
        view.reset()
    }
    
    public func adapt(view: View) {
        view.adapt(model: model, configuration: configuration)
    }
}
