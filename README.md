continuous_time_ca_sampler
==========================

The code takes as an input a time series vector of calcium observations
and produces samples from the posterior distribution of the underlying
spike in continuous time. The code also samples the model parameters
(baseline, spike amplitude, initial calcium concentration, firing rate,
noise variance) and also iteratively re-estimates the discrete time
constant of the model. More info can be found at

Pnevmatikakis, E., Merel, J., Pakman, A. &amp; Paninski, L. (2014).
Bayesian spike inference from calcium imaging data. Asilomar Conf. on
Signals, Systems, and Computers. http://arxiv.org/abs/1311.6864

License
=======

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
