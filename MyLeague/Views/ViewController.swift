
import UIKit
import SceneKit
import GLTFKit2

class ViewController: UIViewController {
    var asset: GLTFAsset? {
        didSet {
            if let asset = asset {
                let source = GLTFSCNSceneSource(asset: asset)
                sceneView.scene = source.defaultScene
                animations = source.animations
             
                for animation in animations {
                    print(animation.name)
                }
                if let defaultAnimation = animations.first(where: {$0.name == "Idle1.SKINS_Ahri_ASU_PrePro.anm"}) {
                    defaultAnimation.animationPlayer.animation.usesSceneTimeBase = false
                    defaultAnimation.animationPlayer.animation.repeatCount = .greatestFiniteMagnitude
                    sceneView.scene?.rootNode.addAnimationPlayer(defaultAnimation.animationPlayer, forKey: nil)
                    defaultAnimation.animationPlayer.play()
                }
                sceneView.scene?.rootNode.addChildNode(cameraNode)
            }
        }
    }

    private var sceneView: SCNView = SCNView()

    private var animations = [GLTFSCNAnimation]()

    private let camera = SCNCamera()
    private let cameraNode = SCNNode()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAsset()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .systemBackground
        view.addSubview(sceneView)

        //loadAsset()
    }
    
    override func viewDidLayoutSubviews() {
        sceneView.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
    }

    private func loadAsset() {
        guard let assetURL = Bundle.main.url(forResource: "ahri",
                                             withExtension: "glb")
        else {
            print("Failed to find asset for URL")
            return
        }

        GLTFAsset.load(with: assetURL, options: [:]) { (progress, status, maybeAsset, maybeError, _) in
            DispatchQueue.main.async {
                if status == .complete {
                    self.asset = maybeAsset
                } else if let error = maybeError {
                    print("Failed to load glTF asset: \(error)")
                }
            }
        }
    }
}
