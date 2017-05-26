//
//  Material.swift para construir las clases
//  MappleI
//
//  Created by Bruno Garelli on 4/26/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Alamofire
import Foundation

public final class /* struct */ DispatchOnce {
    private var lock = os_unfair_lock()
    private var isInitialized = false
    public /* mutating */ func perform(block: (Void) -> Void) {
        os_unfair_lock_lock(&lock)
        if !isInitialized {
            block()
            isInitialized = true
        }
        os_unfair_lock_unlock(&lock)
    }
}
