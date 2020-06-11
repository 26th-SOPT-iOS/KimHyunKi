## 스크롤 뷰 구현하기

(탑 뷰에 고정되는 것이 있는 경우)

1. 위에 고정물(이미지) 놓고 오토레이아웃 주기
2. Scroll View를 아래 끌어다 놓은 다음 스크롤 위치에 맞춰 크기주고(width, height) 오토레이아웃 주기(15 0 0 0)
3. ScrollView의 상위 뷰에 equal width 주기 
4. Content View 넣어주기 (UIView 추가) ex) 375, 950: 들어갈 크기 지정
5. 오토레이아웃 width 375 , height 950주기
6. 오토레이아웃 0/0/0 다 주기
7. equal width to View 해 주기 (제일 상위 뷰, 즉 전체 뷰에 equal width)
8. ScrollView에 bottom/ trailing/ leading/ top 다 걸려 있어야 함 