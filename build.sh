name="cdelashmutt/cf-automateur"
tag="$(git log -1 --pretty=%H)"
img="$name:$tag"
latest="$name:latest"

docker build -t "$img" . --squash
docker tag "$img" "$latest"