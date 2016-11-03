# Submission Creator

How it works:

| Submission | Threshold on what? | Model using what? |
| :-: | --- | --- |
| 1 | All out of fold CV data | Average of CV predictions (80% x5) |
| 2 | Average of each out of fold CV | Average of CV predictions (80% x5) |
| 3 | Average of 1 & 2 | Average of CV testing predictions (80% x5) |
| 4 | All out of fold CV data | All training data (100%) |
| 5 | Average of each out of fold CV | All training data (100%) |
| 6 | Average of 1 & 2 | All training data (100%) |
| 7 | Positive count found in 1 | All training data (100%) |
| 8 | Positive count found in 2 | All training data (100%) |
| 9 | Positive count found in 3 | All training data (100%) |
| 10 | Sum of positives found from CV | All training data (100%) |
