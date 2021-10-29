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
      COMPREPLY=($(compgen -W "${SUBCOMMANDS[*]}" -- ${current}))
      ;;
    2)
      case ${previous} in
        login)
          COMPREPLY=($(compgen -W "--no-localhost --creds" -- ${current}))
          ;;
        logout)
          COMPREPLY=()
          ;;
        create)
          COMPREPLY=($(compgen -W "--type --title --rootDir --parentId" -- ${current}))
          ;;
        clone)
          COMPREPLY=($(compgen -W "--versionNumber --rootDir" -- ${current}))
          ;;
        pull)
          COMPREPLY=($(compgen -W "--versionNumber" -- ${current}))
          ;;
        push)
          COMPREPLY=($(compgen -W "-f --force -w --watch" -- ${current}))
          ;;
        status)
          COMPREPLY=($(compgen -W "--json" -- ${current}))
          ;;
        open)
          COMPREPLY=($(compgen -W "--webapp --creds --addon --deploymentId" -- ${current}))
          ;;
        deployments)
          COMPREPLY=()
          ;;
        deploy)
          COMPREPLY=($(compgen -W "-V --versionNumber -d --description -i --deploymentId" -- ${current}))
          ;;
        undeploy)
          COMPREPLY=($(compgen -W "-a --all" -- ${current}))
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
