# # # # #
# DOCKER
alias dl="docker logs"
alias dc="docker compose"
alias dcu="docker compose up -d --remove-orphans"
alias ddcu="docker compose up -d --force-recreate --remove-orphans"
alias ds="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

## Docker Nuke - wipes out all containers, images, volumes, and networks
function dnuke() {
    read -p "Are you sure? This will stop and remove ALL containers, images, unused volumes, and networks. (Y/n): " confirmation
    confirmation=${confirmation:-Y}

    if [[ "$confirmation" =~ ^[Yy]$ ]]; then
        echo "Stopping all running containers..."
        docker stop $(docker ps -q)

        echo "Removing all containers..."
        docker rm $(docker ps -aq)

        echo "Removing all images..."
        docker rmi $(docker images -q) --force

        echo "Removing unused volumes..."
        docker volume prune -f

        echo "Removing unused networks..."
        docker network prune -f

        echo "Docker cleanup complete!"
    else
        echo "Docker cleanup aborted."
    fi
}

# Docker + fzf
# source: https://github.com/junegunn/fzf/wiki/Examples#docker

# Select a docker container to start and attach to
function da() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# restart a container
function dre() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')
    [ -n "$cid" ] && docker restart "$cid"
}

# rm a container
function drm() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid" && docker rm "$cid"
}

# rm an image
function drmi() {
    docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}
