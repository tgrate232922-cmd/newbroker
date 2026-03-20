FROM mcr.microsoft.com/devcontainers/base:bullseye

# Install PHP 8.1 and extensions
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    gnupg2 \
    curl \
    wget \
    unzip \
    git \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update && apt-get install -y \
    php8.1 \
    php8.1-cli \
    php8.1-common \
    php8.1-mysql \
    php8.1-curl \
    php8.1-zip \
    php8.1-gd \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-bcmath \
    php8.1-gmp \
    php8.1-intl \
    php8.1-readline \
    php8.1-tokenizer \
    php8.1-fileinfo \
    php8.1-dom \
    mysql-server \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js LTS via NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
