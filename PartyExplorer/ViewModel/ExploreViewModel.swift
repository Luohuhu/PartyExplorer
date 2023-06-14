//
//  ExploreViewModel.swift
//  PartyExplorer
//
//  Created by Xianfu Luo on 6/13/23.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var appData: [Party] = []
    let possibleImageURL = ["https://media.istockphoto.com/id/1298329918/photo/birthday-celebratory-toast-with-string-lights-and-champagne-silhouettes.jpg?s=612x612&w=0&k=20&c=PaDeMR5-r0NdlxghuVF9tRqR5XkCdNdTzxrkofv0Syk=",
                            "https://plus.unsplash.com/premium_photo-1684629279315-c4ebcfe56e98?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGFydHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60",
                            "https://images.pexels.com/photos/59884/pexels-photo-59884.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/2705089/pexels-photo-2705089.jpeg?auto=compress&cs=tinysrgb&w=1600"]
    var id:Int  = -1
    init() {
        self.appData = []
        self.appData.append(contentsOf: partiesGen(num: 3))
    }
    func addOneParty() {
        self.appData.append(partyGen())
    }
    func partiesGen(num: Int) -> [Party]{
        var newParties: [Party] = []
        for _ in 1...num{
            newParties.append(partyGen())
        }
        return newParties
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    func partyGen() -> Party{
        id += 1
        let name: String = "Party " + randomString(length: 3)
        let imgURL: String = possibleImageURL.randomElement()!
        let price: Double = Double.random(in: 10.0 ..< 100.0)
        let startDate: Date = Date.random(in: Date() ..< Date().addingTimeInterval(180*24*60))
        let endDate: Date? = Bool.random() ? Date.random(in: startDate ..< startDate.addingTimeInterval(30*24*60)) : nil
        return Party(id: id, name: name, imgURL: imgURL, price: price, startDate: startDate, endDate: endDate)
    }
    func getStartDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/DD/YYYY"
                return dateFormatter.string(from: date)
    }
}
extension Date {
    static func random(in range: Range<Date>) -> Date {
        Date(
            timeIntervalSinceNow: .random(
                in: range.lowerBound.timeIntervalSinceNow...range.upperBound.timeIntervalSinceNow
            )
        )
    }
    static func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        return dateFormatter.string(from: date)
    }
}
