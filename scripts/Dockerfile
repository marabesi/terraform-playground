FROM node:16.10.0
WORKDIR /terraform-playground
RUN npm install -g http-server
RUN echo "<p>hello</p>" >> index.html
CMD ["http-server", "/terraform-playground", "-p", "8080"]