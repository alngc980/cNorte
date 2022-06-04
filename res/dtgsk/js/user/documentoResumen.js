var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$(document).ready(function (e) {
    grafico();


});

function grafico() {
    if ($("#idKey").val() != "") {
        $.ajax({
            url: "./?r=user/grafico",
            Type: "POST",
            data: { "idKey": $("#idKey").val() },
            success: function (data) {
                debugger;
                obj = new Array();
                obj = JSON.parse(data);
                debugger;
                html = "";
                armagrafico(obj);
            }

        });
    } else {
        grafico();
    }
}

function armagrafico(obj) {
    var dom = document.getElementById("containerg");
    var myChart = echarts.init(dom);
    var app = {};

    var option;
    option = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            data: ['EPP', 'SE', 'UM', 'DOC', 'CP', 'CS']
        },
        series: [{
            name: 'TIT',
            type: 'pie',
            selectedMode: 'single',
            radius: [0, '45%'],
            label: {
                position: 'inner',
                fontSize: 12,
            },
            labelLine: {
                show: false
            },
            data: [{
                // value: trunc(obj.PORCENTAJESNC, 2),
                // name: 'NC ' + trunc(obj.PORCENTAJESNC, 2) + '%',
                // itemStyle: { color: 'green' },

                value: round(obj.PORCENTAJESNC),
                name: 'NC ' + round(obj.PORCENTAJESNC) + '%',
                itemStyle: { color: 'green' },
            },
            {
                // value: trunc(obj.PORCENTAJESNI, 2),
                // name: 'NI ' + trunc(obj.PORCENTAJESNI, 2) + '%',
                // itemStyle: { color: 'red' },

                value: round(obj.PORCENTAJESNI),
                name: 'NI ' + round(obj.PORCENTAJESNI) + '%',
                itemStyle: { color: 'red' },
            }
            ]
        },
        {
            mode: 'single',
            name: '',
            type: 'pie',
            radius: ['45%', '60%'],
            label: {
                alignTo: 'edge',
                //formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c} %',
                minMargin: 20,
                edgeDistance: 300,
                lineHeight: 15,
                rich: {
                    time: {
                        fontSize: 12,
                        color: '#999'
                    }
                }
            },
            labelLine: {
                length: 10,
            },
            // label: {
            //     formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
            //     backgroundColor: '#F6F8FC',
            //     borderColor: '#8C8D8E',
            //     borderWidth: 1,
            //     borderRadius: 4,
            //     rich: {
            //         a: {
            //             color: '#6E7079',
            //             lineHeight: 22,
            //             align: 'center'
            //         },
            //         hr: {
            //             borderColor: '#8C8D8E',
            //             width: '100%',
            //             borderWidth: 1,
            //             height: 0
            //         },
            //         b: {
            //             color: '#4C5058',
            //             fontSize: 14,
            //             fontWeight: 'bold',
            //             lineHeight: 33
            //         },
            //         per: {
            //             color: '#fff',
            //             backgroundColor: '#4C5058',
            //             padding: [3, 4],
            //             borderRadius: 4
            //         }
            //     }
            // },
            data: [{
                //value: trunc(obj.EPP == null ? 0 : (obj.EPP || 0), 2),
                value: round(obj.EPP == null ? 0 : (obj.EPP || 0)),
                name: 'EPP'
            },
            {
                //value: trunc(obj.SE == null ? 0 : (obj.SE || 0), 2),
                value: round(obj.SE == null ? 0 : (obj.SE || 0)),
                name: 'SE'
            },
            {
                //value: trunc(obj.UM == null ? 0 : (obj.UM || 0), 2),
                value: round(obj.UM == null ? 0 : (obj.UM || 0)),
                name: 'UM'
            },
            {
                //value: trunc(obj.DOC == null ? 0 : (obj.DOC || 0), 2),
                value: round(obj.DOC == null ? 0 : (obj.DOC || 0)),
                name: 'DOC'
            },
            {
                //value: trunc(obj.CP == null ? 0 : (obj.CP || 0), 2),
                value: round(obj.CP == null ? 0 : (obj.CP || 0)),
                name: 'CP'
            },
            {
                //value: trunc(obj.CS == null ? 0 : (obj.CS || 0), 2),
                value: round(obj.CS == null ? 0 : (obj.CS || 0)),
                name: 'CS'
            }
            ]
        }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
}

function round(num) {
    var m = Number((Math.abs(num) * 100).toPrecision(15));
    return Math.round(m) / 100 * Math.sign(num);
}

function trunc(x, posiciones = 0) {
    debugger;
    var s = x.toString()
    var l = s.length
    var decimalLength = s.indexOf('.') + 1

    if (l - decimalLength <= posiciones) {
        return x
    }
    // Parte decimal del número
    var isNeg = x < 0
    var decimal = x % 1
    var entera = isNeg ? Math.ceil(x) : Math.floor(x)
    // Parte decimal como número entero
    // Ejemplo: parte decimal = 0.77
    // decimalFormated = 0.77 * (10^posiciones)
    // si posiciones es 2 ==> 0.77 * 100
    // si posiciones es 3 ==> 0.77 * 1000
    var decimalFormated = Math.floor(
        Math.abs(decimal) * Math.pow(10, posiciones)
    )
    debugger;
    // Sustraemos del número original la parte decimal
    // y le sumamos la parte decimal que hemos formateado
    var finalNum = entera +
        ((decimalFormated / Math.pow(10, posiciones)) * (isNeg ? -1 : 1))
        debugger;
    return finalNum
}