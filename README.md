# fastText for Korean

- Things I've learned while applying fastText to Korean NLP tasks

## Quickstart

1. Build an image from the `Dockerfile` at the `<repository_root_directory>`

    ```Bash
    docker build -t <image_name>:<tag_name> .
    ```
    
    - E.g.,
    
    ```Bash
    docker build -t fasttext:dev .
    ```
    
2. Run a container from the image `<image_name>:<tag_name>` built in step 1

3. Download [pretrained fastText files](https://ratsgo.github.io/embedding/downloaddata.html)

4. Open [`./examples/baseline/notebook.ipynb`](./examples/baseline/notebook.ipynb) and set `config` appropriately
    - E.g., `config['pretrained_bin']`is a path of pretrained fastText `.bin` file

5. Run the `notebook.ipynb` and See explanation