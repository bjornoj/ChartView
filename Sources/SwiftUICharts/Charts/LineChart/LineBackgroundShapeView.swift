// Created 11.01.2022

import SwiftUI

struct LineBackgroundShapeView: View {
    var chartData: ChartData
    var geometry: GeometryProxy
    var style: ChartStyle
    var lineStyle: LineStyle

    var body: some View {
        ZStack {
            LineBackgroundShape(data: chartData.normalisedPoints)
                .transform(CGAffineTransform(scaleX: geometry.size.width / CGFloat(chartData.normalisedPoints.count - 1),
                                             y: geometry.size.height / CGFloat(chartData.normalisedRange)))
                .fill(LinearGradient(gradient: Gradient(colors: [style.backgroundColor.startColor,
                                                                 style.backgroundColor.endColor]),
                    startPoint: .bottom,
                    endPoint: .top))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        }
    }
}
