//
//  homeVM.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import Foundation

protocol FreeBoardTableVMDelegate: AnyObject {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

final class FreeBoardTableVM {
    
    private var apiService = YHAPIService.shared
    private weak var delegate: FreeBoardTableVMDelegate?
    
    private var articles: [Article] = []
    //private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    private var fetchLength: Int32 = 20
    

    init(delegate: FreeBoardTableVMDelegate) {
        self.delegate = delegate
    }
    
    ///전체 글 수
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return articles.count
    }
    
    func article(at index: Int) -> Article{
        return articles[index]
    }
    
    func fetchMovies() {
   
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
  
        let route = YHAPIRoute.boardList(length: fetchLength, boardCn: nil, boardSj: nil, boardTy: nil, creatDEnd: nil, creatDStart: nil, wrterLoginId: nil, wrterNcnm: nil, start: Int32(currentCount+1))
        
        apiService.requestJSON(route: route, completion: { [weak self]( decodedData: ArticleList?, responseSuccess) in
            guard let self = self else { return }
            if responseSuccess {
                DispatchQueue.main.async { [unowned self] in
                    self.isFetchInProgress = false
                    if let response = decodedData, let articleList = response.data, articleList.count > 0 {
                        if let newTotal = response.recordsTotal {
                            self.total = Int(newTotal)
                        }
                        self.articles.append(contentsOf: articleList)
                        let indexPathsToReload = self.calculateIndexPathsToReload(from: articleList)
                        self.delegate?.onFetchCompleted(with: indexPathsToReload)
                    } else {
                        self.delegate?.onFetchFailed(with: "글 목록 끝")
                    }
                }
            } else {
                self.isFetchInProgress = false
                self.delegate?.onFetchFailed(with: "통신 실패")
            }
        })
    }
    
                               
    private func calculateIndexPathsToReload(from newModerators: [Article]) -> [IndexPath] {
        let startIndex = articles.count - newModerators.count
        let endIndex = startIndex + newModerators.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}



