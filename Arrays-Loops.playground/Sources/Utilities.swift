import Foundation

public func convertToOptional(array: [Character]) -> [Character?] {
    var ret = [Character?]()
    for c in array {
        ret.append(c)
    }
    return ret
}
