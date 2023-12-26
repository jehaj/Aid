Jeg tilføjede

```
send.jehaj.dk {
        reverse_proxy 127.0.0.1:1234
}
```

i `Caddyfile`. Derudover var der et problem med at den ikke måtte skrive til `uploads` mappen. Det blev løst ved `sudo chmod 777 uploads`, hvilket nok ikke er den mest optimale løsning.
