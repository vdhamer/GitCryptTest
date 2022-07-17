#GitCryptTest
##Test of git-crypt with XCode

The software has an encrypted `Secret.txt` file and an unencrypted `Unsecret.txt` file.
`Secret.txt` merely contains `Hello, secret World!` and `Unsecret.txt` contains `Hello, World!`. So don't lose any sleep over trying to get inside.

The `Secret.txt` file is configured to be encrypted and decrypted by [git-crypt](https://github.com/AGWA/git-crypt).

If you #don't# have the key (omitted via `.gitignore`), your copy of `Secret.txt` is encrypted (git-crypt uses gpg internally) and the file is pretty useless.
If you #do# have the (symmetrical) key, you can read 'Secret.txt'.
Without the key, you can replace 'Secret.txt' by anything you like, but the point is that you don't have access to its data (real example: an API key). The crypography protects the data within a public repo, with github handling the authetication.

The point here that the repo will build and create a demo iOS SwiftUI app, even without the key.
And then the app gives you privileged access (using the content of `Secret.txt`) ##or## provide a default or template (e.g. using something hardcoded or, more conveniently, within `Unsecret.txt`).

Why not just add `Secret.txt` to the `.gitignore` list, and thus providing the repo without the "sensitive" data we are trying to protect?
    * with the key, you have a fully functional app. Albeit that distributing the app, would give you a new attack option: after all the key is somewhere in the binary.
    * without the key, you don't have access. So either you get your own key (e.g. API-key), or only have a demo version of the app.
    * arguably the secret is now archived, but I have to obviously try not to lose the key
    * I can provide the key to other collaborators (`git-encrypt unlock pathToKey`)
    * anyone who clones or forks the repo can create their alternative secret (API key) on their branch 

How does this compare to github's Secret (ghS) storage?
    * github Secrets are encrypted outside the repository files, which is arguably less accident prone
    * you have to use Actions to fetch them (with decrypting for contributors)
    * so this will require some tricks to get the secret back into your application in your local repo
    
Footnote: on Apple Silicon Macs, you will have to adapt the path names to the .git/config file (I think the location of HomeBrew links changed):

`[filter "git-crypt"]
    smudge = \"/opt/homebrew/bin/git-crypt\" smudge
    clean = \"/opt/homebrew/bin/git-crypt\" clean
    required = true
[diff "git-crypt"]
    textconv = \"/opt/homebrew/bin/git-crypt\" diff`
