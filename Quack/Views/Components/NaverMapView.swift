//
//  NaverMapView.swift
//  Quack
//
//  Created by 차차 on 2/10/25.
//

import SwiftUI
import NMapsMap

struct NaverMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let mapView = NMFNaverMapView()

        return mapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
}

#Preview {
    NaverMapView()
}
