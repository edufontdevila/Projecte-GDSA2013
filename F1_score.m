function F = F1_score(P, R)
    if (P+R) == 0
        F = 0;
    else
        F = 2*(P*R/(P+R));
    end
end