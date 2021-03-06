p=['/home/bontius/workspace/globOpt/data/scenes/nola'];
A = readSparseMatrix( [ p filesep 'problem/A.csv'], 1);
for i = 1 : 17
    Qs{i} = readSparseMatrix( [ p filesep sprintf('problem/Q%d.csv',i-1)], 1);
end

W = 5; H = 4;
for i = 1 : H
    for j = 1 : W
        imId = (i-1) * W + j;
        subplot(W,H,imId);
        if ( imId == 1 )
            imagesc(full(A));
            title('A');
        elseif ( imId-1 <= numel(Qs) )
            imagesc(full(Qs{imId-1}));
            title(sprintf('Q%d', imId-2));
        end
    end
end

x = readSparseMatrix( [ p filesep sprintf('problem/x.csv',i)], 1);
Qo = readSparseMatrix( [ p filesep sprintf('problem/Qo.csv',i)], 1);
figure();
subplot(121);imagesc(full(Qo~=0)); title('Quadratic objectives');
subplot(122);imagesc(full(A~=0)); title('Linear constraints');
