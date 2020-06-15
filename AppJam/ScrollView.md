## 스크롤 뷰 구현하기

(탑 뷰에 고정되는 것이 있는 경우)

1. 위에 고정물(이미지) 놓고 오토레이아웃 주기
2. Scroll View를 아래 끌어다 놓은 다음(Content Layout Guied 체크해제 해야 함) 스크롤 위치에 맞춰 크기주고(width, height) 오토레이아웃 주기(15 0 0 0)
3. ScrollView의 상위 뷰에 equal width 주기 
4. Content View 넣어주기 (UIView 추가) ex) 375, 950: 들어갈 크기 지정
5. 오토레이아웃 width 375 , height 950주기
6. 오토레이아웃 0/0/0 다 주기
7. equal width to View 해 주기 (제일 상위 뷰, 즉 전체 뷰에 equal width)
8. ScrollView에 bottom/ trailing/ leading/ top 다 걸려 있어야 함 



이미지 뷰(트레일링 리딩 탑 equal width, equal height)

뷰(a) 집어 넣고 (트레일링0 리딩0 바텀0 탑: 이미지 뷰까지의 거리)

스크롤 뷰를 뷰(a) 아래에 집어넣고 오토 레이아웃 0 0 0 0 

뷰(컨텐츠 뷰)를 스크롤 뷰 아래에 집어넣고 오토 레이아웃 0 0 0 0 / 최상위 뷰에 equal width, equal height

