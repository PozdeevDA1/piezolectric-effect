close all
clear
clc

addpath auxiliary_functions\
addpath @dlnode\

%% Создание первого поколения
initial_gen = Create_initial_gen();
size_initial_gen = size(initial_gen);
cur_gen = initial_gen;

P = [];
F = [];
F_abs = [];
disp(cur_gen)
% Оценка стоимости каждой хромосомы
for i = 1:size_initial_gen(1)
    disp("Current chromosome ")
    disp(i)
    tic
    F(end+1) = Cost_func_piez(cur_gen(i,:));
    Clear_all();
    disp('Заняло времени')
    disp(toc)
    F_abs(end+1) = abs(F(end));
    disp(F(end))
end

disp('Initial generation is ready')
all_loops = 2;

for loop = 1:all_loops
    tic
    %% Рулетка
    % Сопоставлние вероятности выпадания с каждой хромосомой
    P = P_calc(F, F_abs);
    res_ruletka = Ruletka(P, cur_gen, size_initial_gen(1));
    %% Кроссовер
    res_cross = Crossover(res_ruletka);
    %% Мутации
    new = Mutation(res_cross, 0.1);
    size_new = size(new);
    %% Выявление лучших
    F_new = [];
    F_new_abs = [];

    disp(new)

    % Оценка стоимости новых хромосом
    for i = 1:size_new(1)
        F_new(end+1) = Cost_func_piez(new(i, :));
        F_new_abs(end+1) = abs(F_new(end));
    end

    all = [cur_gen; new];
    size_all = size(all);
    indexes = cellstr(string(1:size_all(1)));
    F_all = [F F_new];
    dict = containers.Map(indexes, F_all);
    [dict_sort, keys_sort, values_sort] = sort_map(dict);
    y = [];
    for i = drange(1:size_initial_gen(1))
        x = keys_sort(i);
        x_1 = x{1};
        y = [y; all(str2num(x_1),:)];
        F(i) = values_sort(i);
        F_abs(i) = abs(F(i));
    end
    cur_gen = y;
    disp("Текущий круг:")
    disp(loop)
    disp("Его обработка заняло время:")
    T_loop = toc;
    disp(T_loop)
    disp("Текущее поколение:")
    disp(cur_gen)
    disp("Оценка оставшегося времени для оптимизации:")
    disp(T_loop*(all_loops-1))
end
%% Генерация mph модели и данных для графика
mphsave('optimized_model')
Table_with_params = table(cur_gen(1, :));
if ~exist('result_new_1', 'dir')
           mkdir('result_new_1')
end
cd result_new_1/
writetable(Table_with_params,'params_struct_new.txt');
cd ..

% disp("Получение данных для графика.")
% Get_res_table(cur_gen(1,:));