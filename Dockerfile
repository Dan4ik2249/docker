FROM alpine as build

RUN apk update && apk add musl-dev && apk add gcc && apk add git && apk add ncurses-dev && apk add ncurses-static
RUN git clone https://21k0770:Danek213@git.bk252.ru/21k0770/OS_Part2
COPY . /tmp
RUN gcc OS_Part2/snake/snake.c -o /star.exe -lncurses -static

FROM alpine
RUN apk update && apk add ncurses-libs
COPY --from=build /star.exe /

CMD ["/bin/sh"]
