///
/// sourceData
/// 根据原始数据重新设计数据格式
/// 考虑到后期扩展性，数据结构统一
/// 考虑到后台编辑模板对前端操作的影响和模板编辑之后的对已有数据的处理
///
const List<Map<String, dynamic>> sourceData = [
  {
    'id': '1',
    'type': 'A',
    'title': '中途採用比率',
    'templates': [
      {
        'id': '11',
        'title': '前年度',
        'unit': '%',
        'hintText': '前年度中途採用比率',
      },
      {
        'id': '12',
        'title': '2年度前',
        'unit': '%',
        'hintText': '2年度前中途採用比率',
      },
      {
        'id': '13',
        'title': '3年度前',
        'unit': '%',
        'hintText': '3年度前中途採用比率',
      }
    ],
    'values': [
      {'11': '10%', '12': '20%', '13': '30%'}
    ]
  },
  {
    'id': '2',
    'type': 'A',
    'title': '中途採用比率2',
    'templates': [
      {
        'id': '21',
        'title': '前年度',
        'unit': '%',
        'hintText': '前年度中途採用比率',
      },
      {
        'id': '22',
        'title': '2年度前',
        'unit': '%',
        'hintText': '2年度前中途採用比率',
      },
      {
        'id': '23',
        'title': '3年度前',
        'unit': '%',
        'hintText': '3年度前中途採用比率',
      }
    ],
    'values': [
      {'21': '10%', '22': '20%', '23': '30%'}
    ]
  },
  {
    'id': '3',
    'type': 'B',
    'templates': [
      {
        'id': '31',
        'title': '正社員の平均継続勤務年数',
        'unit': '年',
      }
    ],
    'values': [
      {'31': '18.5年'}
    ]
  },
  {
    'id': '4',
    'type': 'B',
    'templates': [
      {
        'id': '41',
        'title': '従業員の平均年齢',
        'unit': '岁',
      }
    ],
    'values': [
      {'41': '50.5岁'}
    ]
  },
  {
    'id': '5',
    'type': 'B',
    'templates': [
      {
        'id': '51',
        'title': '月平均所定外労働時間',
        'unit': '時間',
      }
    ],
    'values': [
      {'51': '18時間'}
    ]
  },
  {
    'id': '6',
    'type': 'B',
    'templates': [
      {
        'id': '61',
        'title': '平均の法定時間外労働60時間以上の労働者の数',
        'unit': '人',
      }
    ],
    'values': [
      {'61': '15人'}
    ]
  },
  {
    'id': '7',
    'type': 'C',
    'title': '育児休業取得率（男性）',
    'templates': [
      {
        'id': '71',
        'title': '職種',
        'showPrompt': '1',
        'hintText': '職種を入力してください',
      },
      {
        'id': '72',
        'title': '割合',
        'unit': '%',
        'showPrompt': '1',
        'hintText': '割合を入力してください',
      }
    ],
    'values': [
      {'71': '正社員', '72': '34%'},
      {'71': '専門職', '72': '50%'},
    ],
  },
  {
    'id': '8',
    'type': 'C',
    'title': '育児休業取得率（女性）',
    'templates': [
      {
        'id': '81',
        'title': '職種',
        'showPrompt': '1',
        'hintText': '職種を入力してください',
      },
      {
        'id': '82',
        'title': '割合',
        'unit': '%',
        'showPrompt': '1',
        'hintText': '割合を入力してください',
      },
      {
        'id': '83',
        'title': 'aaa',
        'unit': '@',
        'showPrompt': '1',
        'hintText': 'xxx xxx xxx',
      },
    ],
    'values': [
      {'81': '正社員', '82': '34%', '83': '123@'},
      {'81': '専門職', '82': '50%', '83': '123@'}
    ],
  },
];
