# docker-megacmd
Container for the MEGA.nz CLI utility. The main thing I use it for is to download files from mega.nz (that exceed the arbitrary 2GB limit) without needing to create an account.

## Usage

Very simple container, to build it yourself just run:
```
docker build -t megacmd .
```

Or you can use the one on my Docker Hub: bandi13/docker-megacmd.

Then you can run it like so:
```
docker run --rm -it -v $(pwd):/ws -w /ws bandi13/docker-megacmd mega-get <URL> <destFileName>
```

Files will be owned by `root`, but you're an adult, you know how to `sudo chown`.

## Support

If you find this useful, consider buying me a coffee/beer: [![Buy Me A Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoff.ee/bandi13). Thanks!
