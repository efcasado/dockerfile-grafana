Grafana Dockerfile
===================

### Build

```
make
```


### Usage

```
make start
```

```
make stop
```

> Note that if you are running Docker on OS X you will have to set up
> port forwarding from your OS X to the Docker host virtual machine.
> This can easily be done by running the following command:
>
> ```
> VBoxManage controlvm "<docker-host-name>" natpf1 "<pfrule-name>,<protocol>,,<local-port>,,<remote-port>"
> ```
>
> Note that the above command will only work if the Docker host
> virtual machine is running. If the machine is stopped, you can use
> this other command instead:
>
> ```
> VBoxManage modifyvm "<docker-host-name>" --natpf1 "<pfrule-name>,<protocol>,,<local-port>,,<remote-port>"
> ```

### Ports

| Port Number | Protocol | Description                                                  |
|:-----------:|:--------:|--------------------------------------------------------------|
| 3000        | TCP      | Grafana web dashboard                                        |


### Author(s)

- Enrique Fernandez `<efcasado@gmail.com>`


### License

> The MIT License (MIT)
>
> Copyright (c) 2015 Enrique Fernandez
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.