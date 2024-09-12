FROM registry.access.redhat.com/ubi8/ubi:8.0
USER 1001
ENV VAR=UAT
ONBUILD ENV VAR=PRD
CMD bash -c "while true; do echo test; echo $VAR; sleep 5; done"
