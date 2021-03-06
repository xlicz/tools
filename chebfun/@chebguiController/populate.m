function initSuccess = populate(handles, chebg)
%POPULATE   Fill in the CHEBGUI figure using the information of a CHEBGUI object
% Calling sequence:
%   INITSUCCESS = POPULATE(HANDLES, CHEBG)
% where
%   INITSUCCESS:    Has value 1 if we managed to populate the figures without
%                   any troubles, 0 otherwise.
%   HANDLES:        A MATLAB handle of the CHEBGUI figure.
%   CHEBG:          A CHEBGUI object, containing the information we want to fill
%                   the figure with.

% Copyright 2014 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

% Fill the String fields of the handles
set(handles.input_domain, 'String', chebg.domain);
set(handles.input_DE, 'String', chebg.DE);
set(handles.input_LBC, 'String', chebg.LBC);
set(handles.input_RBC, 'String', chebg.RBC);
set(handles.input_BC, 'String', chebg.BC);
set(handles.input_GUESS, 'String', chebg.init);

if ( strcmpi(chebg.type, 'pde') )
    % Deal with the time field if we have a PDE
    set(handles.input_timedomain, 'String', chebg.timedomain);
    
elseif ( strcmpi(chebg.type, 'eig') )
    % Show the type of eigenmodes we seek.
    sigma = chebg.sigma;
    switch sigma
        case ''
            set(handles.popupmenu_sigma, 'Value', 1);
        case 'lm'
            set(handles.popupmenu_sigma, 'Value', 2);
        case 'sm'
            set(handles.popupmenu_sigma, 'Value', 3);
        case 'lr'
            set(handles.popupmenu_sigma, 'Value', 4);
        case 'sr'
            set(handles.popupmenu_sigma, 'Value', 5);
        case 'li'
            set(handles.popupmenu_sigma, 'Value', 6);
        case 'si'
            set(handles.popupmenu_sigma, 'Value', 7);
    end
    
end

% Store the tolerance in the UserData of the tolerance menu object
set(handles.menu_tolerance, 'UserData', chebg.tol);

% Change the checking of menu options
if ( strcmpi(chebg.type, 'pde') )
    
    set(handles.input_timedomain, 'String', chebg.timedomain);
    
    if ( ~strcmp(chebg.options.plotting, 'off') )
        set(handles.menu_pdeplottingon, 'Checked', 'On');
        set(handles.menu_pdeplottingoff, 'Checked', 'Off');
    else
        set(handles.menu_pdeplottingon, 'Checked', 'Off');
        set(handles.menu_pdeplottingoff, 'Checked', 'On');
    end
    
    if ( chebg.options.pdeholdplot )
        set(handles.menu_pdeholdploton, 'Checked', 'On');
        set(handles.menu_pdeholdplotoff, 'Checked', 'Off');
    else
        set(handles.menu_pdeholdploton, 'Checked', 'Off');
        set(handles.menu_pdeholdplotoff, 'Checked', 'On');
    end
    
    if ( ~isempty(chebg.options.fixYaxisLower) )
        set(handles.menu_pdefixon, 'Checked', 'On');
        set(handles.menu_pdefixoff, 'Checked', 'Off');
    else
        set(handles.menu_pdefixon, 'Checked', 'Off');
        set(handles.menu_pdefixoff, 'Checked', 'On');
    end
    
    if ( ~isempty(chebg.options.fixN) )
        set(handles.menu_fixNon, 'Checked', 'On');
        set(handles.menu_fixNoff, 'Checked', 'Off');
    else
        set(handles.menu_fixNon, 'Checked', 'Off');
        set(handles.menu_fixNoff, 'Checked', 'On');
    end
    
