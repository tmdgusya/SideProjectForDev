## Study Enroll

### Request

- url : "/api/study"

- method : POST

```json
{
    headers : {
        "auth-token" : "asdjlasdblj!@#bluaguo"
    },
    requestbody : {
        "titie" : "WEB APPLICATION PROJECT 모집",
        "content" : "<html> </html> markdown!",
        "frontFrameworks" : ["React", "Recoil", "Typescript", "Jest"],
        "backendFrameworks" : ["NestJS", "TypeScript", "Jest", "Kafka"],
        "designFrameworks" : ["figma", "html", "css"],
        "NumberOfFrontDev" : 2,
        "NumberOfBackEndDev" : 2,
        "NumberOfDesigner" : 2,
        "study_period_type" : "ONETIME" | "REGULAR",
        "study_place_type" : "ONLINE" | "OFFLINE"
    }
}
```

- COST YN 이 true 인 경우는 스터디에 대한 추적관리를 실시할 수 있어야 함..