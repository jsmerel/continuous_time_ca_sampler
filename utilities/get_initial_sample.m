function SAM = get_initial_sample(Y,params)

% obtain initial sample by performing sparse noise-constrained deconvolution
% Author: Eftychios A. Pnevmatikakis

    
if isfield(params,'p'); options.p = params.p; else options.p = 1; end
[c,b,c1,g,sn,sp] = constrained_foopsi(Y,params.b,params.c1,params.g,params.sn,options);

Dt = 1;
T = length(Y);
if ~exist('sp','var')
    G = make_G_matrix(T,params.g);
    sp = G*c;
end
s_in = sp>0.15*max(sp);
spiketimes_ = Dt*(find(s_in) + rand(size(find(s_in))) - 0.5);
spiketimes_(spiketimes_ >= T*Dt) = 2*T*Dt - spiketimes_(spiketimes_ >= T*Dt);
SAM.lam_ = length(spiketimes_)/(T*Dt);
SAM.spiketimes_ = spiketimes_;

SAM.A_   = max(median(sp(s_in)),max(sp(s_in))/4);  % initial amplitude value
if length(g) == 2
    SAM.A_   = SAM.A_/sqrt(g(1)^2+4*g(2));
end
SAM.b_   = max(b,range(Y)/25);                     % initial baseline value
SAM.C_in = max(c1,(Y(1)-b)/10);                    % initial value sample
SAM.sg = sn;                                       % initial noise value
SAM.g = g;                                         % initial time constant value