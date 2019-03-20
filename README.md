# My personal bash configuration

[see](https://medium.com/@waxzce/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff)

Add the following loader to ~/.bashrc
```bash
for file in ~/.bashrc.d/*.bashrc;
do
 source "$file"
done
```

