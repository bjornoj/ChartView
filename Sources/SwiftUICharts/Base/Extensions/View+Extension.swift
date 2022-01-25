import SwiftUI

public extension View {
    /// Attach chart style to a View
    /// - Parameter style: chart style
    /// - Returns: `View` with chart style attached
    func chartStyle(_ style: ChartStyle) -> some View {
        environmentObject(style)
    }
}
