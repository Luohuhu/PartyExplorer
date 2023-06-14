//
//  CardView.swift
//  PartyExplorer
//
//  Created by Xianfu Luo on 6/13/23.
//

import SwiftUI

struct CardView: View {
    @State var data: Party
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(data.name).font(.largeTitle).foregroundColor(Color.white)
            AsyncImage(url: URL(string: data.imgURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }.frame(width: UIScreen.main.bounds.width/2 - 10)
            .cornerRadius(20.0)
            HStack{
                VStack{
                    Text("Start: \(data.startDate.formatDate())")
                        .foregroundColor(Color.white)
                    if let endDate = data.endDate{
                        Text("End:   \(endDate.formatDate())")
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
                Text("$" + String(format: "%.2f", data.price)).font(.title2).foregroundColor(Color.yellow)
            }
        }.frame(width: UIScreen.main.bounds.width/2 - 10)
            .padding(.horizontal)
            .background(.purple)
            .cornerRadius(30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(data: Party(id: 0, name: "Party abc", imgURL: "https://plus.unsplash.com/premium_photo-1684629279315-c4ebcfe56e98?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGFydHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60", price: 199.99, startDate: Date(), endDate: Date()))
    }
}
extension Date {
        func formatDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/YYYY")
            return dateFormatter.string(from: self)
        }
}
