//
//  FreeBoardTableView.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import UIKit
import PrettyConstraints

class FreeBoardTableView: UIView {

    private enum CellIdentifiers {
        static let id = "articleCell"
    }
    
    var viewModel: FreeBoardTableVM!
 
    var tableView : UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {

        self.addSubview(tableView)
        tableView.applyConstraints(.fitInView(self))
        tableView.register(UINib(nibName: "FreeBoardTC", bundle: nil), forCellReuseIdentifier: CellIdentifiers.id)
        //tableView.register(FreeBoardTC.self, forCellReuseIdentifier: CellIdentifiers.id)
        //tableView.isHidden = true
        tableView.dataSource = self
        //tableView.delegate = self
        //tableView.estimatedRowHeight = 600
        //tableView.separatorStyle = .none
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.prefetchDataSource = self
        
        viewModel = FreeBoardTableVM(delegate: self)
        
        
    }
    
    func viewDidAppear() {
        viewModel.fetchMovies()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension FreeBoardTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Hints:- Initial count almost 1200+ it's shound not best practice. if you want to use this code as production then you should use 2D array. and keep 60-100 item only that array when scrolling down adding 20 item end of the array then you must be remove 20 item from beginning of the array. and when scrolling up adding 20 item from beginning of the array then remove 20 item from end of the array.
        return viewModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FreeBoardTC = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.id, for: indexPath) as? FreeBoardTC else { return UITableViewCell() }
        
        if isLoadingCell(for: indexPath) {
           //TODO
        } else {
            cell.viewModel = viewModel.article(at: indexPath.row)
        }
        
        return cell
    }
}


extension FreeBoardTableView: FreeBoardTableVMDelegate {
    
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        // 1
//        guard let newIndexPathsToReload = newIndexPathsToReload else {
            //LLSpinner.stop()
            tableView.isHidden = false
            tableView.reloadData()
            return
//        }
//        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
//        tableView.reloadRows(at: indexPathsToReload, with: .automatic)
    }
    
    
    func onFetchFailed(with reason: String) {
        //LLSpinner.stop()
        print("fail")
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        //displayAlert(with: title , message: reason, actions: [action])
    }
    
    
}

private extension FreeBoardTableView {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        print("viewing number\(indexPath.row) \(viewModel.totalCount) ,avabilalbe\(viewModel.currentCount)")
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

extension FreeBoardTableView: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchMovies()
        }
    }
}









