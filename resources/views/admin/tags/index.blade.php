@extends('layouts.admin')

@section('content')
        <div class="card">
            <div class="card-header">
                <h3>DANH SÁCH TAG
                    <a href="{{ route('admin.tags.create') }}" class="btn btn-primary float-right">
                        Thêm mới
                    </a>
                </h3>     
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered"  id = "tag-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Tag</th>
                                <th>Nhãn</th>
                                <th>Số Lượng Tag</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($tags as $tag)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $tag->name }}</td>
                                    <td>{{ $tag->slug }}</td>
                                    <td>{{ $tag->products_count }}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="{{ route('admin.tags.edit', $tag->id) }}" class="btn btn-info">
                                                <i class="fa fa-pencil-alt"></i>
                                            </a>
                                            <form onclick="return confirm('are you sure ?');" action="{{ route('admin.tags.destroy', $tag->id) }}" method="post">
                                                @csrf 
                                                @method('delete')
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
    <script>
        new DataTable('#tag-table');
    </script>
@endsection