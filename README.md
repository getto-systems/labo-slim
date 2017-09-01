# labo-slim

labo image without ssh

# run

```bash
#!/bin/bash

work_in_main(){
  local user
  local root
  local home
  local timezone

  user=${YOUR_USER_NAME}
  root=${YOUR_WORKING_ROOT_DIR}
  home=/home/$user
  timezone=Asia/Tokyo
  image=getto/labo-slim:0.0.5

  docker run -it --rm \
    --detach-keys ctrl-@,ctrl-@ \
    -e DOCKER_WRAPPER_VOLUMES=$root/apps:/apps \
    -e LABO_USER=$user \
    -e LABO_TIMEZONE=$timezone \
    -v $root/apps:/apps \
    -v $root/dotfiles:$home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w $home \
    $image
}

work_in_main
```
