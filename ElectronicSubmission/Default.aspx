<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ElectronicSubmission.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Default-Title", "E-Admission - DashBoard") %></title>
    <script>
        function Pie_Chart(Data, Names) {
            var options = {
                series: Data,
                chart: {
                    height: 300,
                    width: 480,
                    type: 'pie',
                },
                labels: Names,
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {

                            height: 310,
                            width: 200,
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

            var chart = new ApexCharts(document.querySelector("#chart-Pie2"), options);
            setTimeout(function () { chart.render(); }, 1000);
        }

        function lineChart(Data, Status) {
            //alert("Data:" + Data+"\n Status:"+Status);
            var options = {
                series: [{
                    name: "<% = ElectronicSubmission.FieldNames.getFieldName("Default-Hour", "Hour") %>",
                    data: Data
                }],
                    chart: {
                        height: 350,
                        type: 'line',
                        zoom: {
                            enabled: false
                        }
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        curve: 'straight'
                    },
                    title: {
                        text: '',
                    align: 'left'
                },
                    grid: {
                        row: {
                            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                            opacity: 0.5
                        },
                    },
                    xaxis: {
                        categories: Status,
                    }
                };

            var chart = new ApexCharts(document.querySelector("#Linechart"), options);
            setTimeout(function () { chart.render(); }, 1000);


        }

        function Pie_ChartColumn(data, categories) {
            var options = {
                series: [{
                    name: '<% = ElectronicSubmission.FieldNames.getFieldName("Default-NewStudent", "New Student") %>',
                    data: data
                }],
                chart: {
                    height: 350,
                    type: 'bar',
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            position: 'top', // top, center, bottom
                        },
                    }
                },
                dataLabels: {
                    enabled: true,
                    formatter: function (val) {
                        return val + "#";
                    },
                    offsetY: -20,
                    style: {
                        fontSize: '12px',
                        colors: ["#304758"]
                    }
                },

                xaxis: {
                    categories: categories,
                    position: 'top',
                    axisBorder: {
                        show: false
                    },
                    axisTicks: {
                        show: false
                    },
                    crosshairs: {
                        fill: {
                            type: 'gradient',
                            gradient: {
                                colorFrom: '#D8E3F0',
                                colorTo: '#BED1E6',
                                stops: [0, 100],
                                opacityFrom: 0.4,
                                opacityTo: 0.5,
                            }
                        }
                    },
                    tooltip: {
                        enabled: true,
                    }
                },
                yaxis: {
                    axisBorder: {
                        show: false
                    },
                    axisTicks: {
                        show: false,
                    },
                    labels: {
                        show: false,
                        formatter: function (val) {
                            return val + " <% = ElectronicSubmission.FieldNames.getFieldName("Default-Record", "Record") %> ";
                        }
                    }

                },
                title: {
                    text: ' <% = ElectronicSubmission.FieldNames.getFieldName("Default-NumberOfRecordPerMounths", "Number Of Record Per Mounths") %> ',
                    floating: true,
                    offsetY: 330,
                    align: 'center',
                    style: {
                        color: '#444'
                    }
                }
            };

            var chart = new ApexCharts(document.querySelector("#chart_Column"), options);
            setTimeout(function () { chart.render(); }, 1000);

        }

        function PieChartSocial(Label,Data)
        {
            var options = {
                series: Data,
                chart: {
                    height: 300,
                    width: 480,
                    type: 'pie',
                },
                labels: Label,
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            height: 310,
                            width: 200,
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

            var chart = new ApexCharts(document.querySelector("#chart-Social"), options);
            setTimeout(function () { chart.render(); }, 1000);
        }

        setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1000);

    </script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <!-- treatment status, page counter  start -->
        <div class="col-xl-3 col-md-6">
            <a href="#">
                <div class="card bg-c-lite-green update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtAllStudents" Text="0" runat="server"></asp:Literal></h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-AllStudents", "All Students") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-1" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateOne" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="#">
                <div class="card bg-c-yellow update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtInProgress" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-InProgress", "In Progress") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-2" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateTwo" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="#">
                <div class="card bg-c-green update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtSuccessfully" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-Successfully", "Successfully") %> </h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-3" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateThree" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="#">
                <div class="card bg-c-pink update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtFailure" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-Failure", "Failure") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-4" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateFour" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <!-- treatment status, page counter  end -->
    </div>

    <div class="row">
        <!-- Chart start -->
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                     <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-DelayPerStatus", "Delay Per Status") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="Linechart" style="width: 100%;direction: ltr;"></div>
                </div>
            </div>
        </div>
       
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-RecordPerMounths", "Record Per Mounths") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="chart_Column" style="width: 100%;"></div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-RecordsPerStatus", "Records Per Status") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="chart-Pie2"></div>
                </div>

            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-TheSourceoftheInformation", "The Source of the Information") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="chart-Social"></div>
                </div>

            </div>
        </div>




    </div>

</asp:Content>
