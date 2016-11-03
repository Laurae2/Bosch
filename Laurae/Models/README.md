# Submission Creator

How it works:

| Submission | Threshold on what? | Model using what? |
| :-: | --- | --- |
| 1 | All out of fold CV data (100%) | Average of CV predictions (80% x5) |
| 2 | Average of each out of fold CV (80% x5) | Average of CV predictions (80% x5) |
| 3 | Average of 1 & 2 (~90%) | Average of CV testing predictions (80% x5) |
| 4 | All out of fold CV data (100%) | All training data (100%) |
| 5 | Average of each out of fold CV (80% x5) | All training data (100%) |
| 6 | Average of 1 & 2 (~90%) | All training data (100%) |
| 7 | Positive count found in 1 (100%) | All training data (100%) |
| 8 | Positive count found in 2 (80% x5) | All training data (100%) |
| 9 | Positive count found in 3 (~90%) | All training data (100%) |
| 10 | Sum of positives found from CV (80% x5 separate) | All training data (100%) |
