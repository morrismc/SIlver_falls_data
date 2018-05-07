%% Load Data
load('HalfMarathonData.mat')
%%  Pace vs time Plots


g(1,1) = gramm('x',halfMarathonData.TimeSeconds./60,'color',halfMarathonData.Wave);
g(1,1).stat_bin();
g(1,1).set_title('Half Marathon Time (minutes) vs Wave');
g(1,1).set_names('x','Half Marathon Time (minutes)','y','Count','color','Wave');


g(1,2) = gramm('x',halfMarathonData.PaceSeconds./60,'color',halfMarathonData.Wave);
g(1,2).stat_bin();
g(1,2).set_title('Half Marathon Pace (minutes)');
g(1,2).set_names('x','Half Marathon Pace (minutes)','y','Count','color','Wave');



g(2,1) = gramm('x',halfMarathonData.TimeSeconds./60,'color',halfMarathonData.Gender);
g(2,1).stat_bin();
g(2,1).set_title('Half Marathon Time (minutes) vs Count, Colored by Gender (1 = M; 2 = F)');
g(2,1).set_names('x','Race Time (minutes)','y','Count','color','Gender');


g(2,2) = gramm('x',halfMarathonData.PaceSeconds./60,'color',halfMarathonData.Gender);
g(2,2).stat_bin();
g(2,2).set_title('Half Marathon Pace (minutes) vs Count, Colored by Gender (1 = M; 2 = F)');
g(2,2).set_names('x','Race Pace (minutes)','y','Count','color','Gender');

figure('units','normalized','outerposition',[0 0 1 1])

set(gcf, 'color', [1 1 1]);

g.draw();

%%

g(1,1) = gramm('x',halfMarathonData.TimeSeconds./60,'color',halfMarathonData.Gender);
g(1,1).stat_bin();
g(1,1).set_title('Half Marathon Time (minutes) vs Gender (1 = M; 2 = F)');
g(1,1).set_names('x','Half Marathon Time (minutes)','y','Count','color','Wave');

figure;
g(1,1).draw;
%% Histograms of Origin State

g2(1,1) = gramm('x', halfMarathonData.OriginState);
g2(1,1).stat_bin();

g2(1,1).set_names('x','State of Origin','y','Number of Racers')
g2(1,1).set_title('Half Marathon Origin State');


g2(1,2) = gramm('x', halfMarathonData.OriginState,'color',halfMarathonData.Gender);
g2(1,2).stat_bin();
g2(1,2).set_names('x','State of Origin','y','Number of Racers')
g2(1,2).set_title('Half Marathon Origin State by Gender (M = 1; F = 2)');



g2(1,3) = gramm('x', halfMarathonData.OriginState,'y', (halfMarathonData.PaceSeconds./60),'color',halfMarathonData.Gender);
g2(1,3).stat_boxplot();
g2(1,3).set_names('x','State of Origin','y','Mile Pace (min)')
g2(1,3).set_title('Half Marathon Origin State by Pace Boxplot by Gender');

figure('units','normalized','outerposition',[0 0 1 1])

set(gcf, 'color', [1 1 1]);

g2.draw();

%% Histogram of Cities in Oregon where runners are from.


g3(1,1) = gramm('x', halfMarathonData.OriginCity(strcmp(halfMarathonData.OriginState,'OR')));
g3(1,1).stat_bin();
g3(1,1).set_names('x','Origin Cities in Oregon','y','Count');
g3(1,1).set_title('Origin Cities of Runners Within Oregon');
g3.axe_property('XTickLabelRotation',60);


g3(2,1) = gramm('x', halfMarathonData.OriginCity(strcmp(halfMarathonData.OriginState,'OR')),'color',halfMarathonData.Gender(strcmp(halfMarathonData.OriginState,'OR')));
g3(2,1).stat_bin();
g3(2,1).set_names('x','Origin Cities in Oregon','y','Count');
g3(2,1).set_title('Origin Cities of Runners by Gender (M = 1; F = 2)');
g3.axe_property('XTickLabelRotation',60);


g3(3,1) = gramm('x', halfMarathonData.OriginCity(strcmp(halfMarathonData.OriginState,'OR')),'color',halfMarathonData.Wave(strcmp(halfMarathonData.OriginState,'OR')));
g3(3,1).stat_bin();
g3(3,1).set_names('x','Origin Cities in Oregon','y','Count','color','Wave #');
g3(3,1).set_title('Origin Cities of Runners by Wave');
g3.axe_property('XTickLabelRotation',60);

figure
g3.draw();
%%

%Where are the fast runners from?

g4(1,1) = gramm('x', halfMarathonData.OriginCity(strcmp(halfMarathonData.OriginState,'OR')),'y',...
    halfMarathonData.PaceSeconds(strcmp(halfMarathonData.OriginState,'OR'))./60,'color',halfMarathonData.Wave(strcmp(halfMarathonData.OriginState,'OR')));
