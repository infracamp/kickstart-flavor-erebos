# Checklist for gaia container

## Kickstart build (development)

```
cd tests/devmode && ./run-tests.sh rebuild
```

- [ ] Check `http://localhost` is saying "Hello World"

## Container build (production)


```
cd tests/build && ./run-tests.sh rebuild
```

- [ ] Check `http://localhost` is saying "Hello World"