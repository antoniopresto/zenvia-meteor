# Simple Zenvia SMS integration

```meteor add presto:zenvia```

## Sending a simple SMS

### Zenvia account:

```javascript
Zenvia.password = '12345';
Zenvia.username = 'xico_mineiro';
```

> Also accepts environment variables: ```ZENVIA_PASSWORD``` and ```ZENVIA_USERNAME```

### Sending:

```javascript
var args = {
  to: "551199999999",
  msg: "Teste " + Date.now()
};

var response = Zenvia.send(args);

//or

Zenvia.send(args, function(response) {
  console.log(response.error);
  console.log(response.body);
});
```

> [http://docs.zenviasms.apiary.io/#introduction/]()
