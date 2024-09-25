#!/bin/bash
#
# Desenvolvido por: DevChimpa
# Data de Criação: 24/09/2024

# Contato:
# https://www.linkedin.com/in/rodrigo-pinheiro-214663206/
# https://github.com/devchimpa/
#
#######################################################################
#
#######################-DESCRIÇÃO DO PROGRAMA-###########################
#
# Este script serve para capturar a resposta do psql para identificar
# se o banco está UP e caso esteja Down, irá alertar no asterisk.
#
# Para que o script funcione...
#
# Esta linha:
#       UserParameter=postgres.up,/etc/zabbix/scripts/banco_monitor.sh
# Deve ser adicionada em:
#       /etc/zabbix/zabbix_agentd.conf
#
######################################################################

# Este comando busca o processo do postgres
COMANDO=$( pgrep postgres 2> /dev/null )
# Caso o comando esteja vazio, ele alarma.
if [ -z "$COMANDO" ]
then
        RESPOSTA=1

else
# Caso o postgres esteja rodando ele normaliza.

RESPOSTA=0
        fi
# Esta resposta deve ser repassada ao zabbix por meio do agent.
echo $RESPOSTA
