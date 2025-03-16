# Docker Images

This repository contains various Docker images. Below is a table listing the images, their descriptions, and tags.

The images can be viewed on [Dockerhub](https://hub.docker.com/repository/docker/csprock/dockerfiles/general). 

Note, these Dockerfiles are designed to be general-purpose and contain as many things that a developer or analyst might need for given type of task. Therefore, these image are BIG (over 1GB), so if space is a consideration, these images might not be for you. 

| Image Name | Description | Tags |
|------------|-------------|------|
| Python Base     | A base image for Python projects that contains a non-root user called "user" along with Python development packages that interface with VS Code | python-base-latest |
| Python Data Science     | An image that contains common libraries used in data science and analysis projects. Builds on Python Base. | python-data-science-latest |
| Python Optimization     | An image that contains optimization binaries and libraries for linear and non-linear solvers. Builds on Python Data Science | python-opt-latest |
| Python Time Series     | An image that contains libraries and packages for time series analysis. Builds on Python Data Science. | python-ts-latest |
| R Tidyverse     | An image based on the Rocker tidyverse images with additional packages installed for statistics and analysis. | r-tidyverse-latest |
| R Vanilla     | An image based on the Rocker images with additional packages installed for statistics and analysis along with drivers for databases and PDF documentation building | r-vanilla-latest |


## Usage

To pull an image, use the following command:

```sh
docker pull csprock/dockerfiles:<tag>
```

Replace `<tag>` with the appropriate values from the table above.

## Contributing

Feel free to contribute by submitting a pull request. Please ensure all new images are added to the table above with a proper description and tags.

## License

This project is licensed under the MIT License.