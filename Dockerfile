# =============================================================================
# Docker container for running Scrapy based on official Scrapy image.
# =============================================================================

FROM scrapinghub/scrapinghub-stack-scrapy:1.6-py3-20190315
MAINTAINER Tor Stava <torstava@gmail.com>

RUN pip install \
    awscli \
    boto3 \
    ipython \
    mysqlclient \
    selenium

RUN pip install git+https://github.com/whg517/scrapy-selenium.git

# Create a non-root user to run the scraper
RUN groupadd -g 1001 scrapy && \
    useradd -m -s /bin/bash -u 1001 -g 1001 scrapy

USER scrapy

WORKDIR /scraper

VOLUME [ "/scraper" ]

CMD [ "/bin/bash" ]
