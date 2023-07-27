//
//  BottomTableHeaderView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class BottomTableHeaderView: UIView {
    let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let lectureView: UIView = {
        let view = UIView()
        return view
    }()

    let seminarView: UIView = {
        let view = UIView()
        return view
    }()

    let labView: UIView = {
        let view = UIView()
        return view
    }()
    
    let leftViewLabel = TableLabel(text: NSLocalizedString("courseTitle", comment: "Individual Plan Strings"),
                                   font: UIFont.systemFont(ofSize: 14),
                                   color: .systemGray,
                                   linesNumber: 0)
    
    let lectureLabel = TableLabel(text: NSLocalizedString("lecture", comment: "Individual Plan Strings"),
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    let seminarLabel = TableLabel(text: NSLocalizedString("seminar", comment: "Individual Plan Strings"),
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    let labLabel = TableLabel(text: NSLocalizedString("lab", comment: "Individual Plan Strings"),
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    private func addViews() {
        addSubviews(leftView, rightView)
        leftView.addSubview(leftViewLabel)
        
        rightView.addSubviews(lectureView, seminarView, labView)
        
        lectureView.addSubview(lectureLabel)
        seminarView.addSubview(seminarLabel)
        labView.addSubview(labLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
        
        leftViewLabel.anchor(left: self.leftAnchor, right: leftView.rightAnchor, paddingLeft: 10)
        leftViewLabel.centerY(in: leftView)
        
        lectureView.anchor(top: self.topAnchor, left: rightView.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        seminarView.anchor(top: self.topAnchor, left: lectureView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        labView.anchor(top: self.topAnchor, left: seminarView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        lectureLabel.center(in: lectureView, in: lectureView)
        seminarLabel.center(in: seminarView, in: seminarView)
        labLabel.center(in: labView, in: labView)
    }
    
}
