import SwiftUI

/// Styles specific to a line chart
public class LineStyle: ObservableObject {
    // color for vertical lines
    public let verticalLineColor: Color

    // width of the chart line
    public let lineWidth: CGFloat

    // how lines should be joined
    public let lineJoinType: CGLineJoin

    /// Initialize with only a vertical line color
    /// - Parameters:
    ///   - verticalLineColor: a `Color`
    public init(verticalLineColor: Color) {
        self.verticalLineColor = verticalLineColor

        lineWidth = 3
        lineJoinType = .round
    }

    /// Initialize with a specific linewidth and a line join type
    /// Vertical lines defaults to white
    /// - Parameters:
    ///   - lineWidth: width of the line `CGFloat`
    ///   - lineJoinType: how lines should be joined `CGLineJoin`
    public init(lineWidth: CGFloat, lineJoinType: CGLineJoin) {
        self.lineWidth = lineWidth
        self.lineJoinType = lineJoinType

        verticalLineColor = .white
    }

    /// Initialize with a specific linewidth.
    /// vertical line color defaults to white and line join type
    /// to round
    /// - Parameters:
    ///   - lineWidth: width of the line `CGFloat`
    public init(lineWidth: CGFloat) {
        self.lineWidth = lineWidth

        verticalLineColor = .white
        lineJoinType = .round
    }

    /// Initialize with only defaults values
    public init() {
        lineWidth = 3
        verticalLineColor = .white
        lineJoinType = .round
    }
}
