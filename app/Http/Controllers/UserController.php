<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Tag;
use Barryvdh\DomPDF\Facade\Pdf;

class UserController extends Controller
{
    public function index()
    {
        $users = auth()->user();
        
        return response()->json([
            'users' => $users,
            'status' => 200
        ]);
    }
    public function export() 
    {
        return Excel::download(new UsersExport, 'product.xlsx');
    }
}

