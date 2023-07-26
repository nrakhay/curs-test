//
//  BottomTableHeaderView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class BottomTableHeaderView: UIView {
    let leftView = UIView()
    
    let rightView = UIView()
    
//    let lectureView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
//
//    let seminarView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()
//
//    let laboratoryView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .cyan
//        return view
//    }()
    
    let leftViewLabel = TableLabel(text: "Наименование дисциплины",
                                   font: UIFont.systemFont(ofSize: 14),
                                   color: .systemGray,
                                   linesNumber: 0)
    
    let lectureLabel = TableLabel(text: "Лекция",
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    let seminarLabel = TableLabel(text: "Семинар",
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    let laboratoryLabel = TableLabel(text: "Лаборатория",
                                  font: UIFont.systemFont(ofSize: 14),
                                  color: .systemGray)
    
    let lessonTypeSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    private func addViews() {
        addSubviews(leftView, rightView)
        leftView.addSubview(leftViewLabel)
        
        rightView.addSubview(lessonTypeSV)
        lessonTypeSV.addArrangedSubviews(lectureLabel, seminarLabel, laboratoryLabel)
//        lessonTypeSV.addArrangedSubviews(lectureView, seminarView, laboratoryView)
        
//        lectureView.addSubview(lectureLabel)
//        seminarView.addSubview(seminarLabel)
//        laboratoryView.addSubview(laboratoryLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
        
        leftViewLabel.anchor(left: self.leftAnchor, right: leftView.rightAnchor, paddingLeft: 10)
        leftViewLabel.centerY(in: leftView)
        
        lessonTypeSV.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingRight: 10)
    
    }
    
}
