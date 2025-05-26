export const roadmapData = {
  personalInfo: {
    name: "瞿敏",
    title: "UI/UX设计师 · 工业设计工程硕士",
    subtitle: "2026届硕士生 · 中共党员",
    email: "2217476349@qq.com",
    phone: "17851087286",
    birthday: "2000.10.03",
    avatar: "/avatar.jpg" // 可以后续添加头像
  },
  stages: [
    {
      id: 'education',
      title: '教育背景',
      subtitle: 'Educational Background',
      icon: '🎓',
      color: '#2E86AB',
      description: '扎实的学术基础与专业技能培养',
      modules: [
        {
          id: 'master-degree',
          title: '南京理工大学 · 硕士研究生',
          period: '2023.09 — 2026.04',
          items: [
            {
              name: '设计艺术与传媒学院',
              details: ['工业设计工程 — 硕士', '连续两年获得一等学业奖学金（前20%）', '2023-2024年南京理工大学优秀研究生（前10%）']
            },
            {
              name: '核心课程',
              details: ['整合创新设计', '数字媒体与信息技术', '人机工程设计', '设计数据处理与分析']
            }
          ]
        },
        {
          id: 'bachelor-degree',
          title: '河海大学 · 本科',
          period: '2019.09 — 2023.06',
          items: [
            {
              name: '机电工程学院',
              details: ['工业设计 — 本科', '获评河海大学优秀毕业生（前2%）', '获得11项荣誉称号 + 16项奖学金']
            },
            {
              name: '核心课程',
              details: ['程序设计语言', '机械设计基础', '产品设计模型', '工程图学', '计算机辅助设计', '交互设计', '产品服务体系设计']
            }
          ]
        }
      ],
      techStack: ['工业设计', '交互设计', 'UI/UX设计', '数字媒体技术'],
      duration: '本硕211',
      output: ['扎实理论基础', '丰富实践经验', '多项荣誉奖励']
    },
    {
      id: 'research',
      title: '科研经历',
      subtitle: 'Research Experience',
      icon: '🔬',
      color: '#A23B72',
      description: '丰富的学术研究与创新实践经验',
      modules: [
        {
          id: 'publications',
          title: '学术成果',
          items: [
            {
              name: '论文发表',
              details: ['发表1篇EI会议论文', '1篇科技核心论文', '2篇省级期刊论文', '录用1篇北大核心论文', '投稿1篇会议论文']
            },
            {
              name: '专利成果',
              details: ['授权外观专利5项', '授权发明专利3项']
            }
          ]
        },
        {
          id: 'projects',
          title: '科研项目',
          items: [
            {
              name: '国家级项目',
              details: ['参与1项国家自然科学基金面上项目', '参与1项江苏省自然科学基金面上项目']
            },
            {
              name: '创新创业',
              details: ['参与4项校级大学生创新创业项目', '获得3项优秀结题', '参与1项校企合作横向课题']
            }
          ]
        }
      ],
      techStack: ['学术研究', '专利申请', '项目管理', '创新设计'],
      duration: '国家自然科学基金项目等',
      output: ['多篇学术论文', '8项专利授权', '多个项目结题']
    },
    {
      id: 'work-experience',
      title: '工作经历',
      subtitle: 'Work Experience',
      icon: '💼',
      color: '#F18F01',
      description: '丰富的UI设计与产品开发实践经验',
      modules: [
        {
          id: 'tianhe-solar',
          title: '天合光能股份有限公司',
          position: 'UI设计师/合作研究',
          period: '2023.07—2023.08, 2024.06—2025.01',
          items: [
            {
              name: '大屏看板UI设计与改版',
              details: ['主导20+套大屏看板UI设计与改版项目', '与业务部门对接业务需求', '借助AI工具收集分析信息，梳理优秀设计方案、用户反馈及前沿趋势', '利用Midjourney生成情绪板、图标组件等，提升设计效率']
            },
            {
              name: '森大屏平台看板设计与开发',
              details: ['负责森大屏平台上的看板设计与开发工作', '前期与业务部门对接需求，方案确定后与物联部门对接数据接口信息', '在森大屏平台进行看板开发，提前完成看板上线']
            },
            {
              name: 'ThingJS数字孪生平台UI设计与建模',
              details: ['参与UI界面设计，承担部分场景和设备建模工作', '对接场景、设备、材质、灯光等设计细节', '打造逼真数字孪生工厂']
            },
            {
              name: '网站UI设计与优化',
              details: ['参与公司业务集成化平台—Mom网站UI设计与优化', '全面剖析业务架构、功能及用户定位']
            }
          ]
        },
        {
          id: 'cloudwalk',
          title: '云从科技集团股份有限公司',
          position: 'UI设计实习生',
          period: '2025.04至今',
          items: [
            {
              name: '知识中台项目UI界面改版',
              details: ['负责知识中台—今世缘设备数智化平台AI智能助手小缘的UI设计与优化', '对今世缘战略能力分解矩阵图进行视觉优化', '优化云从科技CWOS人机协同操作系统中知识中台的架构并进行系统界面UI改版']
            },
            {
              name: 'AI智能标书平台UI设计与优化',
              details: ['负责AI智能标书平台中智能核标业务模块的UI设计', '并通过竞品分析梳理出UI交互手册', '同步优化AI智与业务模块的UI界面']
            }
          ]
        }
      ],
      techStack: ['UI/UX设计', 'Figma', 'Midjourney', 'ThingJS', '数字孪生', 'AI工具'],
      duration: '中国500强公司实习、AI上市公司实习',
      output: ['20+设计项目', '多平台UI优化', '数字孪生应用']
    },
    {
      id: 'achievements',
      title: '获奖成果',
      subtitle: 'Awards & Achievements',
      icon: '🏆',
      color: '#C73E1D',
      description: '在设计类、数学建模类、计算机设计类等多领域竞赛中荣获众多国际、国家和省级奖项',
      modules: [
        {
          id: 'international-awards',
          title: '国际/国家级奖项 (14项)',
          items: [
            {
              name: '2022年重要奖项',
              details: ['美国IDEA奖Finalist优胜奖', '美国大学生数学建模大赛二等奖', '全国大学生工业设计大赛铜奖']
            },
            {
              name: '2024年最新成果',
              details: ['米兰设计周中国高校设计学科师生优秀作品展国家级一等奖等']
            }
          ]
        },
        {
          id: 'provincial-awards',
          title: '省部级奖项 (31项)',
          items: [
            {
              name: '设计竞赛类',
              details: ['"新大陆杯"2022年江苏省大学生计算机设计大赛三等奖', '2022年全国三维数字化创新设计大赛精英联赛江苏赛区特等奖', '第十五届蓝桥杯全国软件和信息技术专业人才大赛省级三等奖']
            },
            {
              name: '综合竞赛类',
              details: ['2022年第六届全国大学生工业设计大赛江苏赛区特等奖', '2022年第八届"LSCAT"杯江苏省笔译大赛汉译英本科组一等奖', '第十四届全国大学生广告艺术大赛江苏赛区二等奖', '第十八届中国好创意暨全国数字艺术设计大赛省级三等奖等']
            }
          ]
        }
      ],
      techStack: ['设计竞赛', '数学建模', '计算机设计', '创新创业'],
      duration: '获奖45+项',
      output: ['45项各级奖项', '国际认可', '专业能力证明']
    },
    {
      id: 'social-practice',
      title: '社会实践',
      subtitle: 'Social Practice',
      icon: '🌟',
      color: '#8E44AD',
      description: '积极参与学生工作与社会实践活动',
      modules: [
        {
          id: 'student-leadership',
          title: '学生干部经历',
          items: [
            {
              name: '河海大学机电工程学院',
              details: ['科学与技术协会副主席', '科学与技术协会创意设计部部长']
            }
          ]
        }
      ],
      techStack: ['组织管理', '团队协作', '活动策划', '领导能力'],
      duration: '学生组织部长、副主席',
      output: ['组织能力提升', '团队管理经验', '社会责任感']
    }
  ]
};
