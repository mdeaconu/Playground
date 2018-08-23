//: Playground - noun: a place where people can play

import Foundation

//: use struct
fileprivate struct TwinBits {
    var number: UInt64 = 0
    var nextGreater: UInt64 {
        if number == 0 {
            return 0
        }
        if number & (number - 1) == 0 {
            return number << 1
        }
        
        return core(n: number)
    }
    
    var nextSmaller: UInt64 {
        if number == 0 {
            return 0
        }
        if number & (number - 1) == 0 {
            return number >> 1
        }
        return 0
    }
    
    private func findLSB(for n: UInt64) -> UInt64 {
        let less = n - 1
        let nn = (less | n) ^ less
        return UInt64(log2(Double(nn + 1)))
    }
    
    private func core(n: UInt64) -> UInt64 {
        var copy_n = number
        var position: UInt8 = 0
        
        while copy_n > 0 {
            if copy_n & 1 == 0 && position > 0 {
                break
            }
            copy_n >>= 1
            position += 1
        }
        
        var result: UInt64 = number | (1 << position)
        result &= ~(1 << (position - 1))
        
        return result
    }
}

fileprivate let n = TwinBits(number: 14)
print("nextGreater: \(n.nextGreater)")
