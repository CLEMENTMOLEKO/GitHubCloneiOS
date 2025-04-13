//
//  ExploreView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    @StateObject var vm: ExploreViewModel = .init()
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                discoverSection
                activitySection
                repositoryList
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Error"), message: Text("An error occured please try again later the developers are lazy to tell you what's the error."))
            }
            .navigationTitle("Explore")
            .searchable(text: $vm.searchValue, prompt: Text("Search GitHub"))
            .task {
                await vm.getRepositories()
            }
        }
    }
}

private extension ExploreView {
    
    private var discoverSection: some View {
        Section {
            ForEach(vm.gitHubItems){ item in
                NavigationLink(value: item) {
                    ListRowItem(
                        iconBackground: item.iconBackgroundColor,
                        iconName: item.systemImage,
                        title: item.title
                    )
                }
            }
        } header: {
            Text("Discover")
        }
        .headerProminence(.increased)
    }
    
    private var activitySection: some View {
        //TODO: this section with the material background should be a component.
        Section {
            VStack(spacing: 15) {
                Image(systemName: "bubbles.and.sparkles")
                    .foregroundStyle(.cyan)
                    .font(.system(size: 50))
                    .padding(.bottom, 10)
                Text("Explore GitHub")
                    .font(.headline)
                Text("Star repositories and follow contributors to receive personalized suggestions")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical)
        } header: {
            HStack {
                Text("Activity")
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }
            }
        }
        .listRowBackground(
            ZStack {
                RadialGradient(colors: [.blue, .green, .pink, .purple, .blue.opacity(0.9)],
                               center: .topLeading,
                               startRadius: 5,
                               endRadius: 200)
                .opacity(0.2)
                Rectangle()
                    .fill(.clear)
                    .background(.thinMaterial)
            }
        )
        .headerProminence(.increased)
    }
    
    @ViewBuilder
    private var repositoryList: some View {
        switch vm.repositoriesState {
        case .loading:
            ProgressView()
        case .success:
            ForEach(vm.repositories) { repository in
                //maybe pass the id and make the request on the specific component for lazy loading?
                RepositoryActionCardView(repository: repository)
                    .pressable {
                        navigationManager.navigate(to: HomeNavigationValues.repositoryDetail(repository: repository))
                    }
            }
        case .failure:
            VStack {
                Text("There was an error loading repositories.")
                    .frame(maxWidth: .infinity)
                Button("Try Again") {
                    Task {
                        await vm.getRepositories()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ExploreView()
}
