//
//  CodeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/24.
//

import Foundation

class CodeContentViewModel: ObservableObject {
    @Published var searchCodeText = ""
    @Published var codeState: LoadingState = .loading
    @Published var codeContentList: [CodeContent] = []
    
    let apiService = APIService()
    
    func getCode(for repository: String, owner: String, path: String?) async {
        await dowloadCode(for: repository, owner: owner, path: path)
    }
    
    @MainActor
    func dowloadCode(for repository: String, owner: String, path: String?) async {
        var url = "https://api.github.com/repos/\(owner)/\(repository)/contents";
        if path != nil {
            url.append("/\(path!)")
        }
        
        let codeResults: Result<[CodeContent], APIError> = await apiService.getJSONData(
            from: url,
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        switch codeResults {
        case .success(let codeList):
            print("success getting commits")
            self.codeContentList = codeList
            codeState = .success
        case .failure(let error):
            print("failed to get code.\(error)")
            codeState = .failure
        }
    }
}
