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
        tableView.delegate = self
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
        return viewModel.currentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FreeBoardTC = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.id, for: indexPath) as? FreeBoardTC else {
            print("셀 디큐 에러")
            return UITableViewCell()
            
        }
        cell.viewModel = viewModel.article(at: indexPath.row)
        return cell
    }
}

extension FreeBoardTableView:UITableViewDelegate {
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.contentOffset.y > tableView.contentSize.height-tableView.bounds.size.height {
            viewModel.fetchMovies()
        }
    }
}


extension FreeBoardTableView: FreeBoardTableVMDelegate {
    
    func onFetchCompleted(with newIndexPathsToInsert: [IndexPath]?) {
        guard let newIndexPathsToInsert = newIndexPathsToInsert else { return }
        print("insertdIndexPath: \(newIndexPathsToInsert.first!.row)~\(newIndexPathsToInsert.last!.row)")
        tableView.insertRows(at: newIndexPathsToInsert, with: .none)
    }
    
    func onFetchFailed(with reason: String) {
        print(reason)
    }
    
    
}






