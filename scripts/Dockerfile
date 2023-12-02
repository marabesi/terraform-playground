# https://stackoverflow.com/a/73400257/2258921
FROM --platform=linux/amd64 node:20-bullseye-slim
WORKDIR /terraform-playground
RUN npm install -g http-server
RUN echo "<p>hello</p>" >> index.html
EXPOSE 8080
CMD ["http-server", "/terraform-playground", "-p", "8080", "-a", "0.0.0.0"]