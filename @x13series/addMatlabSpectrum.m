% ADDMATLABSPECTRUM computes the spectrum of a variable using the Signal
% Processing. It adds up to four spectra (for Δdat, Δsa, Δir, and rsd). If
% Spectra are already in the variable, they are replaced. Thus, this
% program overwrites the spectra that were generated by x13as.exe.
%
% NOTE: This method requires that Matlab's Signal Processing Toolbox is
% installed.
%
% Usage:
%   x = x13(dates,data,spec);
%   x.addMatlabSpectrum;
%   plot(x,'sp0');
%
% NOTE: This program is part of the X-13 toolbox. It requires the Signal
% Processing toolbox as well.
%
% see also guix, x13, makespec, x13spec, x13series, x13composite, 
% x13series.plot,x13composite.plot, x13series.seasbreaks,
% x13composite.seasbreaks, fixedseas, camplet, spr, InstallMissingCensusProgram
%
% Author  : Yvan Lengwiler
% Version : 1.55
%
% If you use this software for your publications, please reference it as:
%
% Yvan Lengwiler, 'X-13 Toolbox for Matlab, Version 1.55', Mathworks File
% Exchange, 2014-2023.
% url: https://ch.mathworks.com/matlabcentral/fileexchange/49120-x-13-toolbox-for-seasonal-filtering

% History:
% 2021-04-27    Version 1.50    First version.

function obj = addMatlabSpectrum(obj)
    
    fn = fieldnames(obj.spec);

    if ismember('spectrum',fn)      % if not, just get out
    
        % check is toolbox is installed
        version = ver;
        okTBX = any(strcmp('Signal Processing Toolbox',{version.Name}));

        if ~okTBX   % unfortunately, Signal Proc TBX not available

             warning('X13TBX:miss_toolbox', ...
                'ADDMATLABSPECTRUM requires the Signal Process Toolbox');

        elseif any(isnan(obj.(obj.keyv.dat).(obj.keyv.dat)))
            
             warning('X13TBX:addMatlabSpectrum:NaNs', ...
                ['ADDMATLABSPECTRUM cannot work when the data contains ', ...
                 'missing values.']);

        else
            
            if ismember('seats',fn)
                sp1name = 's1s'; sp2name = 's2s';
            else
                sp1name = 'sp1'; sp2name = 'sp2';
            end

            req = obj.spec.ExtractValues('spectrum','save');
            if ismember('sp0',req)
                if ismember(obj.keyv.dat,obj.listofitems)
                    if ismember('sp0',obj.listofitems)
                        obj.rmitem('sp0');
                    end
                    obj.addspectrum(obj.keyv.dat,1,'sp0', ...
                        'Spectrum of first-differenced original data (with Matlab)');
                end
            end
            if ismember(sp1name,req)
                if ismember(obj.keyv.sa,obj.listofitems)
                    if ismember(sp1name,obj.listofitems)
                        obj.rmitem(sp1name);
                    end
                    obj.addspectrum(obj.keyv.sa,1,sp1name, ...
                        'Spectrum of first-differenced seasonally adjusted (with Matlab)');
                end
            end
            if ismember(sp2name,req)
                if ismember(obj.keyv.ir,obj.listofitems)
                    if ismember(sp2name,obj.listofitems)
                        obj.rmitem(sp2name);
                    end
                    obj.addspectrum(obj.keyv.ir,1,sp2name, ...
                        'Spectrum of irregular (with Matlab)');
                end
            end
            if ismember('spr',req)
                if ismember(obj.keyv.rsd,obj.listofitems)
                    if ismember('spr',obj.listofitems)
                        obj.rmitem('spr');
                    end
                    obj.addspectrum(obj.keyv.rsd,0,'spr', ...
                        'Spectrum of regression residuals (with Matlab)');
                end
            end

            obj = updatemsg(obj);

        end
    end
end
