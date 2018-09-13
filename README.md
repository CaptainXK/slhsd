# libevent simple http server deploy in docker

preparation:
Make sure that you have install libevent library and docker on your OS

If you want to deploy source file then compile and working in docker, use commands as following:

1.
#Pull a gcc image in docker

2. 
sudo docker image build -f Dockerfile-gcc -t libev_server_simple:v1 .
#"libev_server_simple" and "v1" can be replaced by your own image name and version tag

3. 
sudo docker run libev_server_simple:v1

If you want to deploy executable file in docker, sue commands as following:

1.
#pull a ubuntu imgae in docker

2.
sudo docker image build -f Dockerfile-ubuntu -t libev_server_simple:v2 .

3.
sudo docker run -v /usr/lib/x86_64-linux-gnu:/usr/src/libev_server_test/lib libev_server:v2
# "-v /usr/lib/x86_64-linux-gnu:/usr/src/libev_server_test/lib" means mapping the host's dir "/usr/lib/x86_64-linux-gnu" , where libevent-2.1.so.6 is in, to the container's dir "/usr/src/libev_server_test/lib". Because LD_LIBRARY_PATH environment var in container is set to "/usr/src/libev_server_test/lib" (see in Dockerfile-ubuntu, line 13), mapping it to the host's dir where needed .so file is in , can ensure test.app find the correct .so file, otherwise it will be error about linking .so file. 