# ios-luckycardgame ☘️

## 학습 계획 ✏️

### 7/4 (화)

**오전**      
- [v] 한 주간의 계획세우고 fork하기 (30m)   
- [v] 📚 UIView 코드로 화면 구현하는 방법 공부하기 - 화면 크기 조절 및 균등하게 분리하기 (1h)  
   
**오후**    
- [v] 📚 UIView 코드로 화면 구현하는 방법 공부하기 - 화면 크기 조절 및 균등하게 분리하기 (3h)   
* * *   

### 7/5 (수)   
**오전**   
- [v] 게임보드 만들기 구현하기 (3h)    
- [v] 배운 점 복습 및 README 작성 (30m)   
- [v] 📚 앱 기본 설정(Info.plist) 변경하는 방식에 대해 학습 및 앱 표시 이름 럭키카드로 변경 (30m) -> 미션 1 마무리     


     
**오후**    
- [v] 📚 Stack + Heap 프로세스 메모리 활용 학습 (1h)   
- [v] 📚 enum 학습 (30m)
- [v] 📚 객체지향 프로그래밍 학습 (1h)  
- [v] 럭키카드 클래스 구현하기 (1h)   
- [v] 콘솔 출력 및 미션 정리 (1h) -> 미션 2 마무리   

* * *    

### 7/6 (목)
**오전**   
- [v] 깃 문제 해결
 
    
**오후**    
- [v] 📚 Struct vs Class 학습 (1h)       
- [v] 📚 뷰 객체 관리하는 방식 학습 (1h)    
- [v] 📚 메모리 분석하는 디버깅 도구 학습 (30m)
* * *   

### 7/7 (금)

- [v] 📚 segment control에 따른 변화주기 학습 (30m)    
- [v] 📚 객체지향 프로그래밍 복습

### 7/8 ~ 7/9 (주말)
- [v] 카드 나눠주기 나머지 구현 (3h) -> 미션 3 마무리   


## 미션 ❗️

### **W1-2 럭키카드 클래스 구현하기**
* * *    

### 완성 날짜/시간 ⏰
2023/07/05 18:00   
* * *    
### 리뷰 반영 😎
- 전역 변수 없애고 enum 타입으로 namespace화하기
- 뷰를 viewcontroller에서 바로 설정하지 않고 함수로 만들어 그리기
- viewDidAppear -> viewSafeAreaInsetsDidChange에서 뷰 속성 설정   
* * * 
### 학습 내용 ✏️   
#### 1. class와 struct의 메모리 구조 차이
- class와 struct는 메모리 저장 방식에서 큰 차이가 있다.
- class는 인스턴스 데이터를 힙에 저장하고 struct는 스택에 저장한다.
- class는 참조 타입으로 인스턴스 복사 시 그 값이 복사가 되는 것이 아니고 메모리를 참조하게 된다.
- struct는 값 타입으로 인스턴스 복사 시 값을 복사한다.
이렇게 메모리 구조에 차이가 있는데 struct가 비교적 가볍고 오래 보관하지 않는 스택 영역에 데이터를 저장하기 때문에 메모리 효율 면에서 더 훌륭하다. 또, 상속과 메모리 누수등을 고려할 필요가 없으므로 상속과 참조가 필요하지 않을 경우 struct를 사용하는 것이 좋다.

#### 2. 열거형
- 원시값 (Raw Values): 타입 생성 및 접근 시 더 편하게 하기 위해 사용한다.
- 연관값 (Associated Values): 보다 구체적인 정보를 추가적으로 저장하기 위해 사용한다.
❗️하나의 열거형에서 원시값과 연관값을 동시에 사용할 수는 없다!
- Optional도 열거형 타입이다!
- 중첩 열거형도 가능하다.
- Switch문 활용한 분기 처리가 유용하다.
- static let을 사용해서 enum을 namespace로 사용할 수 있다!!

#### 3. 접근 지정자
- private, fileprivate, internal(default), public, open

#### 4. 객체지향프로그래밍
- 추상화 : 사물의 공통적인 성질을 추출하여 파악한다. (자동차, 자전거의 공통점 달린다, 멈춘다...)
- 상속 : 상위 클래스의 속성과 기능을 하위 클래스가 사용할 수 있다. (protocol보다는 추상화 정도가 낮음, 상위클래스의 속성/기능 가져다가 재사용만 가능)
- 다형성 : 기능이나 상황에 따라 여러 가지 형태를 가질 수 있다. (같은 메서드라도 오버라이딩을 통해 다른 역할을 수행하도록 한다 & 함수 매개변수로 protocol을 받는다)
- 캡슐화 : 서로 연관있는 속성이나 기능들을 하나의 캡슐로 만들어 데이터를 보호한다.
* * *   

