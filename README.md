# kkuduck_app
### **꾸덕 : 구독 관리 서비스 앱**

내가 구독하고 있는 서비스에 대해서 쉽고 간편하게 관리할 수 있는 앱입니다. 사용자는 사용자가 사용하고 있는 구독서비스에 관한 정보를 앱에 등록하면 등록한 구독서비스에 대한 지출일과 달마다 사용한 구독서비스의 총 금액을 확인할 수 있습니다.  

- **작업 기간**
    
    21.11.19 ~ 21.12.07
    
- **GitHub**
    
    [https://github.com/hyeji-K/kkuduck_app](https://github.com/hyeji-K/kkuduck_app)
    
- **개발 환경**
    - 프론트엔드: Swift, cocoapods, opensource
    - 백엔드: Django, Python, Azure(VM), MariaDB
    - 사용툴: Xcode, VSCode, Git, GitHub, Postman, swagger, Notion, Figma
    
- **기능**
    - 사용자 정보 - UserDefault 사용
    - 사용자가 입력한 구독 서비스 정보 저장 - PropertyList 사용
    - 사용자가 선택할 수 있는 구독 서비스 정보 - Alamofire 사용
    - 데이터를 이용한 구독 지출 정보 분석 - Charts 라이브러리 사용
    - 디바이스에 따른 뷰 적용 - Auto Layout 적용
    - 다국어 지원
    - 팀원들과 코딩스타일을 맞추기 위해 SwiftLint 적용
    
- **문제 해결 사례 & 배운 점**
    - List View에서 segment에 따른 다른 TableView를 보여줘야 하는 기능을 구현해야 했는데, 각각의 배열 함수를 만들어 만료일이 있는 데이터와, 만료일이 없는 데이터를 각각 넣어줘서 테이블뷰에 뿌려주는 형태로 구현하였다. 나중에 filter함수를 이용하여 구현할 수 있다는 것을 알게 되었다.
    - UserDefault를 사용하여 간단한 데이터를 저장할 수 있고, 앱을 삭제하지 않는 이상 데이터는 계속 남아있다는 것을 알게 되었다.
    - Singleton Pattern이란 여러 차례 호출되어도 한 번만 객체를 생성하는 것으로, 여러 뷰 컨트롤러에서 정해진 데이터를 불러오는데 사용하였다.
