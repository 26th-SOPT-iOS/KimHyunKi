### 테이블 뷰 만들기

1. 테이블 뷰 드래그 앤 드롭 / 오토 레이아웃 / 뷰 컨트롤러에 연결하기
2. 테이블 뷰 셀 드래그 앤 드롭 / 이 때 테이블 뷰의 Contetn: Dynamic Prototypes
3. 테이블뷰셀의 Identifier 지정하기
4. 이미지뷰, 라벨 등 테이블 뷰 셀 안에 들어가는 요소 추가 / 오토 레이아웃 주기
5. New - File - CoCoaTouch Class - subClass: UITableViewCell
6. 생성해준 TableViewCell과 연결하기
7. 테이블뷰 셀 내의 요소 클릭 후 Assistant View 열면 새로만든 Cell로 갈 수 있다.
8. 새로만든 Cell에 Iboutlet 선언(이미지, 라벨 등) / Identifier 선언
9. Swift 파일 생성. 들어갈 Data의 구조선언 ex) DataInformation.Swift
10. mainViewController (테이블 뷰가 있는 뷰의 뷰컨 파일)에서 리스트 선언
11. Extension  --> Data Source, Delegate
12. 테이블뷰(생성IBOUTLET) : .datasource = self ,  .delegate = self
13. TableViewCell로 만든 파일에서 SetDateInformation 작성
14. ViewController(main)에서 Section 별 Row 개수 등 필요한 부분 지정 