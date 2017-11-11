# Catflv

Concatenate .flv videos. Tested on ffmpeg version `3.2`.

## How to use it?

```
$ catflv *.flv
```

Now you have a `final.flv` in that folder.

## How to install it?

Just copy `catflv.sh` in your $PATH and make sure it is executable.

Example:

```
$ sudo chmod +x catflv.sh
$ sudo cp catflv.sh /usr/local/bin/catflv
```

In the above example, you must have `/usr/local/bin` in your $PATH. To check that run:

```
$ echo $PATH
```

My Result:

```
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```

Each path is seperated by `:`.
