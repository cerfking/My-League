import UIKit
class VideoView: UIView {
    // 1
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Hello, UIKit!"
        label.textAlignment = .center
        
        return label
    }()
    
    func updateLabelText(_ newText: String) {
            label.text = newText
        }
    
    init() {
        super.init(frame: .zero)
      
        // 2
        backgroundColor = .systemPink
    
        // 3
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
