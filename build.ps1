$name = "cdelashmutt/cf-automateur"
$tag = "$(git log -1 --pretty=%H)"
$img = "$($name):$($tag)"
$latest = "$($name):latest"

docker build --platform linux -t "$img" .
docker tag "$img" "$latest"
