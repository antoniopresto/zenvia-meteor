request = Npm.require 'request'
Future = Npm.require 'fibers/future'
Fiber = Npm.require 'fibers'

#string to base64
toBase64 = (s) -> new Buffer(s).toString('base64')

@Zenvia = {}
Zenvia.sendUrl = 'https://api-rest.zenvia360.com.br/services/send-sms'
Zenvia.password or= process.env.ZENVIA_PASSWORD
Zenvia.username or= process.env.ZENVIA_USERNAME

Zenvia.send = (args, cb) ->
    conta = Zenvia.username
    senha = Zenvia.password
    key = toBase64 "#{conta}:#{senha}"
    body = JSON.stringify(
        "sendSmsRequest":
            "from": args.from
            "to": args.to
            "msg": args.msg
            "id": args.id or "#{Date.now()}-#{args.to}")

    requestOptions =
        method: 'POST'
        url: Zenvia.sendUrl
        headers:
            'Content-Type': 'application/json'
            'Authorization': "Basic #{key}"
            'Accept': 'application/json'
        body: body

    #sending in a fiber
    future = new Future
    Fiber ->
        request requestOptions, (err, res, body) ->
            #console.log arguments
            _re =
                err: err
                body: JSON.parse body

            future.return _re
            cb?(_re)
    .run()
    if typeof cb isnt 'function' then return future.wait()
