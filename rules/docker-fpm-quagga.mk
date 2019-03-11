# docker image for fpm-quagga

DOCKER_FPM_QUAGGA = docker-fpm-quagga.gz
$(DOCKER_FPM_QUAGGA)_PATH = $(DOCKERS_PATH)/docker-fpm-quagga
$(DOCKER_FPM_QUAGGA)_DEPENDS += $(QUAGGA) $(SWSS)
$(DOCKER_FPM_QUAGGA)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE)
SONIC_DOCKER_IMAGES += $(DOCKER_FPM_QUAGGA)

$(DOCKER_FPM_QUAGGA)_CONTAINER_NAME = bgp
$(DOCKER_FPM_QUAGGA)_RUN_OPT += --net=host --privileged -t
$(DOCKER_FPM_QUAGGA)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
$(DOCKER_FPM_QUAGGA)_RUN_OPT += -v /var/run/quagga:/var/run/quagga:rw

$(DOCKER_FPM_QUAGGA)_BASE_IMAGE_FILES += vtysh:/usr/bin/vtysh
