//: Playground - noun: a place where people can play

import Foundation

fileprivate func getSmaller(then n: UInt64) -> UInt64 {
    var copy_n = n
    var position: UInt8 = 0
    
    while copy_n > 0 {
        if copy_n & 1 == 0 && position > 0 {
            break
        }
        copy_n >>= 1
        position += 1
    }
    
    var result: UInt64 = n | (1 << position)
    result &= ~(1 << (position - 1))

    return result
}

fileprivate func getGreater(then n: UInt64) -> UInt64 {
    var copy_n = n
    var position: UInt8 = 0
    
    while copy_n > 0 {
        if copy_n & 1 == 0 && position > 0 {
            break
        }
        copy_n >>= 1
        position += 1
    }
    
    var result: UInt64 = n | (1 << position)
    result &= ~(1 << (position - 1))
    
    return result
}

func compute(for n: UInt64) {
    let greater = getGreater(then: n)
    let smaller = getSmaller(then: n)
    
    print("Output: \(smaller) and \(greater)")
}

compute(for: 11)
