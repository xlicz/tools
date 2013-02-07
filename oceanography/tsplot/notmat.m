function fig = notmat()
% notmat  Generate graphical user interface to load ASCII data files
% =========================================================================
% notmat  Version 1.0 8-Sep-1998
%
% Usage: 
%   notmat  -Called by tsplot but can also be issued at command line
%
% Description:
%   notmat generates a graphical user interface to load ASCII data files
%   into the Matlab workspace and assign variable names to specific columns
%   of the input matrix.
%
% Input:
%   n/a
%
% Output:
%   fig = handle to window containing this graphical user interface
%
% Author:
%   Blair Greenan
%   Bedford Institute of Oceanography
%   September 8, 1998
%   Matlab 5.2.1
%   greenanb@mar.dfo-mpo.gc.ca
% =========================================================================
%

load notmat

% designed for 1024x768, so scale it if rootscreensize is different
set(0,'units','pixels');
rootscreensize = get(0,'screensize');
pixfactor = rootscreensize(3)/1024;


h0 = figure('Color',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'Colormap',mat0, ...
	'MenuBar','none', ...
	'Name','Load an ASCII File', ...
	'NumberTitle','off', ...
	'PointerShapeCData',mat1, ...
	'Position',pixfactor*[50 100 673 261], ...
	'Tag','Fig1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[21.72413793103449 80.68965517241381 83.17241379310346 12.41379310344828], ...
	'String','Label for Salinity', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[21.72413793103449 43.75862068965517 82.55172413793105 12.41379310344828], ...
	'String','Label for Temperature', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',pixfactor*[21.72413793103449 66.41379310344829 79.44827586206898 12.41379310344828], ...
	'Style','edit', ...
	'Tag','EditTextS');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[21.72413793103449 29.79310344827587 80.0689655172414 12.41379310344828], ...
	'Style','edit', ...
	'Tag','EditTextT');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*mat2, ...
	'String','Column #', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*mat3, ...
	'String','Column #', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[130.9655172413793 66.41379310344829 37.24137931034483 12.41379310344828], ...
	'Style','edit', ...
	'Tag','EditTextColS');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',pixfactor*[130.9655172413793 29.79310344827587 37.24137931034483 12.41379310344828], ...
	'Style','edit', ...
	'Tag','EditTextColT');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontSize',6, ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[21.72413793103449 99.93103448275865 385.4482758620691 34.75862068965518], ...
	'Style','text', ...
	'Tag','HeaderText');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[21.72413793103449 134.6896551724138 82.55172413793105 12.41379310344828], ...
	'String','File Header', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','tsloadASCII', ...
	'ListboxTop',0, ...
   'FontSize',ceil(pixfactor*8), ...
	'Position',pixfactor*[197.3793103448276 29.17241379310346 37.24137931034483 12.41379310344828], ...
	'String','Continue', ...
	'Tag','PushbuttonContinue');
if nargout > 0, fig = h0; end