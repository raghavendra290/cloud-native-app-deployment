# Stage 1: Build the application
FROM python:3.9-buster as build

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

# Stage 2: Create the final image
FROM scratch

COPY --from=build /app /app

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run"]
