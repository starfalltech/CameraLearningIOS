//
//  ContentView.swift
//  CameraLearning
//
//  Created by yanuar nauval ardian on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeCameraView = false
    @State private var cameraModel = DataModel()
    var body: some View {
        ZStack(alignment:.top) {
            Color.black
            HStack{
                Spacer()
                Button{
                }label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        
                        .foregroundColor(.black)
                        .padding()
                        .background(Color(.white))
                        .clipShape(Circle())
                
                }
            }
            .padding()
            
            VStack{
                Spacer()
                Button{
                    changeCameraView.toggle()
                }label: {
                    Circle().fill(Color(.white)).frame(height: 75)
                }
                .padding(.bottom,16)
            }
            
        }
        .onAppear(perform: {
            cameraModel.permissionCheck()
        })
    }
}

#Preview {
    ContentView()
}
