import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import swal from "sweetalert";

const ProductShop = () => {
    const [products, setProducts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage] = useState(6); // Số lượng sản phẩm trên mỗi trang

    const search = window.location.pathname;
    let slug = search.split("/").slice(-1).pop();
    if (slug === "shop") {
        slug = [""];
    }

    useEffect(() => {
        axios
            .get(`/products/${slug}`)
            .then((res) => {
                if (res.status === 200) {
                    setProducts(res.data.products);
                }
                setLoading(false);
            })
            .catch((error) => {
                setError(error.response.statusText);
                setLoading(false);
            });
    }, []);

    const addToCart = (e, productId) => {
        e.preventDefault();

        axios.post("/carts", { productId }).then((res) => {
            if (res.status === 200) {
                swal("Success", "Added to Cart !", "success");
                window.location.reload();
            }
        });
    };

    const sorting = (sortingBy) => {
        axios
            .get(`/products/${slug}?sortingBy=${sortingBy}`)
            .then((res) => {
                if (res.status === 200) {
                    setProducts(res.data.products);
                }
                setLoading(false);
            })
            .catch((error) => {
                setError(error.response.statusText);
                setLoading(false);
            });
    };

    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    const indexOfLastProduct = currentPage * productsPerPage;
    const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
    const currentProducts = products.slice(indexOfFirstProduct, indexOfLastProduct);

    const Pagination = ({ productsPerPage, totalProducts, paginate }) => {
        const pageNumbers = [];
    
        for (let i = 1; i <= Math.ceil(totalProducts / productsPerPage); i++) {
            pageNumbers.push(i);
        }
    
        return (
            <nav>
                <ul className="pagination justify-content-center">
                    <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
                        <a className="page-link" href="#" onClick={() => paginate(currentPage - 1)}>&laquo; Trước</a>
                    </li>
                    {pageNumbers.map((number) => (
                        <li key={number} className={`page-item ${currentPage === number ? 'active' : ''}`}>
                            <a onClick={() => paginate(number)} href="#" className="page-link">
                                {number}
                            </a>
                        </li>
                    ))}
                    <li className={`page-item ${currentPage === pageNumbers.length ? 'disabled' : ''}`}>
                        <a className="page-link" href="#" onClick={() => paginate(currentPage + 1)}>Sau &raquo;</a>
                    </li>
                </ul>
            </nav>
        );
    };

    return (
        <>
            <div className="filter__item">
                <div className="row">
                    <div className="col-lg-4 col-md-5">
                        <form method="get">
                            <div
                                className="filter__sort"
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    columnGap: ".5rem",
                                }}
                            >
                                <label>Sắp xếp theo :</label>
                                <select
                                    name="sortingBy"
                                    style={{ width: "150px" }}
                                    className="form-control"
                                    onChange={(e) => sorting(e.target.value)}
                                >
                                    <option value="default">
                                        Mặc định
                                    </option>
                                    <option value="popularity">
                                        Phổ biến
                                    </option>
                                    <option value="low-high">
                                        Giá: Thấp tới Cao
                                    </option>
                                    <option value="high-low">
                                        Giá: Cao tới Thấp
                                    </option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div className="col-lg-4 col-md-4">
                        <div className="filter__found">
                            <h6>
                                <span>{products.length}</span> Sản phẩm tìm thấy
                            </h6>
                        </div>
                    </div>
    
                    <div className="col-lg-4 col-md-3">
                        <div className="filter__option">
                            <span className="icon_grid-2x2"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div className="product-shop-wrapper">
                <div className="row">
                    {loading ? (
                        <h3>Loading...</h3>
                    ) : error === "Not Found" ? (
                        <h3>Không tìm thấy !</h3>
                    ) : products.length === 0 ? (
                        <h3>Không tìm thấy !</h3>
                    ) : (
                        <>
                            {currentProducts.map((product) => (
                                <div key={product.id} className="col-lg-4 col-md-6 col-sm-6">
                                    <div className="product__item">
                                        <div className="product__item__pic" style={{backgroundImage: `url(${product.media[0].original_url})`}}>
                                            <ul className="product__item__pic__hover">
                                                <li><a href="#"><i className="fa fa-heart"></i></a></li>
                                                <li><a href="#" onClick={(e) => addToCart(e, product.id)}><i className="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div className="product__item__text">
                                            <h6><a href={`/product/${product.slug}`}>{product.name}</a></h6>
                                            <h5>{product.price} vnđ</h5>
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </>
                    )}
                </div>
                <div className="d-flex justify-content-center mt-3">
                    <Pagination productsPerPage={productsPerPage} totalProducts={products.length} paginate={paginate} />
                </div>
            </div>
        </>
    );
    
};

export default ProductShop;

if (document.getElementById("product-shop")) {
    ReactDOM.render(<ProductShop />, document.getElementById("product-shop"));
}
