@extends('layouts.admin')

@section('content')
    <div class="container">
    <x-filters />
        <div class="card">
            <div class="card-body">
                {{-- This Canvas is for the Chart --}}
                <canvas id="barChart" width = "300" height="600"></canvas>
            </div>
        </div>
    </div>
    </div>
    <script>
        $(".bar_Menu").addClass('active');
        let chart;

        function getData() {
            $.ajax({
                url: '/bar-chart-data',
                method: 'GET',
                dataType: 'json',
                data: {
                    'product': $("#product").val(),
                    'from': $("#from").val(),
                    'to': $("#to").val(),
                },
                success: function(data) {
                    const product = data.product;
                    const ProductData = data.ProductData;

                    const ctx = document.getElementById('barChart').getContext('2d');

                    if (chart) {
                        chart.destroy();
                    }

                    chart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['Tổng doanh thu'],
                            datasets: [{
                                label: `Tổng doanh thu của ${product}`,
                                data: [ProductData.sub_total.toLocaleString()] ,
                                backgroundColor: ['rgb(255,99,132)', 'rgb(75,192,192)', 'rgb(54,162,235)'],
                                borderWidth: 0.5,
                            }]
                        },
                        options: {
                            responsive: false,
                            maintainAspectRatio: true,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });

                },
                error: function(error) {
                    console.log(error);
                }
            })
        }

        $(function() {
            getData();
        });
    </script>
@endsection
