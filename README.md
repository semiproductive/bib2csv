`bib2csv.py` converts a BibTex file into a CSV file, for tidier data analysis! You can run it locally on your computer or inside a Docker container.

## Run bib2csv.py locally

First, clone this repo to your local filesystem:

```
git clone srinify/bib2csv
```

Then, you can run `bib2csv.py` using `python` like so:

```
python bib2csv.py -inFile=path_to_bib_file -outFile=path_to_export_csv
```

Here's a concrete example of running this script where `test.bib` and `bib2csv.py` are in the same directory:

```
python bib2csv.py -inFile=test.bib -outFile=output.csv
```

## Run bib2csv.py inside a Docker container

This part of the tutorial assumes basic familiarity with Docker (and assumes you already have Docker setup locally). 

Create a [DockerHub account](http://dockerhub.com) if you don't have one already and login using `docker login`. Then, download the `semiproductive/bib2csv` image using the following command:

```
docker pull semiproductive/bib2csv
```

After the download has finished, use `docker run` with the following parameters:

- `-v`: to convert a `.bib` file in a local folder, you'll need to mount this local folder and map it to the `/scripts` folder inside the container.
- `-inFile`: required command line parameter for `bib2csv.py` to specify the name of the `.bib` file you want to convert
- `-outFile`: required command line parameter for `bib2.py` to specify the name of the final  `.csv` file

Here's a concrete example of converting `/Users/semiproductive/Documents/test.bib` to `output.csv`:

```python
docker run -v /Users/semiproductive/Documents:/scripts bib2csv -inFile=test.bib -outFile=output.csv
```

Note that there are 2 key components to the code above (and the order matters):

- arguments for Docker: `-v /Users/semiproductive/Documents:/scripts`
- command line arguments that Docker will append to `python bib2csv.py`: `-inFile=test.bib -outFile=output.csv`
