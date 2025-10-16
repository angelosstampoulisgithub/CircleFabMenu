//
//  FabSubButton.swift
//  CircleFabMenu
//
//  Created by Angelos Staboulis on 16/10/25.
//

import SwiftUI

struct FabSubButton: View {
    let icon: String

    var body: some View {
        Button(action: {
            print("\(icon) tapped")
        }) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
    }
}
