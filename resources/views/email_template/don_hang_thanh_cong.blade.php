<html>
    <head>
        <style>
            .book-table
            {
                border-collapse:collapse;
            }
            .book-table tr th
            {
                text-align:center;
            }
            .book-table tr th, .book-table tr td
            {
                border:1px solid #000;
                padding:3px;
            }
        </style>
    </head>
    <body>
    @php
    $customer_first_name = isset($data[0]->customer_first_name) ? $data[0]->customer_first_name : '';
@endphp

<div>
    <p>Hi <span style="font-weight: bold; color: red;">{{$customer_first_name}}</span>, PHONE STORE gửi bạn chi tiết đơn hàng:</p>
</div>
    <div style='text-align:center;font-weight:bold;color:#15c;'>
        THÔNG TIN ĐƠN HÀNG
    </div>
    <table class='book-table' style='margin:0 auto; width:70%'>
        <thead>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Tổng tiền</th>
        </thead>
        <tbody>
            @foreach($data as $key=>$row)
                <tr>
                    <td align='center'>{{$key+1}}</td>
                    <td>{{$row->name}}</td>
                    <td>{{$row->qty}}</td>
                    <td>{{number_format($row->sub_total,0,',','.')}}đ</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    @php
    $grand_total = isset($data[0]->grand_total) ? $data[0]->grand_total : '';
@endphp

<div>
    <p>Tổng giá trị đơn hàng: <span style="font-weight: bold; color: red;">{{ number_format($grand_total, 0, ',', '.') }}đ</span></p>
</div>
</body>
</html>