# if not root
if [ "$(id -u)" != "0" ]; then

  # set umask
  umask 0077

  # enable commands installed in /opt/cs50/bin
  case ":$PATH:" in
      *:/opt/cs50/bin:*)
          : ;;
      *)
          export PATH=/opt/cs50/bin:$PATH ;;
  esac

  # enable commands installed in $HOME/.local/bin
  case ":$PATH:" in
      *:$HOME/.local/bin:*)
          : ;;
      *)
          export PATH=$PATH:$HOME/.local/bin ;;
  esac

  # configure clang
  export CC=clang
  export CFLAGS="-fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow"
  export LDLIBS="-lcrypt -lcs50 -lm"

  # protect user
  alias cp="cp -i"
  alias mv="mv -i"
  alias rm="rm -i"

  # suppress gdb's startup output
  alias gdb="gdb -q"

  # unconditionally make all targets
  alias make="make -B"

  alias apachectl='echo "Please use apache50 instead!"'
  alias mysql-ctl='echo "Please use mysql50 instead!"'
  alias phpmyadmin-ctl='echo "Please use mysql50 instead!"'

  # shift out and in of block character palettes
  alias break50="printf '\x0e'"
  alias fix50="printf '\x0f'"

fi

# set maximum file size to 512MB
ulimit -f 524288

# disable auto-logout
export TMOUT=0

# java
export CLASSPATH=.:/usr/share/java/cs50.jar

# python3
alias pip=pip3
alias pylint=pylint3
alias python=python3
export PYTHONDONTWRITEBYTECODE=1
export PYTHONPATH="/home/ubuntu/.local/lib/python3.4/site-packages:/usr/lib/python3/dist-packages:/usr/local/lib/python3.4/dist-packages"

# sqlite3
alias sqlite3="sqlite3 -column -header"

# sudo
# trailing space enables elevated command to be an alias
alias sudo="sudo "

# flask
export FLASK_APP=application.py
export FLASK_DEBUG=1
flask()
{
    if [ "$1" = "run" ]; then
        shift
        command flask run --host=0.0.0.0 --port=8080 --with-threads "$@"
    else
        command flask "$@"
    fi
}

# valgrind defaults
export VALGRIND_OPTS="--memcheck:leak-check=full --memcheck:track-origins=yes"

# set editor
export EDITOR=nano

# set locale
export LANG=C

# Node.js
export NODE_ENV=dev

# web application environment
export APPLICATION_ENV=dev

# short-circuit RVM's cd script
# https://news.ycombinator.com/item?id=1637354
export rvm_project_rvmrc=0
