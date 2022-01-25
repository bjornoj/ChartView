import SwiftUI

struct LineShape: Shape {
    var data: [Double]

    var animatableData: [Double] {
        get { data }
        set {data = newValue}
    }

    func path(in _: CGRect) -> Path {
        let step = CGPoint(x: 1.0, y: 1.0)
        var path = Path()
        if data.count < 2 {
            return path
        }
        let offset = data.min() ?? 0
        var point1 = CGPoint(x: 0, y: CGFloat(data[0] - offset) * step.y)
        path.move(to: point1)
        for pointIndex in 1 ..< data.count {
            let point2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(data[pointIndex] - offset))
            let midPoint = CGPoint.midPointForPoints(firstPoint: point1, secondPoint: point2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(firstPoint: midPoint, secondPoint: point1))
            path.addQuadCurve(to: point2, control: CGPoint.controlPointForPoints(firstPoint: midPoint, secondPoint: point2))
            point1 = point2
        }
        return path
    }
}

struct LineShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader { geometry in
                LineShape(data: [0, 0.5, 0.8, 0.6, 1])
                    .transform(CGAffineTransform(scaleX: geometry.size.width / 4.0, y: geometry.size.height))
                    .stroke(Color.red)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            GeometryReader { geometry in
                LineShape(data: [0, -0.5, 0.8, -0.6, 1])
                    .transform(CGAffineTransform(scaleX: geometry.size.width / 4.0, y: geometry.size.height / 1.6))
                    .stroke(Color.blue)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
}
