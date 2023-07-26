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
    
    let topTableHeaderView = TopTableHeaderView()
    let bottomTableHeaderView = BottomTableHeaderView()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        addSubviews(selector, topTableHeaderView, bottomTableHeaderView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        selector.anchor(top: self.topAnchor, width: self.width, height: 50)
        selector.centerX(in: self)
        
        topTableHeaderView.anchor(top: selector.bottomAnchor, width: self.width, height: 40)
        topTableHeaderView.centerX(in: self)
        
        bottomTableHeaderView.anchor(top: topTableHeaderView.bottomAnchor, width: self.width, height: 60)
        bottomTableHeaderView.centerX(in: self)
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