elseif ( strcmpi(chebg.type, 'bvp') )
    
    if ( strcmp(chebg.options.damping, '1') )
        set(handles.menu_odedampednewtonon, 'Checked', 'On');
        set(handles.menu_odedampednewtonoff, 'Checked', 'Off');
    else
        set(handles.menu_odedampednewtonon, 'Checked', 'Off');
        set(handles.menu_odedampednewtonoff, 'Checked', 'On');
    end
    
    if ( ~strcmp(chebg.options.plotting, 'off') )
        set(handles.menu_odeplottingon, 'Checked', 'On');
        set(handles.menu_odeplottingoff, 'Checked', 'Off');
        set(handles.menu_odeplottingpause, 'UserData', ...
            chebg.options.plotting);
    else
        set(handles.menu_odeplottingon, 'Checked', 'Off');
        set(handles.menu_odeplottingoff, 'Checked', 'On');
    end
    
end

% Make sure that we enable the BCs fields again when we load a new demo
set(handles.input_LBC, 'Enable', 'on');
set(handles.input_RBC, 'Enable', 'on');

% Try to plot the initial guess/condition if one exist in the CHEBGUI
% object. If an error is returned, we keep calm and carry on.
if ( ~isempty(chebg.init) )

    try
        initString = chebg.init;
        % Obtain the name of the independent variable from the init field.
        % Need to do concatenation if it's a cellstring
        if ( iscellstr(initString) )
            allString = [];
            for initCounter = 1:length(initString)
                % Throw away everything left of = in init
                equalSign = find(initString{initCounter} == '=');
                allString = [allString, ', ', ...
                    initString{initCounter}(equalSign+1:end)]; %#ok<AGROW>
            end
        else % Else wrap in a cell for later use
            % Throw away everything left of = in init
            equalSign = find(initString == '=');
            if ( isempty(equalSign) )
                equalSign = 0;
            end
            allString = initString(equalSign+1:end);
            initString = cellstr(initString);
        end
        % Now obtain the name of the variables
        indVar = symvar(allString);
        
        % Create a domain and a temporary independent variable
        dom = str2num(chebg.domain); %#ok<*ST2NM>
        
        % Create the independent space variable:
        xTemp = chebfun(@(x) x, dom);
        % Only support one independent variable for initial
        % guesses/condition.
        if ( length(indVar) > 1 )
            return
        elseif ( isempty(indVar) ) % Only constants passed
            % Do nothing
        else
            % Assign the independent variable its correct name
            eval(sprintf('%s = xTemp;', indVar{1}))
        end
        
        % Put the initString in a cell
        initChebfun = chebfun;
        if ( ~iscell(initString) )
            initString = cellstr(initString);
        end
        
        for initCounter = 1:length(initString)
            equalSign = find(initString{initCounter} == '=');
            if ( isempty(equalSign) )
                equalSign = 0;
            end
            currInit = vectorize(initString{initCounter}(equalSign+1:end));           
            initChebfun = [initChebfun, chebfun(currInit, dom)]; %#ok<AGROW>
        end
        
        axes(handles.fig_sol);
        plot(initChebfun, 'LineWidth', 2)
        
        if ( ~isempty(chebg.options.fixYaxisLower) ) % Fix y-axis
            ylim([str2num(chebg.options.fixYaxisLower), ...
                str2num(chebg.options.fixYaxisUpper)]);
        end
        
        % Show grid?
        if ( chebg.options.grid )
            grid on
        end
        
        if ( strcmpi(chebg.type, 'bvp') )
            title('Initial guess of solution')
        else
            title('Initial condition')
        end
        
        % Hurray, managed to do everything we wanted.
        initSuccess = 1;
        
    catch
        % Something went wrong.
        initSuccess = 0;
    end
    
else % isempty(chebg.init)
    initSuccess = 0;
end

% If we have periodic BCs, we want to disable some fields.
if ( strcmpi(chebg.LBC, 'periodic') )
    set(handles.input_RBC, 'String', 'periodic');
    handles.guifile.RBC = '';
    set(handles.input_RBC, 'Enable', 'off');
elseif ( strcmpi(chebg.RBC, 'periodic') )
    set(handles.input_LBC, 'String', 'periodic');
    handles.guifile.LBC = 'periodic';
    handles.guifile.RBC = '';
    set(handles.input_RBC, 'Enable', 'off');
end

end
