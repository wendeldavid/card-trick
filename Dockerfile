FROM golang:latest

COPY . .

# Compile o aplicativo
RUN GOOS=linux GOARCH=amd64 go build -o card-trick

RUN chmod +x card-trick

# Defina o comando padrão para executar o aplicativo
CMD ["./card-trick"]
