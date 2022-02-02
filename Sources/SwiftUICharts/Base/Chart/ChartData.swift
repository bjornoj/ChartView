import SwiftUI

/// An observable wrapper for an array of data for use in any chart
public class ChartData: ObservableObject {
    @Published public var data: [(Date, Double)] = []

    var points: [Double] {
        data.map { $0.1 }
    }

    var values: [Date] {
        data.map { $0.0 }
    }

    var normalisedPoints: [Double] {
        let absolutePoints = points.map { abs($0) }
        return points.map { $0 / (absolutePoints.max() ?? 1.0) }
    }

    var normalisedRange: Double {
        (normalisedPoints.max() ?? 0.0) - (normalisedPoints.min() ?? 0.0)
    }

    var isInNegativeDomain: Bool {
        (points.min() ?? 0.0) < 0
    }

    /// Initialize with data array
    /// - Parameter data: Array of `Double`
    public init(_ data: [Double]) {
        self.data = data.map { (Date(timeIntervalSince1970: 0), $0) }
    }

    public init(_ data: [(Date, Double)]) {
        self.data = data
    }

    public init() {
        data = []
    }
}
