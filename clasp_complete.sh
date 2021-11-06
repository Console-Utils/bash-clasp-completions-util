#!/usr/bin/env bash

__clasp_complete()
{
  local SUBCOMMANDS=(login
    logout
    create
    clone
    pull
    push
    status
    open
    deployments
    deploy
    undeploy
    version
    versions
    list)

  local current
  local previous

  current=${COMP_WORDS[COMP_CWORD]}
  previous=${COMP_WORDS[COMP_CWORD-1]}

  case ${COMP_CWORD} in
    1)
      mapfile -t COMPREPLY < <(compgen -W "${SUBCOMMANDS[*]}" -- "${current}")
      ;;
    2)
      case ${previous} in
        login)
          mapfile -t COMPREPLY < <(compgen -W "--no-localhost --creds" -- "${current}")
          ;;
        logout)
          COMPREPLY=()
          ;;
        create)
          mapfile -t COMPREPLY < <(compgen -W "--type --title --rootDir --parentId" -- "${current}")
          ;;
        clone)
          mapfile -t COMPREPLY < <(compgen -W "--versionNumber --rootDir" -- "${current}")
          ;;
        pull)
          mapfile -t COMPREPLY < <(compgen -W "--versionNumber" -- "${current}")
          ;;
        push)
          mapfile -t COMPREPLY < <(compgen -W "-f --force -w --watch" -- "${current}")
          ;;
        status)
          mapfile -t COMPREPLY < <(compgen -W "--json" -- "${current}")
          ;;
        open)
          mapfile -t COMPREPLY < <(compgen -W "--webapp --creds --addon --deploymentId" -- "${current}")
          ;;
        deployments)
          COMPREPLY=()
          ;;
        deploy)
          mapfile -t COMPREPLY < <(compgen -W "-V --versionNumber -d --description -i --deploymentId" -- "${current}")
          ;;
        undeploy)
          mapfile -t COMPREPLY < <(compgen -W "-a --all" -- "${current}")
          ;;
        version)
          COMPREPLY=()
          ;;
        versions)
          COMPREPLY=()
          ;;
        list)
          COMPREPLY=()
          ;;
      esac
      ;;
    *)
      COMPREPLY=()
      ;;
  esac
}

complete -F __clasp_complete clasp
