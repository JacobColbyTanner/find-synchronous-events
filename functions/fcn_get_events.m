function output = fcn_get_events(ts,numrand,motion,motion_thr,dilateframes,q)
% clear all
% close all
% clc
% 
% load ts
motion_thr = 0.15;  
motion = motion(:,1);
numrand = 100;
q = 0.05;
dilateframes = 2;

[t,n] = size(ts);
ets = fcn_edgets(ts);
r = sum(ets.^2,2).^0.5;

idx = find(motion >= motion_thr);
relmot = ones(size(ts,1),1);
for i = 1:length(idx)
    jdx = (idx(i) - dilateframes):(idx(i) + dilateframes);
    jdx(jdx < 1) = [];
    jdx(jdx > t) = [];
    relmot(jdx) = 0;
end

rrand = zeros(t,numrand);
for irand = 1:numrand
    [~,idxrand] = sort(rand(t,n));
    idxrand = bsxfun(@plus,idxrand,(0:(n - 1))*t);
    tsr = ts(idxrand);
    etsr = fcn_edgets(tsr);
    rrand(:,irand) = sum(etsr.^2,2).^0.5;
end
%%
z = zscore(ts);
p = zeros(length(r),2);
rrand_vec = rrand(:);
for t = 1:length(r)
    p(t,1) = mean(rrand_vec >= r(t));
    p(t,2) = mean(rrand_vec <= r(t));
end
padj = fcn_linear_step_up(p(:),q);
sig = p < padj;
mask = bsxfun(@times,sig,[1,-1]);
peak_mask = zeros(size(mask));
labels = zeros(size(mask));
count = 0;
for j = 1:2
    vals = [];
    jdx = find(sig(:,j));
    dff = (jdx') - (1:length(jdx));
    unq = unique(dff);
    for k = 1:length(unq)
        kdx = jdx(dff == unq(k));
        count = count + 1;
        if j == 1
            rk = r(kdx);
            [pkvals,pkindx] = max(rk);
        elseif j == 2
            rk = -r(kdx);
            [pkvals,pkindx] = max(rk);
        end
        peak_mask(kdx(pkindx),j) = count;
        labels(kdx,j) = count;
    end
end
tspeaks = z(peak_mask(:,1) > 0,:);
tstroughs = z(peak_mask(:,2) > 0,:);
motionpeaks = relmot(peak_mask(:,1) > 0);
motiontroughs = relmot(peak_mask(:,2) > 0);
%%
output.r = r;
output.rrand = rrand;
output.relmot = relmot;
output.ts = ts;
output.tspeaks = tspeaks;
output.tstroughs = tstroughs;
output.motion = motion;
output.sig = sig;
output.peak_mask = peak_mask;
output.padj = padj;
output.p = p;
output.motionpeaks = motionpeaks;
output.motiontroughs = motiontroughs;