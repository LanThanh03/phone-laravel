import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
const formatPrice = (price) => {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
const Checkout = () => {
    const [carts, setCarts] = useState([]);
    const [total, setTotal] = useState(0);
    const [provinces, setProvinces] = useState([]);
    const [cities, setCities] = useState([]);
    const [services, setServices] = useState([]);
    const [loading, setLoading] = useState(true);
    const [wait, setWait] = useState(false);
    const [fullName, setFullName] = useState("");
    const [province, setProvince] = useState("");
    const [city, setCity] = useState("");
    //const [shippingService, setShippingService] = useState("");
    const [address, setAddress] = useState("");
    const [address2, setAddress2] = useState("");
    const [postcode, setPostcode] = useState("");
    const [phone, setPhone] = useState("");
    const [email, setEmail] = useState("");
    const [notes, setNotes] = useState("");

    useEffect(() => {
        axios.get("/carts").then((res) => {
            if (res.status === 200) {
                setCarts(Object.values(res.data.carts));
                setTotal(res.data.cart_total);
            }
            setLoading(false);
        });

       /* axios.get("/api/provinces").then((res) => {
            if (res.status === 200) {
                setProvinces(Object.values(res.data.provinces));
            }
            setLoading(false);
        }); */
        axios.get("/api/users").then((res) => {
            if (res.status === 200) {
                setFullName(
                    res.data.users.username == null
                        ? ""
                        : res.data.users.username
                );
                setProvince(
                    res.data.users.province == null
                        ? ""
                        : res.data.users.province
                );
                setCity(
                    res.data.users.city == null ? "" : res.data.users.city
                );
                setAddress(
                    res.data.users.address == null ? "" : res.data.users.address
                );
                setAddress2(
                    res.data.users.address2 == null
                        ? ""
                        : res.data.users.address2
                );
                setPostcode(
                    res.data.users.postcode == null
                        ? ""
                        : res.data.users.postcode
                );
                setPhone(
                    res.data.users.phone == null ? "" : res.data.users.phone
                );
                setEmail(
                    res.data.users.email == null ? "" : res.data.users.email
                );
                setNotes(
                    res.data.users.notes == null ? "" : res.data.users.notes
                );
            }
            setLoading(false);
        });
    }, []);

    /*const setProvinceId = (provinceId) => {
        setProvince(provinceId);
        axios.get(`/api/cities?provinceId=${provinceId}`).then((res) => {
            if (res.status === 200) {
                setCities(res.data.cities);
            }
            setLoading(false);
        });
    };

    const setCityId = (city) => {
        setCity(city);
        setWait(true);
        axios.get(`/api/shipping-cost?city=${city}`).then((res) => {
            setServices(res.data.results);
            setLoading(false);
            setWait(false);
        });
    };

    const setShippingCostId = (service) => {
        setShippingService(service);
        setWait(true);
        const cityId = document.getElementById("city").value;

        axios
            .post(`/api/set-shipping`, {
                shipping_service: service,
                city_id: cityId,
            })
            .then((res) => {
                setTotal(res.data.data.total);
                setLoading(false);
                setWait(false);
            });
    }; */

    const placeOrder = (e) => {
        e.preventDefault();
        // Kiểm tra các trường thông tin bắt buộc trước khi gửi yêu cầu đặt hàng
        if (!fullName || !province || !city || !address || !phone || !email) {
            // Hiển thị thông báo lỗi và không tiến hành đặt hàng
            alert("Vui lòng điền đủ thông tin để tiếp tục đặt hàng.");
            return;
        }
        // Nếu các trường thông tin đều được điền, tiến hành gửi yêu cầu đặt hàng
        setWait(true);
        axios
            .post(`/api/checkout`, {
                fullName,
                province,
                city,
                /*shippingService,*/
                address,
                /*address2,
                postcode,*/
                phone,
                email,
                notes,
            })
            .then((res) => {
                swal("Thành công", "Đặt hàng thành công!", "success");
                setTotal(0);
                window.location.href = res.data.testemail;
                window.location.href = '/';
                return null;
            });
    };

    return (
        <>
            <div className="checkout__htmlForm">
                <h4 className="mb-5">Chi tiết đơn hàng</h4>
                <form action="{{ route('order.store') }}" method="POST" onSubmit={placeOrder}>
                    <div className="row">
                        <div className="col-lg-8 col-md-6">
                            <div className="row">
                                <div className="col-lg-12">
                                    <div className="checkout__input">
                                        <p>
                                            Họ và tên<span>*</span>
                                        </p>
                                        <input
                                            type="text"
                                            value={fullName}
                                            onChange={(e) =>
                                                setFullName(e.target.value)
                                            }
                                        />
                                    </div>
                                </div>
                            </div>
                            <div className="checkout__input">
                                <p>
                                    Tỉnh/Thành phố<span></span>
                                </p>
                                <input
                                    className="form-control"
                                    type="text"
                                    value={province}
                                    onChange={(e) =>
                                        setProvince(e.target.value)
                                    }
                                >
                                   {/* <option value="">=== Choose ===</option>
                                    {provinces.map((province, index) => {
                                        return (
                                            <option
                                                key={index}
                                                value={index + 1}
                                            >
                                                {province}
                                            </option>*
                                        );
                                    })} */}
                                </input>
                            </div>
                            <div className="checkout__input">
                                <p>
                                    Huyện/Quận<span></span>
                                </p>
                                <input
                                    id="city"
                                    className="form-control"
                                    value={city}
                                    onChange={(e) => setCity(e.target.value)}
                                >
                                    {/*<option value="">=== Choose ===</option>
                                    {Object.entries(cities).map(
                                        (city, index) => {
                                            return (
                                                <option
                                                    key={index}
                                                    value={city[0]}
                                                >
                                                    {city[1]}
                                                </option>
                                            );
                                        }
                                    )} */}
                                </input>
                            </div>
                            {/*
                            <div className="checkout__input">
                                <p>
                                    Shipping Service<span></span>
                                </p>
                                <select
                                    className="form-control"
                                    value={shippingService}
                                    onChange={(e) =>
                                        setShippingCostId(e.target.value)
                                    }
                                >
                                    <option value="">=== Choose ===</option>
                                    {services.map((service, index) => {
                                        return (
                                            <option
                                                key={index}
                                                value={service.service.replace(
                                                    /\s/g,
                                                    ""
                                                )}
                                            >{`${service.service} | ${service.cost} | ${service.etd} `}</option>
                                        );
                                    })}
                                </select>
                            </div>
                                */}
                            <div className="checkout__input">
                                <p>
                                    Địa chỉ<span>*</span>
                                </p>
                                <input
                                    placeholder="Street Address"
                                    className="checkout__input__add"
                                    type="text"
                                    value={address}
                                    onChange={(e) => setAddress(e.target.value)}
                                />
                                {/*
                                <input
                                    type="text"
                                    value={address2}
                                    onChange={(e) =>
                                        setAddress2(e.target.value)
                                    }
                                    placeholder="Apartment, suite, unite ect (optinal)"
                                /> */}
                            </div>
                            {/*
                            <div className="checkout__input">
                                <p>
                                    Postcode / ZIP<span>*</span>
                                </p>
                                <input
                                    type="text"
                                    value={postcode}
                                    onChange={(e) =>
                                        setPostcode(e.target.value)
                                    }
                                />
                            </div>
                            */}
                            <div className="row">
                                <div className="col-lg-6">
                                    <div className="checkout__input">
                                        <p>
                                            Số điện thoại<span>*</span>
                                        </p>
                                        <input
                                            type="text"
                                            value={phone}
                                            onChange={(e) =>
                                                setPhone(e.target.value)
                                            }
                                        />
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="checkout__input">
                                        <p>
                                            Email<span>*</span>
                                        </p>
                                        <input
                                            type="text"
                                            value={email}
                                            onChange={(e) =>
                                                setEmail(e.target.value)
                                            }
                                        />
                                    </div>
                                </div>
                            </div>
                            <div className="checkout__input">
                                <p>
                                    Ghi chú<span>*</span>
                                </p>
                                <input
                                    type="text"
                                    value={notes}
                                    onChange={(e) => setNotes(e.target.value)}
                                    placeholder="Ghi chú"
                                />
                            </div>
                        </div>
                        <div className="col-lg-4.5 col-md-7">
                            <div className="checkout__order">
                                <h4>Đơn hàng của bạn</h4>
                                <div className="checkout__order__products">
                                    Sản phẩm <span>Tổng </span>
                                </div>
                                <ul>
                                    {loading ? (
                                        <h3>Loading...</h3>
                                    ) : (
                                        carts.map((cart, index) => {
                                            return (
                                                <li key={index}>
                                                    {cart.name} ({cart.quantity}{" "}
                                                    x {cart.price})
                                                    <span>
                                                    {formatPrice(cart.price *
                                                            cart.quantity)}đ
                                                    </span>
                                                </li>
                                            );
                                        })
                                    )}
                                </ul>
                                <div className="checkout__order__total">
                                    Tổng tiền <span>{formatPrice(total)}đ</span>
                                </div>
                                {/*{wait ? (
                                    <button
                                        type="submit"
                                        className="site-btn disabled"
                                    >
                                        Loading....
                                    </button>
                                ) : ( */}
                                    <button type="submit" className="site-btn">
                                    ĐẶT HÀNG
                                    </button>
                               {/* )}*/}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </>
    );
};

export default Checkout;

if (document.getElementById("checkout")) {
    ReactDOM.render(<Checkout />, document.getElementById("checkout"));
}
