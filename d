git rm $(git ls-files --deleted);
git add .;
git commit -m "autodeploy";
git push origin master;
mina deploy;
