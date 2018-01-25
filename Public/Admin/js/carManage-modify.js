var carMap={
            "中国": ["江南四大才子", "初唐四杰", "战国四君子"],
            "日本": ["日本武将", "日本城堡", "幕府时代"],
            "欧美": ["三大骑士团", "三大魔幻小说", "七大奇迹"],
            "江南四大才子": ["祝枝山", "文征明", "唐伯虎", "周文宾"],
            "初唐四杰": ["王勃", "杨炯", "卢照邻", "骆宾王"],
            "战国四君子": ["楚国春申君黄歇", "齐国孟尝君田文", "赵国平原君赵胜", "魏国信陵君魏无忌"],
            "日本武将": ["织田信长", "德川家康", "丰臣秀吉"],
            "日本城堡": ["安土城", "熊本城", "大坂城", "姬路城"],
            "幕府时代": ["镰仓", "室町", "丰臣", "江户"],
            "三大骑士团": ["圣殿骑士团", "医院骑士团", "条顿骑士团"],
            "三大魔幻小说": ["冰与火之歌", "时光之轮", "荆刺与白骨之王国"],
            "七大奇迹": ["埃及胡夫金字塔", "奥林匹亚宙斯巨像", "阿尔忒弥斯月神殿", "摩索拉斯陵墓", "亚历山大港灯塔", "巴比伦空中花园", "罗德岛太阳神巨像"]
        }
        var departmentMap={
            "中国": ["江南四大才子", "初唐四杰", "战国四君子"],
            "日本": ["日本武将", "日本城堡", "幕府时代"],
            "欧美": ["三大骑士团", "三大魔幻小说", "七大奇迹"],
            "江南四大才子": ["祝枝山", "文征明", "唐伯虎", "周文宾"],
            "初唐四杰": ["王勃", "杨炯", "卢照邻", "骆宾王"],
            "战国四君子": ["楚国春申君黄歇", "齐国孟尝君田文", "赵国平原君赵胜", "魏国信陵君魏无忌"],
            "日本武将": ["织田信长", "德川家康", "丰臣秀吉"],
            "日本城堡": ["安土城", "熊本城", "大坂城", "姬路城"],
            "幕府时代": ["镰仓", "室町", "丰臣", "江户"],
            "三大骑士团": ["圣殿骑士团", "医院骑士团", "条顿骑士团"],
            "三大魔幻小说": ["冰与火之歌", "时光之轮", "荆刺与白骨之王国"],
            "七大奇迹": ["埃及胡夫金字塔", "奥林匹亚宙斯巨像", "阿尔忒弥斯月神殿", "摩索拉斯陵墓", "亚历山大港灯塔", "巴比伦空中花园", "罗德岛太阳神巨像"]
        }
         //avalon控制模块  
         avalon.define("avalonCon", function(vm) {
            //车型
            vm.carFirst = ["中国", "日本", "欧美"]
            vm.carSecond = carMap[vm.carFirst[1]].concat()
            vm.carThird = carMap[vm.carSecond[0]].concat()
            vm.carFirstSelected = "日本"
            vm.carSecondSelected = "日本武将"
            vm.carThirdSelected = "织田信长" 
            vm.$watch("carFirstSelected", function(a) {
                vm.carSecond = carMap[a].concat()
                vm.carSecondSelected = vm.carSecond[0]
            })
            vm.$watch("carSecondSelected", function(a) {
                vm.carThird = carMap[a].concat()
                vm.carThirdSelected = vm.carThird[0]
            })

            //部门
            vm.departmentFirst = ["中国", "日本", "欧美"]
            vm.departmentSecond = departmentMap[vm.departmentFirst[1]].concat()
            vm.departmentThird = departmentMap[vm.departmentSecond[0]].concat()
            vm.departmentFirstSelected = "日本"
            vm.departmentSecondSelected = "日本武将"
            vm.departmentThirdSelected = "织田信长" 
            vm.$watch("departmentFirstSelected", function(a) {
                vm.departmentSecond = departmentMap[a].concat()
                vm.departmentSecondSelected = vm.departmentSecond[0]
            })
            vm.$watch("departmentSecondSelected", function(a) {
                vm.departmentThird = departmentMap[a].concat()
                vm.departmentThirdSelected = vm.departmentThird[0]
            })
        })
        avalon.scan();