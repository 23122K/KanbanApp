import SwiftUI

struct FormTitleView: View {
    let title: String
    let highlitedWord: String
    
    init(title: String, highlitedWord: String = "") {
        self.title = title
        self.highlitedWord = highlitedWord
    }
    
    var body: some View {
        Group(content: {
            Text(title)
            +
            Text(" ")
            +
            Text(highlitedWord)
                .foregroundColor(.blue.opacity(0.7))
        })
        .font(.title)
        .bold()
    }
}

struct FormTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FormTitleView(title: "Create your", highlitedWord: "team")
    }
}
