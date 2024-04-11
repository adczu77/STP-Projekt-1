T = 0.5;
[licznik_d, mianownik_d] = c2dm([1 10 12.75],[1 33 362 1320], T, 'zoh');

ZeraZ = roots(licznik_d);
BiegunyZ = roots(mianownik_d);

b2 = licznik_d(1,2);
b1 = licznik_d(1,3);
b0 = licznik_d(1,4);
a2 = mianownik_d(1,2);
a1 = mianownik_d(1,3);
a0 = mianownik_d(1,4);

ts = out.transm_s.time;
tz = out.dyskretny1_zer.time;
odp_transm_s = out.transm_s.signals.values;
odp_w1_zer = out.dyskretny1_zer.signals.values;
odp_w2_zer = out.dyskretny2_zer.signals.values;
odp_w1_niezer=out.dyskretny1_niezer.signals.values;
odp_w2_niezer=out.dyskretny2_niezer.signals.values;
odp_transm_z_zer = out.transm_z_zer.signals.values;
odp_transm_z_niezer=out.transm_z_niezer.signals.values;


% figure('Position', [0, 0, 1000,1000]);
% subplot(2,2,1)
% plot(ts,odp_transm_s)
% xlabel('t')
% ylabel('G(s)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Odpowiedź transmitancji ciągłej:')
% legend('G(s)')
% 
% subplot(2,2,2)
% stairs(tz,odp_transm_z_zer)
% xlabel('k')
% ylabel('G(z)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Odpowiedź transmitancji dyskretnej:')
% legend('G(z) T=0.5')
% 
% subplot(2,2,3)
% stairs(tz,odp_w1_zer)
% xlabel('k')
% ylabel('y_{w1}(k)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title({'Odpowiedź modelu w przesztrzeni stanu', 'uzyskanego z pierwszego wariantu', 'metody bezpośredniej:'})
% legend('y_{w1}(k) T=0.5')
% 
% subplot(2,2,4)
% stairs(tz,odp_w2_zer)
% xlabel('k')
% ylabel('y_{w2}(k)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title({'Odpowiedź modelu w przesztrzeni stanu', 'uzyskanego z drugiego wariantu', 'metody bezpośredniej:'})
% legend('y_{w2}(k) T=0.5')
% print('stp3wykres1.png','-dpng','-r400')
% hold off;
% 
% figure('Position', [0, 0, 1000,1000]);
% subplot(2,2,1)
% plot(ts,odp_transm_s)
% xlabel('t')
% ylabel('G(s)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Odpowiedź transmitancji ciągłej:')
% legend('G(s)')
% 
% subplot(2,2,2)
% stairs(tz,odp_transm_z_niezer)
% xlabel('k')
% ylabel('G(z)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Odpowiedź transmitancji dsykretnej:')
% legend('G(z) T=0.5')
% 
% subplot(2,2,3)
% stairs(tz,odp_w1_niezer)
% xlabel('k')
% ylabel('y_{w1}(k)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title({'Odpowiedź modelu w przesztrzeni stanu', 'uzyskanego z pierwszego wariantu', 'metody bezpośredniej:'})
% legend('y_{w1}(k) T=0.5')
% 
% subplot(2,2,4)
% stairs(tz,odp_w2_niezer)
% xlabel('k')
% ylabel('y_{w2}(k)', 'Rotation', 0, 'HorizontalAlignment', 'right')
% title({'Odpowiedź modelu w przesztrzeni stanu', 'uzyskanego z drugiego wariantu', 'metody bezpośredniej:'})
% legend('y_{w2}(k) T=0.5')
% print('stp3wykres2.png','-dpng','-r400')
% hold off;

A = [-a2 -a1 -a0; 1 0 0; 0 1 0];
B = [1;0;0];
C = [b2 b1 b0];
K1 = acker(A,B,[0.9 0.9 0.9]);
K2 = acker(A,B,[0.24 0.24 0.24]);
K3 = acker(A,B,[0.095 0.095 0.095]);
K4 = acker(A,B,[0.02 0.02 0.02]);
zb1 = 0.8;
zb2 = 0.4;
zb3 = 0.1;
zb4 = 0.05;
zb5 = 0.005;
zo1 = 0.7;
zo2 = 0.4;
zo3 = 0.25;
zo4 = 0.1;
zo5 = 0.05;
zb = 0.005;
L1 = acker(A',C', [zo1 zo1 zo1]);
L2 = acker(A',C', [zo2 zo2 zo2]);
L3 = acker(A',C', [zo3 zo3 zo3]);
L4 = acker(A',C', [zo4 zo4 zo4]);
L5 = acker(A',C', [zo5 zo5 zo5]);

t_reg = out.z_regulatorem.time;
odp_u_zb1 = out.u_zb1.signals.values;
odp_x1_zb1 = out.x1_zb1.signals.values;
odp_x2_zb1 = out.x2_zb1.signals.values;
odp_x3_zb1 = out.x3_zb1.signals.values;
odp_u_zb2 = out.u_zb2.signals.values;
odp_x1_zb2 = out.x1_zb2.signals.values;
odp_x2_zb2 = out.x2_zb2.signals.values;
odp_x3_zb2 = out.x3_zb2.signals.values;
odp_u_zb3 = out.u_zb3.signals.values;
odp_x1_zb3 = out.x1_zb3.signals.values;
odp_x2_zb3 = out.x2_zb3.signals.values;
odp_x3_zb3 = out.x3_zb3.signals.values;
odp_u_zb4 = out.u_zb4.signals.values;
odp_x1_zb4 = out.x1_zb4.signals.values;
odp_x2_zb4 = out.x2_zb4.signals.values;
odp_x3_zb4 = out.x3_zb4.signals.values;
odp_u_zb5 = out.u_zb4.signals.values;
odp_x1_zb5 = out.x1_zb5.signals.values;
odp_x2_zb5 = out.x2_zb5.signals.values;
odp_x3_zb5 = out.x3_zb5.signals.values;

% figure;
% hold on;
% stairs(t_reg,odp_u_zb1)
% stairs(t_reg,odp_u_zb2,'-')
% stairs(t_reg,odp_u_zb3,'--')
% stairs(t_reg,odp_u_zb4,'-.')
% stairs(t_reg,odp_u_zb5,':')
% xlabel('k')
% ylabel({'u(k)'}, 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Przebieg sygnału sterowania u(k) dla regulatora o danym biegunie potrójnym:') 
% legend('zb1 = 0,8','zb2 = 0,4', 'zb3 = 0,1', 'zb4 = 0,05', 'zb5 = 0,005')
% hold off;
% print('stp5wykres1.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x1_zb1)
% stairs(t_reg,odp_x1_zb2,'-')
% stairs(t_reg,odp_x1_zb3,'--')
% stairs(t_reg, odp_x1_zb4,'-.')
% stairs(t_reg,odp_x1_zb5,':')
% xlabel('k')
% ylabel({'x_1(k)'}, 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Przebieg sygnału x_1(k) dla regulatora o danym biegunie potrójnym:') 
% legend('zb1 = 0,8','zb2 = 0,4', 'zb3 = 0,1', 'zb4 = 0,05', 'zb5 = 0,005')
% hold off;
% print('stp5wykres2.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x2_zb1)
% stairs(t_reg,odp_x2_zb2,'-')
% stairs(t_reg,odp_x2_zb3,'--')
% stairs(t_reg, odp_x2_zb4,'-.')
% stairs(t_reg,odp_x2_zb5,':')
% xlabel('k')
% ylabel({'x_2(k)'}, 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Przebieg sygnału x_2(k) dla regulatora o danym biegunie potrójnym:') 
% legend('zb1 = 0,8','zb2 = 0,4', 'zb3 = 0,1', 'zb4 = 0,05', 'zb5 = 0,005')
% hold off;
% print('stp5wykres3.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x3_zb1)
% stairs(t_reg,odp_x3_zb2,'-')
% stairs(t_reg,odp_x3_zb3,'--')
% stairs(t_reg, odp_x3_zb4,'-.')
% stairs(t_reg, odp_x3_zb5,':')
% xlabel('k')
% ylabel({'x_3(k)'}, 'Rotation', 0, 'HorizontalAlignment', 'right')
% title('Przebieg sygnału x_3(k) dla regulatora o danym biegunie potrójnym:') 
% legend('zb1 = 0,8','zb2 = 0,4', 'zb3 = 0,1', 'zb4 = 0,05', 'zb5 = 0,005')
% hold off;
% print('stp5wykres4.png','-dpng','-r400')

odp_u_zb_zo1 = out.u_zb_zo1.signals.values;
odp_u_zb_zo2 = out.u_zb_zo2.signals.values;
odp_u_zb_zo3 = out.u_zb_zo3.signals.values;
odp_u_zb_zo4 = out.u_zb_zo4.signals.values;
odp_u_zb_zo5 = out.u_zb_zo5.signals.values;

odp_x1_zb_zo1 = out.x1_zb_zo1.signals.values;
odp_x1_zb_zo2 = out.x1_zb_zo2.signals.values;
odp_x1_zb_zo3 = out.x1_zb_zo3.signals.values;
odp_x1_zb_zo4 = out.x1_zb_zo4.signals.values;
odp_x1_zb_zo5 = out.x1_zb_zo5.signals.values;
odp_x1est_zo1 = out.x1est_zo1.signals.values;
odp_x1est_zo2 = out.x1est_zo2.signals.values;
odp_x1est_zo3 = out.x1est_zo3.signals.values;
odp_x1est_zo4 = out.x1est_zo4.signals.values;
odp_x1est_zo5 = out.x1est_zo5.signals.values;

odp_x2_zb_zo1 = out.x2_zb_zo1.signals.values;
odp_x2_zb_zo2 = out.x2_zb_zo2.signals.values;
odp_x2_zb_zo3 = out.x2_zb_zo3.signals.values;
odp_x2_zb_zo4 = out.x2_zb_zo4.signals.values;
odp_x2_zb_zo5 = out.x2_zb_zo5.signals.values;
odp_x2est_zo1 = out.x2est_zo1.signals.values;
odp_x2est_zo2 = out.x2est_zo2.signals.values;
odp_x2est_zo3 = out.x2est_zo3.signals.values;
odp_x2est_zo4 = out.x2est_zo4.signals.values;
odp_x2est_zo5 = out.x2est_zo5.signals.values;

odp_x3_zb_zo1 = out.x3_zb_zo1.signals.values;
odp_x3_zb_zo2 = out.x3_zb_zo2.signals.values;
odp_x3_zb_zo3 = out.x3_zb_zo3.signals.values;
odp_x3_zb_zo4 = out.x3_zb_zo4.signals.values;
odp_x3_zb_zo5 = out.x3_zb_zo5.signals.values;
odp_x3est_zo1 = out.x3est_zo1.signals.values;
odp_x3est_zo2 = out.x3est_zo2.signals.values;
odp_x3est_zo3 = out.x3est_zo3.signals.values;
odp_x3est_zo4 = out.x3est_zo4.signals.values;
odp_x3est_zo5 = out.x3est_zo5.signals.values;

% figure;
% hold on;
% stairs(t_reg,odp_x1_zb_zo1);
% stairs(t_reg,odp_x1est_zo1);
% stairs(t_reg,odp_x1est_zo2,'--');
% stairs(t_reg,odp_x1est_zo3,'--');
% stairs(t_reg,odp_x1est_zo4,'-.');
% stairs(t_reg,odp_x1est_zo5,'-.');
% ylim([-inf 10])
% xlabel('k')
% ylabel({'x_1(k)','x_{1est}(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_1(k) i x_{1est}(k) dla obserwatora o biegunie potrójnym', 'przy stanie mierzonym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend('x_1(k) zb = 0,005',"zo1=0,7 max="+round(max(odp_x1est_zo1)),"zo2=0,4 max="+round(max(odp_x1est_zo2)), "zo3=0,25 max="+round(max(odp_x1est_zo3)), "zo4=0,1 max="+round(max(odp_x1est_zo4)), "zo5=0,05 max="+round(max(odp_x1est_zo5)))
% hold off;
% print('stp7wykres1.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x2_zb_zo1);
% stairs(t_reg,odp_x2est_zo1);
% stairs(t_reg,odp_x2est_zo2,'--');
% stairs(t_reg,odp_x2est_zo3,'--');
% stairs(t_reg,odp_x2est_zo4,'-.');
% stairs(t_reg,odp_x2est_zo5,'-.');
% ylim([-inf 10])
% xlabel('k')
% ylabel({'x_2(k)','x_{2est}(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_2(k) i x_{2est}(k) dla obserwatora o biegunie potrójnym', 'przy stanie mierzonym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend('x_2(k) zb = 0,005',"zo1=0,7 max="+round(max(odp_x2est_zo1)),"zo2=0,4 max="+round(max(odp_x2est_zo2)), "zo3=0,25 max="+round(max(odp_x2est_zo3)), "zo4=0,1 max="+round(max(odp_x2est_zo4)), "zo5=0,05 max="+round(max(odp_x2est_zo5)))
% hold off;
% print('stp7wykres2.png','-dpng','-r400')

% figure;
% hold on;
% stairs(t_reg,odp_x3_zb_zo1);
% stairs(t_reg,odp_x3est_zo1);
% stairs(t_reg,odp_x3est_zo2,'--');
% stairs(t_reg,odp_x3est_zo3,'--');
% stairs(t_reg,odp_x3est_zo4,'-.');
% stairs(t_reg,odp_x3est_zo5,'-.');
% ylim([-inf 10])
% xlabel('k')
% ylabel({'x_3(k)','x_{3est}(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_3(k) i x_{3est}(k) dla obserwatora o biegunie potrójnym', 'przy stanie mierzonym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend('x_3(k) zb = 0,005',"zo1=0,7 max="+round(max(odp_x3est_zo1)),"zo2=0,4 max="+round(max(odp_x3est_zo2)), "zo3=0,25 max="+round(max(odp_x3est_zo3)), "zo4=0,1 max="+round(max(odp_x3est_zo4)), "zo5=0,05 max="+round(max(odp_x3est_zo5)))
% hold off;
% print('stp7wykres3.png','-dpng','-r400')

% figure;
% hold on;
% stairs(t_reg,odp_u_zb_zo1);
% stairs(t_reg,odp_u_zb_zo2,'-');
% stairs(t_reg,odp_u_zb_zo3,'--');
% stairs(t_reg,odp_u_zb_zo4,'-.');
% stairs(t_reg,odp_u_zb_zo5,':');
% ylim([-inf 0.25])
% xlabel('k')
% ylabel({'u(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej sterowania u(k) dla obserwatora o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_u_zb_zo1),3),"zo2=0,4 max="+round(max(odp_u_zb_zo2),3), "zo3=0,25 max="+round(max(odp_u_zb_zo3),3), "zo4=0,1 max="+round(max(odp_u_zb_zo4),3), "zo5=0,05 max="+round(max(odp_u_zb_zo5),3))
% hold off;
% print('stp8wykres1.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x1est_zo1);
% stairs(t_reg,odp_x1est_zo2,'-');
% stairs(t_reg,odp_x1est_zo3,'--');
% stairs(t_reg,odp_x1est_zo4,'-.');
% stairs(t_reg,odp_x1est_zo5,':');
% ylim([-inf 0.25])
% xlabel('k')
% ylabel({'x_2(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej sterowania x_2(k) dla obserwatora o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_x1est_zo1),3),"zo2=0,4 max="+round(max(odp_x1est_zo2),3), "zo3=0,25 max="+round(max(odp_x1est_zo3),3), "zo4=0,1 max="+round(max(odp_x1est_zo4),3), "zo5=0,05 max="+round(max(odp_x1est_zo5),3))
% hold off;
% print('stp8wykres2.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x2est_zo1);
% stairs(t_reg,odp_x2est_zo2,'-');
% stairs(t_reg,odp_x2est_zo3,'--');
% stairs(t_reg,odp_x2est_zo4,'-.');
% stairs(t_reg,odp_x2est_zo5,':');
% ylim([-inf 0.25])
% xlabel('k')
% ylabel({'x_2(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej sterowania x_2(k) dla obserwatora o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_x2est_zo1),3),"zo2=0,4 max="+round(max(odp_x2est_zo2),3), "zo3=0,25 max="+round(max(odp_x2est_zo3),3), "zo4=0,1 max="+round(max(odp_x2est_zo4),3), "zo5=0,05 max="+round(max(odp_x2est_zo5),3))
% hold off;
% print('stp8wykres3.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_reg,odp_x3est_zo1);
% stairs(t_reg,odp_x3est_zo2,'-');
% stairs(t_reg,odp_x3est_zo3,'--');
% stairs(t_reg,odp_x3est_zo4,'-.');
% stairs(t_reg,odp_x3est_zo5,':');
% ylim([-inf 0.25])
% xlabel('k')
% ylabel({'x_3(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej sterowania x_3(k) dla obserwatora o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_x3est_zo1),3),"zo2=0,4 max="+round(max(odp_x3est_zo2),3), "zo3=0,25 max="+round(max(odp_x3est_zo3),3), "zo4=0,1 max="+round(max(odp_x3est_zo4),3), "zo5=0,05 max="+round(max(odp_x3est_zo5),3))
% hold off;
% print('stp8wykres4.png','-dpng','-r400')
AII = [-a2 1 0; -a1 0 1; -a0 0 0];
BII = [b2;b1;b0];
CII = [1 0 0];
A11 = -a2;
A12 = [1 0];
A21 = [-a1 -a0];
A22 = [0 1; 0 0];
B1 = b2;
B2 = [b1 b0];
K_zr = acker(AII,BII,[zb zb zb]);

t_zre = out.u_zre_zo1.time;
odp_u_zre_zo1 = out.u_zre_zo1.signals.values;
odp_u_zre_zo2 = out.u_zre_zo2.signals.values;
odp_u_zre_zo3 = out.u_zre_zo3.signals.values;
odp_u_zre_zo4 = out.u_zre_zo4.signals.values;
odp_u_zre_zo5 = out.u_zre_zo5.signals.values;

odp_x1_zre_zo1 = out.x1zre_zo1.signals.values;
odp_x1_zre_zo2 = out.x1zre_zo2.signals.values;
odp_x1_zre_zo3 = out.x2zre_zo3.signals.values;
odp_x1_zre_zo4 = out.x2zre_zo4.signals.values;
odp_x1_zre_zo5 = out.x2zre_zo5.signals.values;

odp_x2_zre_zo1 = out.x2zre_zo1.signals.values;
odp_x2_zre_zo2 = out.x2zre_zo2.signals.values;
odp_x2_zre_zo3 = out.x2zre_zo3.signals.values;
odp_x2_zre_zo4 = out.x2zre_zo4.signals.values;
odp_x2_zre_zo5 = out.x2zre_zo5.signals.values;

odp_x3_zre_zo1 = out.x3zre_zo1.signals.values;
odp_x3_zre_zo2 = out.x3zre_zo2.signals.values;
odp_x3_zre_zo3 = out.x3zre_zo3.signals.values;
odp_x3_zre_zo4 = out.x3zre_zo4.signals.values;
odp_x3_zre_zo5 = out.x3zre_zo5.signals.values;

odp_x2est_zre_zo1 = out.x2est_zre_zo1.signals.values;
odp_x2est_zre_zo2 = out.x2est_zre_zo2.signals.values;
odp_x2est_zre_zo3 = out.x2est_zre_zo3.signals.values;
odp_x2est_zre_zo4 = out.x2est_zre_zo4.signals.values;
odp_x2est_zre_zo5 = out.x2est_zre_zo5.signals.values;

odp_x3est_zre_zo1 = out.x3est_zre_zo1.signals.values;
odp_x3est_zre_zo2 = out.x3est_zre_zo2.signals.values;
odp_x3est_zre_zo3 = out.x3est_zre_zo3.signals.values;
odp_x3est_zre_zo4 = out.x3est_zre_zo4.signals.values;
odp_x3est_zre_zo5 = out.x3est_zre_zo5.signals.values;

% figure;
% hold on;
% stairs(t_zre, odp_x2_zre_zo1);
% stairs(t_zre, odp_x2est_zre_zo1,'--');
% stairs(t_zre, odp_x2est_zre_zo2,'--');
% stairs(t_zre, odp_x2est_zre_zo3,'-.');
% stairs(t_zre, odp_x2est_zre_zo4,'-.');
% stairs(t_zre, odp_x2est_zre_zo5,':');
% xlabel('k')
% ylabel({'x_2(k)','x_{2est}(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennych stanu x_2(k) i x_{2est}(k) dla zredukowanego','obserwatora o biegunie potrójnym''przy stanie mierzonym, zerowych', 'warunkach początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend('x_2(k) zb=0.005', 'zo1=0,7', 'zo2=0,4', 'zo3=0,25', 'zo4=0,1', 'zo5=0,05')
% hold off;
% print('stpdodwykres1.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_zre, odp_x3_zre_zo1);
% stairs(t_zre, odp_x3est_zre_zo1,'--');
% stairs(t_zre, odp_x3est_zre_zo2,'--');
% stairs(t_zre, odp_x3est_zre_zo3,'-.');
% stairs(t_zre, odp_x3est_zre_zo4,'-.');
% stairs(t_zre, odp_x3est_zre_zo5,':');
% xlabel('k')
% ylabel({'x_3(k)','x_{3est}(k)'}, 'Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennych stanu x_3(k) i x_{3est}(k) dla zredukowanego','obserwatora o biegunie potrójnym''przy stanie mierzonym, zerowych', 'warunkach początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend('x_2(k) zb=0.005', 'zo1=0,7', 'zo2=0,4', 'zo3=0,25', 'zo4=0,1', 'zo5=0,05')
% hold off;
% print('stpdodwykres2.png','-dpng','-r400')

% figure;
% hold on;
% stairs(t_zre, odp_u_zre_zo1);
% stairs(t_zre, odp_u_zre_zo2,'-');
% stairs(t_zre, odp_u_zre_zo3,'--');
% stairs(t_zre, odp_u_zre_zo4,'-.');
% stairs(t_zre, odp_u_zre_zo5,':');
% ylim([-inf 25])
% xlabel('k');
% ylabel('u(k)','Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej sterowania u(k) dla', 'obserwatora zredukowanego o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_u_zre_zo1),3),"zo2=0,4 max="+round(max(odp_u_zre_zo2),3), "zo3=0,25 max="+round(max(odp_u_zre_zo3),3), "zo4=0,1 max="+round(max(odp_u_zre_zo4),3), "zo5=0,05 max="+round(max(odp_u_zre_zo5),3))
% hold off;
% print('stpdod2wykres1.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_zre, odp_x1_zre_zo1);
% stairs(t_zre, odp_x1_zre_zo2,'-');
% stairs(t_zre, odp_x1_zre_zo3,'--');
% stairs(t_zre, odp_x1_zre_zo4,'-.');
% stairs(t_zre, odp_x1_zre_zo5,':');
% xlabel('k');
% ylabel('x_1(k)','Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_1(k) dla', 'obserwatora zredukowanego o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7","zo2=0,4", "zo3=0,25", "zo4=0,1", "zo5=0,05")
% hold off;
% print('stpdod2wykres2.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_zre, odp_x2_zre_zo1);
% stairs(t_zre, odp_x2_zre_zo2,'-');
% stairs(t_zre, odp_x2_zre_zo3,'--');
% stairs(t_zre, odp_x2_zre_zo4,'-.');
% stairs(t_zre, odp_x2_zre_zo5,':');
% xlabel('k');
% ylabel('x_2(k)','Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_2(k) dla', 'obserwatora zredukowanego o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7","zo2=0,4", "zo3=0,25", "zo4=0,1", "zo5=0,05")
% hold off;
% print('stpdod2wykres3.png','-dpng','-r400')
% 
% figure;
% hold on;
% stairs(t_zre, odp_x3_zre_zo1);
% stairs(t_zre, odp_x3_zre_zo2,'-');
% stairs(t_zre, odp_x3_zre_zo3,'--');
% stairs(t_zre, odp_x3_zre_zo4,'-.');
% stairs(t_zre, odp_x3_zre_zo5,':');
% ylim([-inf 0.001])
% xlabel('k');
% ylabel('x_3(k)','Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_3(k) dla', 'obserwatora zredukowanego o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7 max="+round(max(odp_x3_zre_zo1),3),"zo2=0,4 max="+round(max(odp_x3_zre_zo2),3), "zo3=0,25 max="+round(max(odp_x3_zre_zo3),3), "zo4=0,1 max="+round(max(odp_x3_zre_zo4),3), "zo5=0,05 max="+round(max(odp_x3_zre_zo5),3))
% hold off;
% print('stpdod2wykres4.png','-dpng','-r400')

% figure;
% hold on;
% stairs(t_zre, odp_x3_zre_zo1);
% stairs(t_zre, odp_x3_zre_zo2,'-');
% stairs(t_zre, odp_x3_zre_zo3,'--');
% stairs(t_zre, odp_x3_zre_zo4,'-.');
% stairs(t_zre, odp_x3_zre_zo5,':');
% xlabel('k');
% ylabel('x_3(k)','Rotation', 0 ,'HorizontalAlignment', 'right')
% title({'Przebieg zmiennej stanu x_3(k) dla', 'obserwatora zredukowanego o biegunie potrójnym', 'przy stanie estymowanym, zerowych warunkach', 'początkowych obserwatora i niezerowych', 'warunkach początkowych obiektu (z pkt 5):'})
% legend("zo1=0,7","zo2=0,4", "zo3=0,25", "zo4=0,1", "zo5=0,05")
% hold off;
% print('stpdod2wykres5.png','-dpng','-r400')