g4(1,1).stat_smooth('method','moving');
% g4(1,1).geom_jitter();
% g4(1,1).geom_vline('xintercept',0.5:1:73,'style','k.');
g4(1,1).set_names('x','Origin Cities in Oregon','y','Mile Pace (minutes)','color','Gender');
g4(1,1).set_title('Origin Cities of Runners Vs Pace (M = 1; F = 2)');
g4.axe_property('XTickLabelRotation',60);


figure('units','normalized','outerposition',[0 0 1 1])

set(gcf, 'color', [1 1 1]);

g4.draw();

%% All Race, Oregon, Eugene

g5(1,1) = gramm('x',halfMarathonData.PaceSeconds./60);
g5(1,1).stat_bin('geom','line','normalization','probability');
g5(1,1).set_title('Pace Data for Whole Race (red); Oregon (Blue); Eugene (Green)');
g5.draw();

g5(1,1).update('x',halfMarathonData.PaceSeconds(strcmp(halfMarathonData.OriginState,'OR'))./60);
% g5(1,1) = gramm('x',halfMarathonData.PaceSeconds(strcmp(halfMarathonData.OriginState,'OR'))./60);
g5(1,1).stat_bin('geom','line','normalization','probability');
g5(1,1).set_color_options('map',CustomColors('SlateBlue'));
g5(1,1).set_title('Pace Data for Whole Race (red); Oregon (Blue); Eugene (Green)');
g5.draw();

g5(1,1).update('x',halfMarathonData.PaceSeconds(strcmp(halfMarathonData.OriginCity,'Eugene'))./60);
% g5(1,1) = gramm('x',halfMarathonData.PaceSeconds(strcmp(halfMarathonData.OriginState,'OR'))./60);
g5(1,1).stat_bin('geom','line','normalization','probability');
g5(1,1).set_color_options('map',CustomColors('DarkOliveGreen3'));
g5(1,1).set_names('x','Minutes Per Mile Pace (Minutes)','y','Probability');
g5(1,1).set_title('Pace Data for Whole Race (red); Oregon (Blue); Eugene (Green)');





g5(1,1).draw();


%% Now take a look at how age effects pace


g6(1,1) = gramm('x',halfMarathonData.Age,'y',halfMarathonData.PaceSeconds./60,'color',halfMarathonData.Gender);
g6(1,1).geom_point();
g6(1,1).stat_glm('distribution','normal');
g6(1,1).set_names('x','Age (yr)','y','Pace (Min/Mile)');
g6(1,1).set_title('Age vs Pace colored by gender (M = 1; F = 2)[Linear Fit]');


g6(1,2) =  gramm('x',[halfMarathonData.Age],'y',halfMarathonData.PaceSeconds./60);
g6(1,2).stat_bin2d('nbins',[35 35],'geom', 'image');
g6(1,2).set_names('x','Age (yr)','y','Pace (Min/Mile)','color','Density');
g6(1,2).set_title('Age vs Pace Density plot');


g6(2,1) = gramm('x',[halfMarathonData.Age],'y',halfMarathonData.PaceSeconds./60);
g6(2,1).stat_bin();
g6(2,1).set_names('x','Age (yr)','y','Count');
g6(2,1).set_title('Age Histogram');

g6(2,2) = gramm('x',[halfMarathonData.Age],'y',halfMarathonData.PaceSeconds./60,'color',halfMarathonData.Gender);
g6(2,2).stat_bin();
g6(2,2).set_names('x','Age(yr)','y','Count','Color','Gender');
g6(2,2).set_title('Age Count, colored by Gender (M = 1; F = 2)');


figure('units','normalized','outerposition',[0 0 1 1])

set(gcf, 'color', [1 1 1]);

g6.draw();

%% How about the age distribution of different states by gender.

g7(1,1) = gramm('x', halfMarathonData.OriginState,'y', (halfMarathonData.Age),'color',halfMarathonData.Gender);
g7(1,1).stat_smooth();
g7(1,1).set_names('x','State of Origin','y','Age (Years)','Color','Gender')
g7(1,1).set_title({'Half Marathon Origin State by Age (yrs) Colored by Gender' '(M = 1; F = 2)'});



g7(2,1) = gramm('x', halfMarathonData.OriginCity(strcmp(halfMarathonData.OriginState,'OR')),'y',...
    halfMarathonData.Age(strcmp(halfMarathonData.OriginState,'OR')),'color',halfMarathonData.Gender(strcmp(halfMarathonData.OriginState,'OR')));
g7(2,1).stat_smooth();
g7(2,1).set_names('x','Origin City in Oregon','Y','Age','color','Gender');
g7(2,1).axe_property('XTickLabelRotation',60);
g7(2,1).set_title('Origin Cities in Oregon by Age grouped by Gender');

figure;
g7.draw();
