import UIKit
// これはちゃんとimportしておく
import CoreData

class ViewController: UIViewController {
    
    // TextFieldを用意
    var memoField: UITextField!
    
    // メモと日時を入れる配列を用意
    var memos: [NSString] = []
    var dates: [NSDate] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // text field
        memoField = UITextField(frame: CGRectMake(100, 100, 200, 30))
        memoField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoField)
        
        // write button
        let writeBtn: UIButton = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.backgroundColor = UIColor.magentaColor()
        writeBtn.setTitle("write", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
        
        // read button
        let readBtn: UIButton = UIButton(frame: CGRectMake(100, 200, 200, 30))
        readBtn.backgroundColor = UIColor.orangeColor()
        readBtn.setTitle("read", forState: UIControlState.Normal)
        readBtn.addTarget(self, action: "readData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(readBtn)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // 書き込み処理（writeBtnのアクション）
    func writeData() {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let memoContext: NSManagedObjectContext = appDel.managedObjectContext
        let memoEntity: NSEntityDescription! = NSEntityDescription.entityForName("MemoStore", inManagedObjectContext: memoContext)
        var newData = MemoStore(entity: memoEntity, insertIntoManagedObjectContext: memoContext)
        newData.memo = memoField.text!
        newData.date = NSDate()
    }
    
    // 読み込み処理（readBtnのアクション）
    func readData() {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let memoContext: NSManagedObjectContext = appDel.managedObjectContext
        let memoRequest: NSFetchRequest = NSFetchRequest(entityName: "MemoStore")
        memoRequest.returnsObjectsAsFaults = false
        var results: NSArray! = try? memoContext.executeFetchRequest(memoRequest)
        
        memos = []
        dates = []
        
        for data in results {
            memos.append(data.memo)
            dates.append(data.date)
        }
        
        // コンソールに表示
        print(memos)
        print(dates)
    }
}