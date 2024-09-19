import UIKit
import Combine

class ExerciseCollectionViewController: ExerciseBaseViewController {

    private var contents: [ExerciseCollectionViewModel.Content] = []
    private let viewModel = ExerciseCollectionViewModel()
    private var disposables: Set<AnyCancellable> = Set()
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        baseConfigureView()
        
        collectionView.register(UINib(nibName: "ExerciseCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ExerciseCell")
        collectionView.dataSource = self
        collectionView.delegate = self

        let layout = DynamicColumnFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadContents()
    }

    private func draw(_ contents: [ExerciseCollectionViewModel.Content]) {
        self.contents = contents
        collectionView.reloadData()
    }
}

extension ExerciseCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCollectionViewCell
        let content = contents[indexPath.item]
        cell.configure(with: content)
        return cell
    }
}

class DynamicColumnFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let isLandscape = UIDevice.current.orientation.isLandscape
        let isIPad = UIDevice.current.userInterfaceIdiom == .pad
        let numberOfColumns: Int
        
        if isIPad || isLandscape {
            numberOfColumns = 2
        } else {
            numberOfColumns = 1
        }
        
        let horizontalMargin: CGFloat = 16
        let verticalMargin: CGFloat = 8
        let totalMargin = horizontalMargin * CGFloat(numberOfColumns + 1)
        let availableWidth = collectionView.bounds.width - totalMargin
        let itemWidth = availableWidth / CGFloat(numberOfColumns)
        
        itemSize = CGSize(width: itemWidth, height: 128)
        
        minimumLineSpacing = verticalMargin
        minimumInteritemSpacing = verticalMargin
        sectionInset = UIEdgeInsets(top: verticalMargin, left: horizontalMargin, bottom: verticalMargin, right: horizontalMargin)
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

class ExerciseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
    }

    func configure(with content: ExerciseCollectionViewModel.Content) {
        titleLabel.text = content.title
        imageView.image = UIImage(named: content.imageName)
    }

    private func setupCellAppearance() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
}


// MARK: Exercise configuration (not touch it)
extension ExerciseCollectionViewController {
    
    static func create() -> UIViewController {
        ExerciseCollectionViewController(nibName: "ExerciseCollectionViewController", bundle: .main)
    }
    
    private func loadContents() {
        viewModel.load().sink { _ in
            // do nothing
        } receiveValue: { [weak self] contents in
            self?.draw(contents)
        }
        .store(in: &disposables)
    }
    
    private func baseConfigureView() {
        title = "Ej1: CollectionView"
    }
}
