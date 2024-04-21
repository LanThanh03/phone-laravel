<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Comment;
use Illuminate\Http\Request;

class ProductController extends Controller
{

    public function show(Request $request, Product $product)
    {
        $cartTotal = \Cart::getTotal();
        $cartCount = \Cart::getContent()->count();

        $related_products = Product::whereHas('category', function ($query) use ($product) {
            $query->whereId($product->category_id);
        })
            ->where('id', '<>', $product->id)
            ->inRandomOrder()
            ->take(4)
            ->get(['id', 'slug', 'name', 'price']);
           $comments = Comment::where('product_id', $product->id)->OrderBy('id','DESC')->get();
        return view('frontend.product.show', compact('product','comments', 'related_products', 'cartTotal', 'cartCount'));
    }

    public function getProductDetail(Product $product){

        return response()->json([
            'status' => 200,
            'product' => $product,
        ]);
    }
    public function postcomment(Request $request, $id){
   
        // Lấy nội dung bình luận từ request
        $commentContent = $request->input('content');
 
        // Tạo bình luận mới và lưu vào cơ sở dữ liệu
        $comment = new Comment();
        $comment->product_id = $id;
        $comment->user_id = auth()->user()->id;
        $comment->content = $commentContent;
        $comment->save();

        return redirect()->back()->with('success', 'Bình luận của bạn đã được gửi thành công.');
   
    }
 
}
