Make sure to have docker installed 
CD into AGE_SERVER, then run
$ docker build -t my-nodejs-app .
then run the command below to run the server
$ docker run -it -p 6900:6900 --rm --name my-running-app my-nodejs-app
