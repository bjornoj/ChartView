import Foundation

extension Array where Element == ColorGradient {
    /// <#Description#>
    /// - Parameter index: offset in data table
    /// - Returns: <#description#>
    func rotate(for index: Int) -> ColorGradient {
        if isEmpty {
            return ColorGradient.orangeBright
        }

        if count <= index {
            return self[index % count]
        }

        return self[index]
    }
}
