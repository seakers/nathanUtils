set IPAddr=128.84.52.97

for /D %%r in (AdvMLProj, EOSpackagingProblem, ExtUtils, GNCproblem, VisCodes, heatSinkToyProblem, packingRegression, partitioning, visToyProbs) do (
cd "%%r"
hg push ssh://seak0@%IPAddr%/CodeRepos/"%%r"
cd ..
)

exit
