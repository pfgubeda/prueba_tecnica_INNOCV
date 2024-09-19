
import Foundation
import Combine

struct ExerciseCollectionViewModel {
    
    struct Content: Hashable {
        let id: Int
        let title: String
        let imageName: String
    }
    
    func load() -> AnyPublisher<[Content], Never> {
        let titles: [String] = [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            "Curabitur non ipsum eros. Suspendisse non dictum dolor",
            "Sed commodo rhoncus magna, et aliquam ante vehicula sit amet",
            "Proin fringilla rutrum enim, et blandit erat"
        ]
        
        let images: [String] = [
            "ingredients_1",
            "ingredients_2",
            "ingredients_3",
            "ingredients_4"
        ]
        
        let contents: [Content] = (0..<20).map { i in
            Content(id: i, title: titles[i % titles.count], imageName: images[i % images.count])
        }
        
        return Just(contents).eraseToAnyPublisher()
    }
    
}
