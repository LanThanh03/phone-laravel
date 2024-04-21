<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\ImageUploadingTrait;
use App\Http\Requests\Admin\ProductRequest;
use App\Models\Category;
use App\Models\Product;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HistoryController extends Controller
{
    public function index()
    {
        $history = DB::select ("SELECT o.id,o.customer_first_name, i.name, i.qty, i.base_total ,o.customer_phone, o.customer_city,o.customer_province,o.customer_address,o.customer_email FROM orders AS o  JOIN order_items AS i ON o.id = i.id WHERE o.id = i.id");

        return view('admin.history.index', compact('history'));
    }
    
}
