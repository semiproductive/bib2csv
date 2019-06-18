`bib2csv.py` converts a BibTex file into a CSV file. You can run it locally on your computer or inside a Docker container. For concrete examples, we'll convert [this dataset](https://glottolog.org/meta/downloads) on bibliographic references from minority languages from `.bib` to `.csv`

## Run bib2csv locally

First, clone this repo to your local filesystem:

```
git clone srinify/bib2csv
```

Then, you can run `bib2csv.py` using `python` like so:

```
python bib2csv.py -inFile=path_to_bib_file -outFile=path_to_export_csv
```

Here's a concrete example where `glottolog_source.bib` and is in the same folder as `bib2csv.py`:

```
python bib2csv.py -inFile=glottolog_source.bib -outFile=output.csv
```

## Run bib2csv inside Docker


This part of the tutorial assumes basic familiarity with Docker (and assumes you already have Docker setup locally). 

Create a DockerHub account if you don't have one already and then download the `semiproductive/bib2csv` image using the following command:

```
docker pull semiproductive/bib2csv
```

After the download has finished, use `docker run` with the following parameters:

- `-v`: to convert a `.bib` file in a local folder, you'll need to mount this local folder and map it to the `/scripts` folder inside the container.
- `-inFile`: required command line parameter for `bib2csv.py` to specify the name of the `.bib` file you want to convert
- `-outFile`: required command line parameter for `bib2.py` to specify the name of the final  `.csv` file

Here's a concrete example of converting [this dataset](https://glottolog.org/meta/downloads) on bibliographic references from minority languages from `.bib` to `.csv`:

```python
docker run -v /Users/semiproductive/Documents:/scripts bib2csv -inFile=glottolog_source.bib -outFile=output.csv
```
