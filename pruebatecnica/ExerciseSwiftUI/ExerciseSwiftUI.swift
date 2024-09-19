import SwiftUI
import Combine

struct ExerciseSwiftUI: View {
    
    @ObservedObject private var viewModel = NewsViewModel()
    @State private var isLandscape = UIDevice.current.orientation.isLandscape
    
    var body: some View {
        NavigationView {
            ScrollView {
                let columns = isLandscape ? 2 : 1
                let gridItemLayout = Array(repeating: GridItem(.flexible()), count: columns)
                
                LazyVGrid(columns: gridItemLayout, spacing: 8) {
                    ForEach(viewModel.news) { content in
                        ZStack(alignment: .bottomLeading) {
                            Image(content.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 128)
                                .clipped()
                            
                            Color.black.opacity(0.35)
                                .frame(height: 128)
                                .clipped()
                            
                            Text(content.title)
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(height: 128)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }.scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1.0 : 0.5)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                    }
                }
            }
            .navigationTitle("Historial de cambios")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .onAppear {
            viewModel.load()
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                isLandscape = UIDevice.current.orientation.isLandscape
            }
        }
    }
}

struct ExerciseSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSwiftUI()
    }
}

private class NewsViewModel: ObservableObject {
    
    @Published var news: [Content] = []
    
    struct Content: Hashable, Identifiable {
        let id: Int
        let title: String
        let imageName: String
    }
    
    func load() {
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
        
        news = contents
    }
}
