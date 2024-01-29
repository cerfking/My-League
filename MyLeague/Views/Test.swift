//
//  Test.swift
//  MyLeague
//
//  Created by Sebastian on 2024/1/22.
//

import SwiftUI


struct Test: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

#Preview {
    Test()
}
