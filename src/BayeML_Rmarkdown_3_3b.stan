//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//
// AR(1) model from https://mc-stan.org/docs/2_21/stan-users-guide/autoregressive-section.html

data {
  int<lower=0> T;
  vector[T] y;
}
parameters {
  real mu;
  real phi;
  real<lower=0> sigma;
}
model {
    mu ~ normal (0,1);
    phi ~ normal(0,1) T[-1,1];
    sigma ~ normal (0,1);
  for (t in 2:T)
    y[t] ~ normal(mu + phi*y[t-1] - phi*mu, sigma);
}

generated quantities {
} // The posterior predictive distribution"
