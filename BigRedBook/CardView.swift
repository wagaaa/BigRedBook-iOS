import SwiftUI

struct CardView: View {
    //var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            Image("")
                .resizable()
                .aspectRatio(3/4, contentMode: .fill)
                .frame(height: 200)
                .clipped()
            HStack{
                Text(title)
                    .frame(alignment: .leading)
                    .padding()
                Spacer()
            }
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Username")
                    .font(.subheadline)
                Spacer()
                Image(systemName: "heart")
                Text("\(30)")
                    .font(.subheadline)
            }
            //padding except top
            .padding(.horizontal)
            .padding(.bottom)
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.vertical, 8)
    }
}

#Preview {
    CardView(title: "Haha")
}
