### Infinite Scroll 만들기

무한 스크롤링

* 끊임없이 스크롤 되는 피드를 위한 것
* 테이블 뷰를 이용해서 구현
* 테이블 뷰를 오토 레이아웃으로 정렬한 뒤, 테이블 뷰 셀을 테이블 뷰에 넣는 방식으로 진행.



코드는 다음과 같다.

```swift
import UIKit
    
class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var fetchingMore = false
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 1
        } else if section == 1
        {
            return items.count
        } else if section == 2 && fetchingMore
        {
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath)
            
            return cell            
        } else if indexPath.section == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! FeedTableViewCell
            cell.username.setTitle("User \(items[indexPath.row])", for: .normal)
            
            return cell
        } else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height
        {
            if !fetchingMore
            {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch()
    {
        fetchingMore = true
        tableView.reloadSections(IndexSet(integer: 2), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            let newItems = (self.items.count...self.items.count + 10).map { index in index }
            self.items.append(contentsOf: newItems)
            self.fetchingMore = false
            self.tableView.reloadData()
        })
    }    
}
```



부분적으로 살펴보면

```swift
import UIKit
    
class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var fetchingMore = false
    var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
    }
```

- 이 부분은 피드 페이지를 위한 뷰 컨트롤러 HomeViewController의 시작 부분이다.
- HomeViewController 클래스를 만들고, 기본적으로 UIViewController를 상속 시켜준다.
- 그리고 테이블 뷰를 위한 클래스들을 상속 시켜준다.
- UITableViewDataSource, UITableViewDelegate를 말이다.
- 그리고 나서는 tableView라는 UITableView형의 IBOoutlet 변수를 만들어주고,
- fetchingMore 변수와 items 배열을 생성했다.
- viewDidLoad는 뷰가 화면에 로드 되면 호출되는 함수이다.
- 뷰 로드를 하면서 loadingCell을 생성하기 위해 저렇게 구현했다.



참고 유튜브 링크 : https://www.youtube.com/watch?v=OTHkcf9gSRw