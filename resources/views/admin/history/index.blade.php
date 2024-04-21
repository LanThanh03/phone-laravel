@extends('layouts.admin')

@section('content')
        <div class="card">
            <div class="card-header">
                <h3>LỊCH SỬ MUA HÀNG </h3> 
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered" id = "history-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Khách Hàng</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng</th>
                                <th>Tổng Tiền</th>
                                <th>Thành Phố/ Tỉnh</th>
                                <th>Quận/ Huyện</th>
                                <th>Địa Chỉ</th>
                                <th>Số Điện Thoại</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($history as $history)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $history->customer_first_name }}</td>
                                    <td>{{ $history->name }}</td>
                                    <td>{{ $history->qty }}</td>
                                    <td>{{ number_format($history->base_total) }}vnđ</td>
                                    <td>{{ $history->customer_city }}</td>
                                    <td>{{ $history->customer_province}}</td>
                                    <td>{{ $history->customer_address}}</td>
                                    <td>{{ $history->customer_phone }}</td>
                                    <td>{{ $history->customer_email }}</td>
                                                               
                                 </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
    <script>
        new DataTable('#history-table');
    </script>
@endsection