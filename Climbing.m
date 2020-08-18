%% �������ܼ���
close all
clear all
y=[];
k=1;
tt=0;
for i=0:500:3000
    H=i
    if H<500
        rou=1.22;
        a=340;
    elseif H<1000
        rou=0.95;
        a=338;
    elseif H<1500
        rou=0.9;
        a=336;
    elseif H<2000
        rou=0.85;
        a=334;
    elseif H<2500
        rou=0.8;
        a=332;
    elseif H<3000
        rou=0.75;
        a=330;
    else
        rou=0.7;
        a=328;
    end
    y(k,1)=i;
    N_ky=(-0.2*H+1800)*3
    zeta=0.84;
    kappa=0.93;
    rou_0=1.2;
    sigma=0.05;
    G=8000*9.8;
    R=9.5;
    Omega=38;
    p=8000/(pi*R^2);
    K_t=1+p/1000;
    f_f=1/2*rou*pi*R^2*(Omega*R)^2;
    C_T=K_t*G/f_f;
    k_t=0.96;
    C_x7=0.012;
    k_p=1.05;
    m_kx=1/4*sigma*k_p*C_x7;
    v_10=1/2*sqrt(C_T/kappa);
    J=1.18;
    m_ki=J*v_10*C_T;
    M1=Omega*R/a;
    M1jx=0.77;
    deltaM=M1-M1jx;
    i=0;
    m_kb=i*sigma;
    m_k=m_kx+m_ki+m_kb;
    f_n=(rou/rou_0)*pi*R^2*(Omega*R)^3/1200;
    Nxu_sj=f_n*m_k;
    N_xu=Nxu_sj/zeta
    y(k,2)=N_xu;%���ù���Required Power
    y(k,3)=N_ky;%Available Power
    deltaN=N_ky-N_xu;%Remaining Power
    y(k,7)=deltaN;%
    V_y1=7.5*zeta*kappa*deltaN/8000;
    y(k,4)=V_y1;%
    V_y2=V_y1*1.8;%
    y(k,5)=V_y2;%
    t=500/V_y2;%
    tt=t+tt;%
    y(k,6)=tt;%
    k=k+1;
end
%% Required Power ��ͼ
figure(1)
H = 0:500:3000;
plot(H,y(:,2),'-O','Color',[255/255, 195/255, 18/255],'LineWidth',1.5)%��
xlabel('Altitude/H(m)');ylabel('Power/N(kW)');
hold on
plot(H,y(:,3),'-^','Color',[196/255, 229/255, 56/255],'LineWidth',1.5)%��
plot(H,y(:,7),'-*','Color',[18/255, 203/255, 196/255],'LineWidth',1.5)%��
legend('Required Power','Available Power','Remaining Power')
set(gca,'FontSize',10)
% set(gca,'FontSize',13)
set(gca,'linewidth',1)
%%%%%%%%%%%%%%
hfig = figure(1)
figWidth = 8.1;  % ����ͼƬ��� 8.1\ 10
figHeight = 5;  % ����ͼƬ�߶� 5\ 6.18
set(hfig,'PaperUnits','centimeters'); % ͼƬ�ߴ����õ�λ
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout = ['Required Power.']; % ���ͼƬ���ļ���
print(hfig,[fileout,'tif'],'-r300','-dtiff'); % ����ͼƬ��ʽ���ֱ���
%%%%%%%%%%%%%%%
%% Climb Rate of Vertical
figure(2)
% H = 0:500:3000;
plot(H,y(:,5),'-o','Color',[253/255, 167/255, 223/255],'LineWidth',1.5)%��
xlabel('Altitude/H(m)');ylabel('Climb Rate of Vertical/V_y(m/s)');
set(gca,'FontSize',10)
% set(gca,'FontSize',13)
set(gca,'linewidth',1)
ylim=get(gca,'Ylim'); % ��ȡ��ǰͼ�ε�����ķ�Χ
hold on
plot([0,3000],[0.5,0.5],'--','Color',[237/255, 76/255, 103/255],'LineWidth',1.5); % ����x=1��ֱ��
%%%%%%%%%%%%%%
hfig = figure(2)
figWidth = 8.1;  % ����ͼƬ��� 8.1\ 10
figHeight = 5;  % ����ͼƬ�߶� 5\ 6.18
set(hfig,'PaperUnits','centimeters'); % ͼƬ�ߴ����õ�λ
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout = ['Climb Rate of Vertical.']; % ���ͼƬ���ļ���
print(hfig,[fileout,'tif'],'-r300','-dtiff'); % ����ͼƬ��ʽ���ֱ���
%%%%%%%%%%%%%%%
%% Rise Time
figure(3)
% H = 0:500:3000;
plot(H,y(:,6),'-O','Color',[0.25 0.41 0.88],'LineWidth',1.5)%��
xlabel('Altitude/H(m)');ylabel('Rise Time/T(s)');
set(gca,'FontSize',10)
% set(gca,'FontSize',13)
set(gca,'linewidth',1)
%%%%%%%%%%%%%%
hfig = figure(3)
figWidth = 7.2816;  % ����ͼƬ��� 8.1\ 10
figHeight = 4.5;  % ����ͼƬ�߶� 5\ 6.18
set(hfig,'PaperUnits','centimeters'); % ͼƬ�ߴ����õ�λ
set(hfig,'PaperPosition',[0 0 figWidth figHeight]);
fileout = ['Rise Time.']; % ���ͼƬ���ļ���
print(hfig,[fileout,'tif'],'-r300','-dtiff'); % ����ͼƬ��ʽ���ֱ���
%%%%%%%%%%%%%%%

