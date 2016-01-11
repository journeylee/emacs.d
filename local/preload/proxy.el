(setq tls-program
 '("/usr/local/bin/proxychains4 -q openssl s_client -connect %h:%p -no_ssl2 -ign_eof"))
