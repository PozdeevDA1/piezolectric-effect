function res = Mutation(res_cross, sigma0)
    before_res = [];
    res = [];
    size_res_cross = size(res_cross);
    for index_chromosom_res_cross = 1:size_res_cross(1)
        %Определяем, будет ли изменяться хромосома
        flag = rand*(1) < sigma0;
        if flag == 1
            for num_item = drange(1:size_res_cross(2))
                % Стоит обратить внимание, что меняется вся хромосома. И
                % наличие дисков, и коэффициенты. Мне кажется, что такого
                % быть не должно. Возможно, стоит флаг поставить в каждую
                % из ветвей перед изменением.
                cur_chromosom = res_cross(index_chromosom_res_cross, :);
                item = cur_chromosom{num_item};
                size_item = size(item);
                    % Генерируется две позиции, где произойдут изменения
                    for i = randi([1,size_item(2)],1,2)
                        if item(i) == 0
                            item(i) = 1;
                        elseif item(i) == 1
                            item(i) = 0;
                        else
                            item(i) = item(i) + sigma0 * abs(randn());
                        end
                    end
                    before_res = [before_res {item}];
            end
            res = [res; before_res];
            before_res = [];
        else
            res = [res; res_cross(index_chromosom_res_cross, :)];
        end

    end
end

