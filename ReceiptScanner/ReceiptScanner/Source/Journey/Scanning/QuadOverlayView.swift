//
//  QuadOverlayView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 25/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import UIKit

class QuadOverlayView: UIView {

	private var drawnQuad: Quad?
	private var shapeLayer = CAShapeLayer()
	private var topLeftView = UIView()
	private var topRightView = UIView()
	private var bottomRightView = UIView()
	private var bottomLeftView = UIView()

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)

		shapeLayer.fillColor = UIColor.orange.withAlphaComponent(0.5).cgColor
		shapeLayer.fillRule = .nonZero
		layer.addSublayer(shapeLayer)

		topLeftView.backgroundColor = .red
		topLeftView.frame.size = CGSize(width: 20, height: 20)
		addSubview(topLeftView)

		bottomLeftView.backgroundColor = .orange
		bottomLeftView.frame.size = CGSize(width: 20, height: 20)
		addSubview(bottomLeftView)

		bottomRightView.backgroundColor = .green
		bottomRightView.frame.size = CGSize(width: 20, height: 20)
		addSubview(bottomRightView)

		topRightView.backgroundColor = .purple
		topRightView.frame.size = CGSize(width: 20, height: 20)
		addSubview(topRightView)

		updateLayer()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Updates

	override func layoutSubviews() {
		super.layoutSubviews()

		updateLayer()
	}

	private func updateLayer() {
		shapeLayer.frame = bounds

		guard let quad = drawnQuad else { return }
		draw(quad: quad)
	}

	// MARK: - Draw

	func draw(quad: Quad?) {
		drawnQuad = quad
		let quadToDraw = quad ?? .zero

		let multiplyPoint = CGPoint(x: bounds.width, y: bounds.height)
		let topLeftPoint = CGPoint(point: quadToDraw.topLeft) * multiplyPoint
		let topRightPoint = CGPoint(point: quadToDraw.topRight) * multiplyPoint
		let bottomRightPoint = CGPoint(point: quadToDraw.bottomRight) * multiplyPoint
		let bottomLeftPoint = CGPoint(point: quadToDraw.bottomLeft) * multiplyPoint

		let path = UIBezierPath()
		path.move(to: topLeftPoint)
		path.addLine(to: topRightPoint)
		path.addArc(withCenter: topRightPoint, radius: 10.0, startAngle: 0, endAngle: 360, clockwise: true)
		path.addLine(to: bottomRightPoint)
		path.addArc(withCenter: bottomRightPoint, radius: 20.0, startAngle: 0, endAngle: 360, clockwise: true)
		path.addLine(to: bottomLeftPoint)
		path.addArc(withCenter: bottomLeftPoint, radius: 30.0, startAngle: 0, endAngle: 360, clockwise: true)
		path.close()
		shapeLayer.path = path.cgPath

		topLeftView.frame.origin = CGPoint(
			x: topLeftPoint.x - topLeftView.frame.size.width,
			y: topLeftPoint.y - topLeftView.frame.size.height
		)

		bottomLeftView.frame.origin = CGPoint(
			x: bottomLeftPoint.x - bottomLeftView.frame.size.height,
			y: bottomLeftPoint.y
		)

		bottomRightView.frame.origin = CGPoint(
			x: bottomRightPoint.x,
			y: bottomRightPoint.y
		)

		topRightView.frame.origin = CGPoint(
			x: topRightPoint.x,
			y: topRightPoint.y - topRightView.frame.size.height
		)
	}
}
