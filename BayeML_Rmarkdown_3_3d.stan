
data {
  int<lower=0> T;
  int<lower=0> y[T];
}
parameters {
  real x[T];
  real mu;
  real phi;
  real<lower=0> sigma;
}

model{
  sigma ~ normal(0, 0.1);
  
  for (i in 2:T)
    x[i] ~ normal(mu + phi*x[i-1] - mu*phi, sigma);
  for (i in 2:T)
    y[i] ~ poisson(exp(x[i]));
}


