# Is Crystal slower than Ruby in generating randoms?

While playing around with Crystal I noticed that Ruby is quite faster than Crystal in generating randoms.

I wrote a script that performs 10 million randoms (`hex`, `base64`, `rand` and `random_bytes`) and measures the times.

I did the same in Ruby and found that Ruby is significantly faster than Crystal.

Is this expected? Are Crystal randoms more secure and thus more expensive?

| Generator       | Amount | Time in Crystal | Time in Ruby |
|---------------- |--------|-----------------|--------------|
| `hex`           |    10M |         ~ 47.4s |       ~ 8.8s |
| `base64`        |    10M |         ~ 52.1s |      ~ 10.6s |
| `rand`          |    10M |         ~ 43.8s |       ~ 6.1s |
| `random_bytes`  |    10M |         ~ 47.8s |       ~ 5.8s |

(In Crystal I used `Random`, in Ruby I used `SecureRandom`.)

```shell
$ crystal -v
Crystal 0.25.1 (2018-06-29)

LLVM: 5.0.2
Default target: x86_64-apple-macosx
```

```shell
$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
```

Environment

* macOS High Sierra 10.13.5 (17F77)
* 1.4 GHz Intel Core i7
* 8 GB 1867 MHz LPDDR3
