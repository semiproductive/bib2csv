FROM python:3
ADD bib2csv.py ./scripts/
RUN apt-get update -y
RUN apt-get install texlive-generic-recommended -y
RUN pip install biblib==0.1.3
WORKDIR ./scripts/
ENTRYPOINT ["python", "bib2csv.py"]