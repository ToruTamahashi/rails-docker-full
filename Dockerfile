FROM ruby:2.7.6

# Node.jsのバージョンを14以上に指定してインストール
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# 必要なパッケージをインストールし、Yarnを公式リポジトリからインストール
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  curl \
  default-libmysqlclient-dev \
  default-mysql-client && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn && \
  rm -rf /var/lib/apt/lists/*

# アプリケーションディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# RubyGemsとBundlerを更新
RUN gem update --system 3.4.21
RUN gem install bundler:2.4.22

# 依存関係をインストール
RUN bundle install

# アプリケーションコードをコピー
COPY . /myapp

# FROM ruby:2.7.6

# # 必要なパッケージをインストールし、Yarnを公式リポジトリからインストール
# RUN apt-get update && apt-get install -y \
#   build-essential \
#   libpq-dev \
#   nodejs \
#   curl \
#   default-libmysqlclient-dev \
#   default-mysql-client && \
#   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#   apt-get update && apt-get install -y yarn && \
#   rm -rf /var/lib/apt/lists/*

# # アプリケーションディレクトリを作成
# RUN mkdir /myapp
# WORKDIR /myapp

# # GemfileとGemfile.lockをコピー
# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock

# # RubyGemsとBundlerを更新
# RUN gem update --system 3.4.21
# RUN gem install bundler:2.4.22

# # 依存関係をインストール
# RUN bundle install

# # アプリケーションコードをコピー
# COPY . /myapp