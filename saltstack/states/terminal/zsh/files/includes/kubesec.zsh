kubesec()
{
    local FILE="${1:-}";
    [[ ! -f "${FILE}" ]] && {
        echo "kubesec: ${FILE}: No such file" >&2;
        return 1
    };
    curl --silent \
      --compressed \
      --connect-timeout 5 \
      -F file=@"${FILE}" \
      https://kubesec.io/
}
