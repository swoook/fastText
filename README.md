# fastText for Korean

- Things I've learned while applying fastText to Korean NLP tasks

## Quickstart

1. Build an image from the `Dockerfile` at the `<repository_root_directory>`

    ```Bash
    docker build -t <image_name>:<tag_name>
    ```
    
    - E.g.,
    
    ```Bash
    docker build -t fasttext:dev
    ```
    
2. Run a container from the image `<image_name>:<tag_name>` built in step 1

