FROM node:24-alpine AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base as builder

WORKDIR /app

COPY package.json pnpm-lock.yaml ./ 

RUN pnpm install  

COPY . .

RUN pnpm run build

# === Production Stage ===

FROM base as runner

WORKDIR /app

# Copy *only* the node_modules and build artifacts from previous stages
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/pnpm-lock.yaml ./pnpm-lock.yaml

RUN pnpm install --frozen-lockfile --prod

# Expose the port your app runs on
EXPOSE 8000

# Define the command to start your application
CMD [ "pnpm", "start" ] 






