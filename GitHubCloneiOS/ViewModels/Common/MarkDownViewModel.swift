//
//  MarkDownViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/10/06.
//

import Foundation

final class MarkDownViewModel: ObservableObject {
    let url: String
    @Published var markDownContent: String?
    @Published var markDownLoading = LoadingState.loading
    
    init(url: String) {
        self.url = url
    }
    
    @MainActor
    func getMarkDownContent() async {
        let apiservice = APIService()
        let markDownResult: Result<Data, APIError> = await apiservice.getData(from: url)
        
        switch markDownResult {
        case .success(let data):
            handleMarkDownSuccess(for: data)
        case .failure(_):
            markDownLoading = .failure
        }
    }
    
    private func handleMarkDownSuccess(for data: Data) {
        let decodedDataResults = decodeMarkDown(data)
        
        switch decodedDataResults {
        case .success(let decodedData):
            let decodedString = String(data: decodedData, encoding: .utf8)
            markDownContent = decodedString
            markDownLoading = .success
        case .failure(_):
            markDownLoading = .failure
        }
    }
        
    private func decodeMarkDown(_ data: Data) -> Result<Data, APIError> {
        //https://api.github.com/repos/octokit/octokit.rb/contents/README.md
        //content is base64 encoded.
        
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let content = json["content"] as? String else {
                return .failure(.failedToDecode)
            }
            
            return .success(Data(base64Encoded: content, options: .ignoreUnknownCharacters)!);
        }
        catch {
            print("Error decoding JSON: \(error)")
            return .failure(.failedToDecode)
        }
    }
}
