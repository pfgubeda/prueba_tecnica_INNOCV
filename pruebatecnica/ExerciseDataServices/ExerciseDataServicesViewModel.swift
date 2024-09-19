import Foundation
import Combine

struct InnocvUser: Decodable {
    let id: Int
    let name: String
}

class ExerciseDataServicesViewModel {
    
    var users: AnyPublisher<[InnocvUser], Never> {
        _users.eraseToAnyPublisher()
    }
    
    private var _users: PassthroughSubject<[InnocvUser], Never> = PassthroughSubject()
    private var cancellables = Set<AnyCancellable>()
    
    func load(){
        loadWithAsyncAwait()
        //loadWithCombineAndURLSession()
    }
    
    private func loadWithAsyncAwait(){
        Task {
                    do {
                        let users = try await fetchUsers()
                        notify(users: users)
                    } catch {
                        notify(users: [])
                    }
                }
    }
    
    private func fetchUsers() async throws -> [InnocvUser] {
        guard let url = URL(string: "https://hello-world.innocv.com/api/User") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let safeUsers = try JSONDecoder().decode([Safe<InnocvUser>].self, from: data)
        return safeUsers.compactMap { $0.value }
    }
    
    private func loadWithCombineAndURLSession() {
        guard let url = URL(string: "https://hello-world.innocv.com/api/User") else {
            notify(users: [])
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Safe<InnocvUser>].self, decoder: JSONDecoder())
            .map { $0.compactMap { $0.value } }
            .receive(on: DispatchQueue.main)
            .catch { _ in Just([]) }
            .sink { [weak self] users in
                self?.notify(users: users)
            }
            .store(in: &cancellables)
    }
    
    
    private func notify(users: [InnocvUser]) {
        _users.send(users)
    }
}
