//
//  TipView.swift
//  aquadroid
//
//  Created by Андрей Глухих on 07/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

@IBDesignable class TipView: UIView {
	
	// MARK: Dialog Appereance
	let radius: CGFloat = 4
	let arrowWidth: CGFloat = 8
	let arrowHeight: CGFloat = 6
	var arrowViewRect: CGRect?

	// MARK: Text Label Appereance
	let offset: CGFloat = 6
	let fontSize: CGFloat = 13
	
	lazy var textLabel: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(fontSize)
		label.numberOfLines = 0
		return label
	} ()
	
	func setupTipView(viewToArrow: UIView, leftAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, message: String) {
		arrowViewRect = viewToArrow.frame
		translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			self.leftAnchor.constraint(equalTo: leftAnchor),
			rightAnchor.constraint(equalTo: viewToArrow.rightAnchor),
			bottomAnchor.constraint(equalTo: viewToArrow.topAnchor, constant: -6)
		])
		setText(text: message)
	}
	
	override func draw(_ rect: CGRect) {
		let path = UIBezierPath()
		
		guard let arrowViewRect = arrowViewRect else {
			return
		}
		
		let xToArrowView = rect.maxX - arrowViewRect.width / 2
		
		path.move(to: CGPoint(x: rect.minX + radius, y: 0))
		
		path.addLine(to: CGPoint(x: rect.maxX - radius, y: 0))
		path.addArc(withCenter: CGPoint(x: rect.maxX - radius, y: radius), radius: radius, startAngle: 3 / 2 * .pi, endAngle: 0, clockwise: true)
		
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - arrowHeight - radius))
		path.addArc(withCenter: CGPoint(x: rect.maxX - radius, y: rect.maxY - arrowHeight - radius), radius: radius, startAngle: 0, endAngle: .pi / 2, clockwise: true)
		
		path.addLine(to: CGPoint(x: xToArrowView + arrowWidth / 2, y: rect.maxY - arrowHeight))
		path.addLine(to: CGPoint(x: xToArrowView, y: rect.maxY - radius / 2))
		path.addLine(to: CGPoint(x: xToArrowView - arrowWidth / 2, y: rect.maxY - arrowHeight))

		path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY - arrowHeight))
		path.addArc(withCenter: CGPoint(x: rect.minX + radius, y: rect.maxY - arrowHeight - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
		
		path.addLine(to: CGPoint(x: rect.minX, y: radius))
		path.addArc(withCenter: CGPoint(x: rect.minX + radius, y: radius), radius: radius, startAngle: .pi, endAngle: 3 / 2 * .pi, clockwise: true)
		UIColor.white.setFill()
		path.fill()

		layer.shadowPath = path.cgPath
	}
	
	func setText(text: String) {
		self.addSubview(textLabel)
		textLabel.text = text
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
			textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -arrowHeight - offset),
			textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset),
			textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset)
		])
	}
	
	override func layoutSubviews() {
		self.backgroundColor = .clear
		layer.shadowRadius = 2
		layer.shadowOpacity = 0.2
		layer.shadowOffset = CGSize(width: 0, height: 1)
		
	}
}
