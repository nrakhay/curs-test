//
//  IndividualPlanSCView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class SegmentedControlView: UIView {
    private var viewData: IndividualPlanModel? = nil
    
    let selector: UISegmentedControl = {
        let control = UISegmentedControl()
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        addSubviews(selector)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        selector.anchor(top: self.topAnchor, width: self.width, height: 50)
        selector.centerX(in: self)
    }
    
    func configureView(with data: IndividualPlanModel) {
        viewData = data
        
        for i in 0..<2 {
            let element = data.Semesters
            selector.insertSegment(withTitle: "Семестр \(element[i].Number)", at: i, animated: true)
        }
        
        selector.selectedSegmentIndex = 0
    }

}
