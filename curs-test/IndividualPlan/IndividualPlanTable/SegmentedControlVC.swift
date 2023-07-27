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
        if let data = viewData {
            return data.Semesters[rootView.selector.selectedSegmentIndex].Disciplines.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DisciplineTVCell.identifier,
            for: indexPath) as? DisciplineTVCell
        else {
            fatalError()
        }
        
        guard let viewData = viewData else { return cell }
        
        let currDiscipline = viewData.Semesters[rootView.selector.selectedSegmentIndex].Disciplines[indexPath.row
        ]
        
        let disciplineName = currDiscipline.DisciplineName.nameRu
        var lectureHours: DisciplineTVCell.Hours? = nil
        var seminarHours: DisciplineTVCell.Hours? = nil
        var labHours: DisciplineTVCell.Hours? = nil
        
        for lesson in currDiscipline.Lesson {
            switch lesson.LessonTypeId {
            case "1":
                lectureHours = DisciplineTVCell.Hours(plannedHours: lesson.Hours, realHours: lesson.RealHours)
            case "2":
                seminarHours = DisciplineTVCell.Hours(plannedHours: lesson.Hours, realHours: lesson.RealHours)
            case "3":
                labHours = DisciplineTVCell.Hours(plannedHours: lesson.Hours, realHours: lesson.RealHours)
            default:
                break
            }
        }

        cell.configure(with: .init(disciplineName: disciplineName, lectureHours: lectureHours, seminarHours: seminarHours, labHours: labHours))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DisciplineTVCell.preferredHeight
    }
    
}