### 구현 화면 📱  
|실행 화면|
|---|
|<img width="826" alt="image" src="https://github.com/sumin305/ios-luckycardgame/assets/110437548/b280ce0d-c22f-45d1-b210-b5afcda79520">|

* * *   


### 회고 💭
commit을 개발 중간에 하지 않아서 기록이 남지 않은게 많이 아쉽다. 다음 미션때부터는 이 부분을 꼭 신경써야겠다고 느꼈다. 또 final, fileprivate과 같이 모두가 습관적으로 사용하는 코드가 왜 사용되는지 그 개념을 알지 못하고 따라 쓰는 경우가 있었는데 그 점에 대해 공부하는 시간을 가질 수 있어서 좋았다. 이번 미션에서는 protocol을 사용하지 않았는데 protocol을 이용하여 다형성을 구현해보고 싶다.

### **W1-3 카드 나눠주기**
* * *    

### 완성 날짜/시간 ⏰
2023/07/10 12:00   
* * *    
### 리뷰 반영 😎
- 상위 객체를 추상화하고 하위 객체를 구체화하기
    - LuckyCardGameManager가 싱글톤 객체로 다양한 하위 객체들을 가짐
    - 카드를 직접 분배하지 않고 Deck에게 행동을 위임함
- protocol 지향적 설계하기
    - 당장 프로젝트에서 사용되지 않더라도 미래의 확장을 고려하여 Deck, Card protocol 생성
- 타입 선언하기
    - 카드 숫자가 범위를 벗어나는 것을 막기 위해 Int 타입을 사용하지 않고 Number라는 enum타입을 생성
- 객체 속성들 접근제어자 지정하기
    - 
* * * 
### 학습 내용 ✏️   
#### 1. class와 struct의 메모리 구조 차이
- class와 struct는 메모리 저장 방식에서 큰 차이가 있다.
- class는 인스턴스 데이터를 힙에 저장하고 struct는 스택에 저장한다.
- class는 참조 타입으로 인스턴스 복사 시 그 값이 복사가 되는 것이 아니고 메모리를 참조하게 된다.
- struct는 값 타입으로 인스턴스 복사 시 값을 복사한다.
이렇게 메모리 구조에 차이가 있는데 struct가 비교적 가볍고 오래 보관하지 않는 스택 영역에 데이터를 저장하기 때문에 메모리 효율 면에서 더 훌륭하다. 또, 상속과 메모리 누수등을 고려할 필요가 없으므로 상속과 참조가 필요하지 않을 경우 struct를 사용하는 것이 좋다.

#### 2. 열거형
- 원시값 (Raw Values): 타입 생성 및 접근 시 더 편하게 하기 위해 사용한다.
- 연관값 (Associated Values): 보다 구체적인 정보를 추가적으로 저장하기 위해 사용한다.
❗️하나의 열거형에서 원시값과 연관값을 동시에 사용할 수는 없다!
- Optional도 열거형 타입이다!
- 중첩 열거형도 가능하다.
- Switch문 활용한 분기 처리가 유용하다.
- static let을 사용해서 enum을 namespace로 사용할 수 있다!!

#### 3. 접근 지정자
- private, fileprivate, internal(default), public, open

#### 4. 객체지향프로그래밍
- 추상화 : 사물의 공통적인 성질을 추출하여 파악한다. (자동차, 자전거의 공통점 달린다, 멈춘다...)
- 상속 : 상위 클래스의 속성과 기능을 하위 클래스가 사용할 수 있다. (protocol보다는 추상화 정도가 낮음, 상위클래스의 속성/기능 가져다가 재사용만 가능)
- 다형성 : 기능이나 상황에 따라 여러 가지 형태를 가질 수 있다. (같은 메서드라도 오버라이딩을 통해 다른 역할을 수행하도록 한다 & 함수 매개변수로 protocol을 받는다)
- 캡슐화 : 서로 연관있는 속성이나 기능들을 하나의 캡슐로 만들어 데이터를 보호한다.
* * *   

### 구현 화면 📱  
|실행 화면|
|---|
|<img width="826" alt="image" src="https://github.com/sumin305/ios-luckycardgame/assets/110437548/b280ce0d-c22f-45d1-b210-b5afcda79520">|

* * *   


### 회고 💭
commit을 개발 중간에 하지 않아서 기록이 남지 않은게 많이 아쉽다. 다음 미션때부터는 이 부분을 꼭 신경써야겠다고 느꼈다. 또 final, fileprivate과 같이 모두가 습관적으로 사용하는 코드가 왜 사용되는지 그 개념을 알지 못하고 따라 쓰는 경우가 있었는데 그 점에 대해 공부하는 시간을 가질 수 있어서 좋았다. 이번 미션에서는 protocol을 사용하지 않았는데 protocol을 이용하여 다형성을 구현해보고 싶다.

