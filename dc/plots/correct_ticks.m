% Correct overlapping tick labels
% Give it an axis and which tick index to remove
% also control number of decimal places using
% C style format string
%
%        correct_ticks(axis_name, format_string, tick_indices)
function [] = correct_ticks(ax, format, ind)

    tickstr = [upper(ax) 'Tick'];
    labelstr = [tickstr 'Label'];

    ticks = get(gca, tickstr);
    ticks(ind) = [];
    set(gca, tickstr, ticks);

    if ~isempty(format)
        for ii = 1:length(ticks)
            ticklabels{ii} = sprintf(format, ticks(ii));
        end
        set(gca, labelstr, ticklabels);
    end
end