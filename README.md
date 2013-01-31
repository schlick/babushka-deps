## Installation

Standard Babushka install:

```zsh
sh -c "`curl https://babushka.me/up`"
```

Add this repo as a source (substitute repo name as appropriate):

```zsh
babushka sources -a schlick git@github.com:schlick/babushka-deps.git
```

## Setup

To develop babushka deps locally, symlink this repo into the babushka sources:

```zsh
ln -s $PWD ~/.babushka/sources/dev
```

## Usage

To view the available deps:

```zsh
babushka list
```

To run a dep:

```zsh
babushka 'schlick:name of dep'
```

If there are no spaces in the name of the dep, this can be simplified to:

```zsh
babushka schlick:my_dep
```

To update a source:

```zsh
babushka sources -u
```