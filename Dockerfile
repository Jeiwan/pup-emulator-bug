FROM clojure:lein-2.7.1

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget && \
    apt-get install -y build-essential nodejs && \
    rm -r /var/lib/apt/lists/*

RUN groupadd -r dev && useradd -ms /bin/bash --no-log-init -r -g dev dev
WORKDIR /home/dev

COPY package.json /home/dev/
RUN npm install

COPY . /home/dev/
RUN chown -R dev:dev /home/dev

CMD ["make", "run"]