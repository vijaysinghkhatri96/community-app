# Builds production version of Community App inside Docker container,
# and runs it against the specified Topcoder backend (development or
# production) when container is executed.

FROM node:8.11.2
LABEL app="Community App" version="1.0"

WORKDIR /opt/app
COPY . .

################################################################################
# Receiving of build arguments.

ARG AUTH0_CLIENT_ID
ARG CDN_URL
ARG COGNITIVE_NEWSLETTER_SIGNUP_APIKEY
ARG COGNITIVE_NEWSLETTER_SIGNUP_URL
ARG CONTENTFUL_CDN_API_KEY
ARG CONTENTFUL_PREVIEW_API_KEY
ARG CONTENTFUL_SPACE_ID

# Credentials for access to Zurich space in Contentful CMS
ARG CONTENTFUL_ZURICH_SPACE_ID
ARG CONTENTFUL_ZURICH_CDN_API_KEY
ARG CONTENTFUL_ZURICH_PREVIEW_API_KEY

# Credentials for access to TopGear space in Contentful CMS
ARG CONTENTFUL_TOPGEAR_SPACE_ID
ARG CONTENTFUL_TOPGEAR_CDN_API_KEY
ARG CONTENTFUL_TOPGEAR_PREVIEW_API_KEY

# Credentials for access to Comcast space in Contentful CMS
ARG CONTENTFUL_COMCAST_SPACE_ID
ARG CONTENTFUL_COMCAST_CDN_API_KEY
ARG CONTENTFUL_COMCAST_PREVIEW_API_KEY

#Credentials for Contentfu EDU space

ARG CONTENTFUL_MANAGEMENT_TOKEN
ARG CONTENTFUL_EDU_SPACE_ID
ARG CONTENTFUL_EDU_CDN_API_KEY
ARG CONTENTFUL_EDU_PREVIEW_API_KEY

ARG FILESTACK_API_KEY
ARG FILESTACK_SUBMISSION_CONTAINER

# Credentials for Mailchimp service
ARG MAILCHIMP_API_KEY
ARG MAILCHIMP_BASE_URL

ARG NODE_CONFIG_ENV
ARG OPEN_EXCHANGE_RATES_KEY
ARG SEGMENT_IO_API_KEY
ARG SERVER_API_KEY

# TC M2M credentials for Community App server
ARG TC_M2M_CLIENT_ID
ARG TC_M2M_CLIENT_SECRET
ARG TC_M2M_AUDIENCE
ARG TC_M2M_GRANT_TYPE

ARG TC_M2M_AUTH0_PROXY_SERVER_URL
ARG TC_M2M_AUTH0_URL
ARG AUTH_SECRET

ARG COMMUNITY_APP

################################################################################
# Setting of environment variables in the Docker image.

ENV AUTH0_CLIENT_ID=$AUTH0_CLIENT_ID
ENV CDN_URL=$CDN_URL
ENV COGNITIVE_NEWSLETTER_SIGNUP_APIKEY=$COGNITIVE_NEWSLETTER_SIGNUP_APIKEY
ENV COGNITIVE_NEWSLETTER_SIGNUP_URL=$COGNITIVE_NEWSLETTER_SIGNUP_URL
ENV CONTENTFUL_CDN_API_KEY=$CONTENTFUL_CDN_API_KEY
ENV CONTENTFUL_PREVIEW_API_KEY=$CONTENTFUL_PREVIEW_API_KEY
ENV CONTENTFUL_SPACE_ID=$CONTENTFUL_SPACE_ID

# Credentials for access to Zurich space in Contentful CMS
ENV CONTENTFUL_ZURICH_SPACE_ID=$CONTENTFUL_ZURICH_SPACE_ID
ENV CONTENTFUL_ZURICH_CDN_API_KEY=$CONTENTFUL_ZURICH_CDN_API_KEY
ENV CONTENTFUL_ZURICH_PREVIEW_API_KEY=$CONTENTFUL_ZURICH_PREVIEW_API_KEY

# Credentials for access to TopGear space in Contentful CMS
ENV CONTENTFUL_TOPGEAR_SPACE_ID=$CONTENTFUL_TOPGEAR_SPACE_ID
ENV CONTENTFUL_TOPGEAR_CDN_API_KEY=$CONTENTFUL_TOPGEAR_CDN_API_KEY
ENV CONTENTFUL_TOPGEAR_PREVIEW_API_KEY=$CONTENTFUL_TOPGEAR_PREVIEW_API_KEY

# Credentials for access to Comcast space in Contentful CMS
ENV CONTENTFUL_COMCAST_SPACE_ID=$CONTENTFUL_COMCAST_SPACE_ID
ENV CONTENTFUL_COMCAST_CDN_API_KEY=$CONTENTFUL_COMCAST_CDN_API_KEY
ENV CONTENTFUL_COMCAST_PREVIEW_API_KEY=$CONTENTFUL_COMCAST_PREVIEW_API_KEY

ENV FILESTACK_API_KEY=$FILESTACK_API_KEY
ENV FILESTACK_SUBMISSION_CONTAINER=$FILESTACK_SUBMISSION_CONTAINER

# Credentials for Mailchimp service
ENV MAILCHIMP_API_KEY=$MAILCHIMP_API_KEY
ENV MAILCHIMP_BASE_URL=$MAILCHIMP_BASE_URL

ENV NODE_CONFIG_ENV=$NODE_CONFIG_ENV
ENV OPEN_EXCHANGE_RATES_KEY=$OPEN_EXCHANGE_RATES_KEY
ENV SEGMENT_IO_API_KEY=$SEGMENT_IO_API_KEY
ENV SERVER_API_KEY=$SERVER_API_KEY

# TC M2M credentials for Community App server
ENV TC_M2M_CLIENT_ID=$TC_M2M_CLIENT_ID
ENV TC_M2M_CLIENT_SECRET=$TC_M2M_CLIENT_SECRET
ENV TC_M2M_AUDIENCE=$TC_M2M_AUDIENCE
ENV TC_M2M_GRANT_TYPE=$TC_M2M_GRANT_TYPE

ENV TC_M2M_AUTH0_PROXY_SERVER_URL=$TC_M2M_AUTH0_PROXY_SERVER_URL
ENV TC_M2M_AUTH0_URL=$TC_M2M_AUTH0_URL
ENV AUTH_SECRET=$AUTH_SECRET

ENV CONTENTFUL_MANAGEMENT_TOKEN=$CONTENTFUL_MANAGEMENT_TOKEN
ENV CONTENTFUL_EDU_SPACE_ID=$CONTENTFUL_EDU_SPACE_ID
ENV CONTENTFUL_EDU_CDN_API_KEY=$CONTENTFUL_EDU_CDN_API_KEY
ENV CONTENTFUL_EDU_PREVIEW_API_KEY=$CONTENTFUL_EDU_PREVIEW_API_KEY
ENV COMMUNITY_APP=$COMMUNITY_APP

################################################################################
# Testing and build of the application inside the container.

RUN npm config set unsafe-perm true
RUN npm install
RUN npm test
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]

