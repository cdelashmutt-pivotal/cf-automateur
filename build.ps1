$name = "cdelashmutt/cf-automatuer"
$tag = "$(git log -1 --pretty=%H)"
$img = "$($name):$($tag)"
$latest = "$($name):latest"

docker build -t "$img" .
docker tag "$img" "$latest"
