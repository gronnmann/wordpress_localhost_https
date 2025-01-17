# wordpress_localhost_https
docker-compose setup to run wordpress at localhost using HTTPS with a self-signed certificate

Based on [this](https://www.timsanteford.com/posts/docker-wordpress-environment-with-https-in-5-steps/) tutorial with some customizations.

## Usage
1. Make sure you have Docker and docker-compose installed
2. Run the environment
```bash
docker-compose up
```
3. Happy coding

This will make the HTTPS available at `https://localhost:3001`.