
import SwiftUI

struct CategoryView: View {
    
    var category: TodoEntity.Category
    
    @State var numberOfTasks = 0
    @State var showList = false
    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
                .sheet(isPresented: $showList) { TodoList(category: self.category)
                        .environment(\.managedObjectContext, self.viewContext)
                }
            
            Text(category.toString())
            Text("\(numberOfTasks) 件のタスク")
            Button(action: {} ) {
                Image(systemName: "plus")
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,minHeight: 150)
            .foregroundColor(.white)
            .background(category.color())
            .cornerRadius(20)
            .onTapGesture {
                self.showList = true
            }
    }
}

struct CategoryView_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st,numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd ,numberOfTasks: 100)
            CategoryView(category: .NImpUrg_3rd,numberOfTasks: 100)
            CategoryView(category: .NImpNUrg_4th,numberOfTasks: 100)
        }.environment(\.managedObjectContext,context)
    }
}
