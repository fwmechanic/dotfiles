# Work-specific environment (managed by chezmoi)
# Only deployed on work_machine = true

export ITURI_BE_ARGV='-l -c'
export ITURI_SUBDOMAIN=staging
export APP_NAME=hoc
export ITURI_CONFIG_DNM=/home/kg/devicepros/repos/ituri-be-config/
export ITURI_STATE_DNM=/home/kg/devicepros/repos/ituri-be-state

# Source work secrets (API keys, etc.)
[ -f ~/.work_secrets.sh ] && . ~/.work_secrets.sh
