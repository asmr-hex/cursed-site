FROM python:3.7
RUN mkdir /app 
COPY main.py /app/main.py
COPY pyproject.toml /app 
WORKDIR /app
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev
ENTRYPOINT ["poetry", "run", "uvicorn", "main:app"]
CMD ["--port", "8081"]
