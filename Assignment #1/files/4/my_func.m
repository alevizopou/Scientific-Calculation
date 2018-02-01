function [ output_args ] = my_func(varargin)

if length(varargin) < 3
    disp('Few arguments!');
elseif length(varargin) == 3
        p = varargin{1};
        u = varargin{2};
        v = varargin{3};
        n = length(u);
        if n == length(v)
            I = eye(n);
            A = (I-u*transpose(v))^p
        else
            disp('Wrong vectors dimensions!');
        end
elseif length(varargin) == 4
        p = varargin{1};
        u = varargin{2};
        v = varargin{3};
        col = varargin{4};
        n = length(u);
        if n == length(v)
            I = eye(n);
            e = I(:,col);
            A = I-u*transpose(v);
            b = A*e;
            if p >= 2
                for i = 2:p,
                    b = A*b;
                end
                b
            else
                b
            end
        else
            disp('Wrong vectors dimensions!');
        end
else
    disp('Too many arguments!');
end
        
end