## Participant Request


### Request

- url : "/api/study/{id}/participants"

- method : **POST**

```json
{
    headers : {
        "auth-token" : "asdjlasdblj!@#bluaguo"
    },
    params : {
        "studyId" : 1
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

- 근데 User 는 