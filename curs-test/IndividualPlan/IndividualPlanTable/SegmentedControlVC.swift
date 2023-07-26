//
//  SegmentedControlVC.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class SegmentedControlVC: GenericVC<SegmentedControlView> {
    private var viewData: IndividualPlanModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    func configureView(with data: IndividualPlanModel) {
        viewData = data
        
        for i in 0..<2 {
            let element = data.Semesters
            rootView.selector.insertSegment(withTitle: "Семестр \(element[i].Number)", at: i, animated: true)
        }
        
        rootView.selector.selectedSegmentIndex = 0
    }
}

extension SegmentedControlVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DisciplineTVCell.identifier,
            for: indexPath) as? DisciplineTVCell
        else {
            fatalError()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DisciplineTVCell.preferredHeight
    }
    
}
