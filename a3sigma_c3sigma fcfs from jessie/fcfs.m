function [fcf] = fcfs(g_potential,e_potential,fHO, J_ang, res, g_states, e_states)

e_dirname = sprintf('output1-res80/NaCs_%s_%dkHz_J%d/', e_potential, round(fHO*1e-3), J_ang, res);
g_dirname = sprintf('output1-res80/NaCs_%s_%dkHz_J%d/', g_potential, round(fHO*1e-3), J_ang, res);
J = load([e_dirname, 'J.csv']);
g_psi = load([g_dirname, 'evec.csv']);
e_psi = load([e_dirname, 'evec.csv']);

fcf = zeros(length(g_states),length(e_states));

for i = 1:length(g_states)
    NN_g = sqrt(dot(g_psi(:,g_states(i)),g_psi(:,g_states(i)).*J'));
    for j = 1:length(e_states)
        NN_e = sqrt(dot(e_psi(:,e_states(j)),e_psi(:,e_states(j)).*J'));
        fcf(i,j) = dot(g_psi(:,g_states(i))/NN_g,conj(e_psi(:,e_states(j))).*J'/NN_e);
    end
end

end