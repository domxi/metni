//
//  AddView.swift
//  ListApp
//
//  Created by Everyone Can Code on 7/24/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type time taken and medication!", text: $textFieldText)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.635, saturation: 0.0, brightness: 0.953))
                    .cornerRadius(7)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 35)
                        .frame(width: 65)
                        .background(Color.accentColor)
                        .cornerRadius(5)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add medication +")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    /*making the save button work*/
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = "Your new item must be at least 2 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
