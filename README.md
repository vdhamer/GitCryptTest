#GitCryptTest
##Test of git-crypt with XCode

The software has an encrypted Secret.txt file and an unencrypted Unsecret.txt file.
Secret.txt contains `Hello, secret World!` and Unsecret.txt contains `Hello, World!`. So not too thrilling information.
The Secret.* file is configured to be encrypted and decrypted by [git-crypt](https://github.com/AGWA/git-crypt).

If you don't have the key (not on hithub), your copy of Secret.txt is encrypted (GPG) and pretty useless.
If you do have the (in my case symmetrical) key, you can read Secret.txt (which is boring actually).
Without the key, you can replace Secret.txt, but the point is that you don't have access to its data (e.g. an API key).

The idea is that the repo will build, even if you don't have the key.
And then software can give you privileged access (using the content of Secret.txt) or provide a default of template (Unsecret.txt).

How is this better than just placing Secret.txt in the .gitignore list, and thus providing the repo without the "sensitive" data?
    * with the key, you have a fully functional app. Albeit that distributing the app, would give you a new attack option: after all the key is somewhere in the binary.
    * without the key, you don't have access. So either you get your own key (e.g. API-key), or only have a demo version of the app.
