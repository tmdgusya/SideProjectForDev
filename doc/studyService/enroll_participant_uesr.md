## Enroll Participant Request


### Request

- url : "/api/study/{id}/participants"

- method : **PUT**

```json
{
    headers : {
        "auth-token" : "asdjlasdblj!@#bluaguo"
    },
    prarms : {
        "studyId" : 1
    }
    requestbody : {
        "participants" : [""]
    }
}
```

### Response

```json
{
    "success" : true,
    "data" : null,
    "error" : null
}
```

## Error 

```json
{
    "success" : false,
    "data" : null
    "error" : {
        "errorCode" : 1001,
        "message" : "Study Enroll Error!"
    }
}

```