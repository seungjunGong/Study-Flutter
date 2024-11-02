### User Agent

normard coder의 flutter 강의를 듣던 중
이미지를 불러오는 부분에서 똑같이 따라해보던중 처음 보는 오류가 났다.

확인해보니 user-agent 값을 헤더에 넣어주어야 한다고 한다.

#### What is User-Agent?

user agent 는 HTTP 요청을 보내는 디바이스와 브러우저 등 사용자 소프트웨어의
식별 정보를 담고 있는 request header 의 한 종류이다.

-   임의로 수정 될 수 없다.
-   HTTP 요청 에러가 발생했을 때 요청을 보낸 사용자 환경을 알아 보기 위해 사용한다.

![image](https://github.com/user-attachments/assets/c345189d-6c54-4771-b5c1-97dace381d44)

다음과 같이 console 창에서 확인이 가능하다.

`User-Agent: Mozilla/5.0 (<system-information>) <platform> (<platform-details>) <extensions>`
위와 같은 형식으로 확인되니 확인해보자

[참고출처](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent)

완료!!
apk 빌드 : 터미널에 flutter build apk --release --target-platform=android-arm64
