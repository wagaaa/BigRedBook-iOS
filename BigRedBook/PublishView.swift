import SwiftUI


struct PublishView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("基本信息")) {
                    TextField("标题", text: $title)
                    TextEditor(text: $content)
                }
                
                Section(header: Text("添加图片")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else {
                        Button(action: {
                            isImagePickerPresented.toggle()
                        }) {
                            Text("选择图片")
                        }
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(selectedImage: $selectedImage)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        // 处理发布逻辑
                    }) {
                        Text("发布")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("发布")
        }
    }
}

#Preview{
    PublishView()
}

