FROM ruby:2.6.2-stretch

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Install gems
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

RUN bundle install 

# Set Rails environment to production
ENV RAILS_ENV production



# Start the application server
ENTRYPOINT ./entrypoint.sh