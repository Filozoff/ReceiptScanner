//
//  Closure.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public typealias EmptyClosure = () -> Void
public typealias ValueClosure<T> = ValueReturnClosure<T, Void>
public typealias ValueReturnClosure<T, R> = (_ value: T) -> R
