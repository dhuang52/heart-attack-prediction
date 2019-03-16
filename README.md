# heart-attack-prediction

### Data
The dataset from this project comes from [UCI](https://archive.ics.uci.edu/ml/datasets/Heart+Disease). 
I am particularly using the datast coming from Cleveland.


### Brief Summary of Results
E_in is calculated using corss-entropy error.

Tolerance = 10^-3 (a threshold to terminate once all elements in the gradient are less than it)

eta = 10^-5

| Iterations | E_in   | Classification Error  | Classification Error (out-of-sample) |
|------------|--------|-----------------------|--------------------------------------|
| 10000      | .5847  | .3092                 | .3172                                |
| 100000     | .4937  | .2237                 | .2069                                |
| 1000000    | .4354  | .1513                 | .1310                                |

Studying the results shows that generalization improves as number of iterations increases, as would be expected.
