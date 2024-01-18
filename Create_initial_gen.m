% Создание первого поколения
% Один из поколения будет нашим вариантом (идеальным предположительно)
% {[наличие] [позиция] [длина] [ширина]}

function initial_gen = Create_initial_gen()
    initial_gen = [
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
        Create_one_chrom();
        Create_one_chrom();
        Create_one_chrom();
        Create_one_chrom();
%        Create_one_chrom();
%        Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
%         Create_one_chrom();
    ];
end

function res_cell = Create_one_chrom()
    apper = [1, Create_one_dim_arr(6, 1)];
    size_apper = size(apper);
    n(1) = dlnode([1 + rand*9, 1 + rand*9, 1 + rand*9]);

    all_length = [];
    all_width = [];
    all_pos = [];

    all_length = [all_length, n(1).Data(1)];
    all_width = [all_width, n(1).Data(2)];
    all_pos = [all_pos, n(1).Data(3)];

    index_class_rect = 1;
    size_n_cur = 1;
    for flag = 2:size_apper(2)
        if apper(flag) == 1
            index_class_rect = 1 + index_class_rect;

            data_prev = n(index_class_rect - 1).Data;
            length_prev = data_prev(1);
            width_prev = data_prev(2);
            pos_prev = data_prev(3);

            cur_pos = (pos_prev + width_prev + 1) + rand*14;
            cur_width = (cur_pos - (pos_prev + width_prev + 1))*rand;
            cur_length = n(1).Data(1);

            n(index_class_rect) = dlnode([cur_length, cur_width, cur_pos]);
            n(index_class_rect).insertAfter(n(index_class_rect - 1));
            size_n_cur = size_n_cur + 1;
            
            if cur_width > 0.5
                all_length = [all_length, cur_length];
                all_width = [all_width, cur_width];
                all_pos = [all_pos, cur_pos];
            else
                all_length = [all_length, 0];
                all_width = [all_width, 0];
                all_pos = [all_pos, 0];
                apper(flag) = 0;
            end
        else
            cur_length = 0;
            cur_width =0;
            cur_pos = 0;
            all_length = [all_length, cur_length];
            all_width = [all_width, cur_width];
            all_pos = [all_pos, cur_pos];
        %all_data = [all_data; [cur_length cur_width cur_pos]];
        end
    end
    res_cell = {apper all_length all_width all_pos};
end

