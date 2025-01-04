
{ inputs, lib, config, pkgs, ... }: {

    services.zapret.enable = true;
    services.zapret.config = ''
    FWTYPE=nftables
    SET_MAXELEM=522288
    IPSET_OPT="hashsize 262144 maxelem $SET_MAXELEM"
    IP2NET_OPT4="--prefix-length=22-30 --v4-threshold=3/4"
    IP2NET_OPT6="--prefix-length=56-64 --v6-threshold=5"
    AUTOHOSTLIST_RETRANS_THRESHOLD=3
    AUTOHOSTLIST_FAIL_THRESHOLD=3
    AUTOHOSTLIST_FAIL_TIME=60
    AUTOHOSTLIST_DEBUGLOG=0
    MDIG_THREADS=30

    GZIP_LISTS=1

    MODE=nfqws
    MODE_HTTP=1
    MODE_HTTP_KEEPALIVE=0
    MODE_HTTPS=1
    MODE_QUIC=1
    MODE_FILTER=none

    DESYNC_MARK=0x40000000
    DESYNC_MARK_POSTNAT=0x20000000
    NFQWS_OPT_DESYNC="--dpi-desync=disorder2"
    TPWS_OPT="--hostspell=HOST --split-http-req=method --split-pos=3 --oob"

    FLOWOFFLOAD=donttouch

    INIT_APPLY_FW=1
    DISABLE_IPV6=0

    '';

  }
