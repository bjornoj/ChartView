import SwiftUI

/// Representation of a single data point in a chart that is being observed
public class ChartValue: ObservableObject {
    @Published public var currentValue: Double = 0
    @Published public var currentKey = Date(timeIntervalSince1970: 0)
    @Published public var interactionInProgress: Bool = false

    public init() {}
}
