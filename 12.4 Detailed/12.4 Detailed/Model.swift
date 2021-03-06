import UIKit

extension Int {
    fileprivate func stringPadded(to count: Int) -> String {
        var string = String(self)
        while string.count < count { string = "0" + string }
        return string
    }
}

class Model {
    static let shared = Model()
    private init() {}
    
    enum Animation: String, CaseIterable {
        case bureaucrat = "Talking Bureaucrat"
        case frog = "Talking Frog"
        case ranger = "Talking Ranger"
        case vendor = "Talking Vendor"
        case bot = "Talking Woodbot"
    }
    
    private let cellCounts = [Animation.bureaucrat: 26, .frog: 62, .ranger: 86, .vendor: 36, .bot: 69]
    
    var characters: [Animation] {
        return Animation.allCases
    }
    
    func image(for character: Animation) -> UIImage {
        // RETURN THE 000 IMAGE FOR THE GIVEN CHARACTER HERE
        let val = "\(character.rawValue)000"
        let image = UIImage(named: val)!
        return image
    }

    func cells(for character: Animation) -> [UIImage] {
        // RETURN AN ARRAY OF IMAGES FOR THE GIVEN CHARACTER HERE
        var array: [UIImage] = []
        guard let numImages = cellCounts[character] else { return [] }
        
        for index in 0..<numImages {
            let name = "\(character.rawValue)\(index.stringPadded(to: 3))"
            let animatedImage = UIImage(named: name)!
            array.append(animatedImage)
        }
        return array
    
    }
    
    func countAnimation() -> Int {
       return characters.count
    }
}
