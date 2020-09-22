# alpine-vnc
Run xfce on alpine using xvfb, open VNC server


```
# build container (set PW!, default PW: a)
docker build -t IMAGENAME:TAG --build-arg PW=PW_HERE .

# run it
docker container run --rm -d -p 5900:5900 --cap-add SYS_ADMIN -v /storage:/storage_encrypted IMAGENAME:TAG
```