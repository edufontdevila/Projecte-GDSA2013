id = keys(data_map);

msize = numel(id);
idx = randperm(msize);
id4train = id(idx(1:round(msize/2)));
id4clas = 