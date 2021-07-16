# Editing SideProject For Dev Wikis🎇

## 프로젝트 제작 이유

- 사이드 프로젝트 인원을 모으는데, 너무 사람찾기도 힘들고, 기존의 글들은 사용하는 프레임워크를 알아보기도 힘들고, 참석인원도 파악하기가 힘들었습니다.
- 그래서 개인적으로 사이드 프로젝트를 많이 하니깐 사람들도 쉽게 모을 수 있도록 만들기 위해 제작하게 되었습니다.

## 장점

- 가독성이 좋은 아이콘을 통한 사이드 프로젝트에서 요구하는 프레임워크 글 목록에서 식별 가능
- 인원 파악 가능 및 모집 완료시 단체 카톡방 일괄 전송 예정
- 별점 제도로 인한, 불량 유저 감시 가능

## 설계시 신경 썼던 부분

- 최대한 도메인 주도 설계를 기반으로 설계하려고 노력하였습니다.
- 아직은 초보이기에 설계를 최대한 신중하게 애를써서 구성해보았습니다.
- **동기 / 비동기**로 처리해야 할 부분은 무엇인지 생각해 보았습니다.
- 서버 구조를 스케일아웃 및 관리를 쉽게 하기 위해서 **도커파일로 구성해서 docker-compose 로 배포하는 방식**으로 구성하였습니다.
- **프론트엔드는 최대한 관심사별 레이어를 분리**해내기 위해서 노력해보았습니다.

### 백엔드 구조 설계

![image](https://user-images.githubusercontent.com/57784077/125680478-841dfc04-eb54-49a3-a4c1-877290902e73.png)

### 모델 설계

- [모델 설계](https://github.com/tmdgusya/SideProjectForDev/wiki/%EB%AA%A8%EB%8D%B8-%EC%84%A4%EA%B3%84)

### 도메인 분석

- [도메인 분석 초안](https://github.com/tmdgusya/SideProjectForDev/wiki/%EB%8F%84%EB%A9%94%EC%9D%B8-%EB%B6%84%EC%84%9D)

- [스터디 추가 수정 삭제 서비스 도메인 그림 분석](https://github.com/tmdgusya/SideProjectForDev/wiki/%EC%8A%A4%ED%84%B0%EB%94%94-%EB%93%B1%EB%A1%9D-%EC%88%98%EC%A0%95-%EC%82%AD%EC%A0%9C-%EB%8F%84%EB%A9%94%EC%9D%B8)

- [스터드 참가 요청 도메인](https://github.com/tmdgusya/SideProjectForDev/wiki/%EC%9C%A0%EC%A0%80-%EC%8A%A4%ED%84%B0%EB%94%94-%EC%B0%B8%EA%B0%80-%EC%9A%94%EC%B2%AD-%EB%8F%84%EB%A9%94%EC%9D%B8)

- [스터디 탈퇴 요청 도메인](https://github.com/tmdgusya/SideProjectForDev/wiki/%EC%8A%A4%ED%84%B0%EB%94%94-%ED%83%88%ED%87%B4-%EB%8F%84%EB%A9%94%EC%9D%B8-%EB%B6%84%EC%84%9D)
