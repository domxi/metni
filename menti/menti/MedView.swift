//
//  MedView.swift
//  menti
//
//  Created by Dominik on 7/24/23.
//

import SwiftUI

struct MedView: View {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(listViewModel)
    }
}

#Preview {
    MedView()
}
