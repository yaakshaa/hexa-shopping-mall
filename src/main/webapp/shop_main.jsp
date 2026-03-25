<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.itwill.shop.member.Member" %>

<!DOCTYPE html>

<html lang="ko">

<head>

    <title>HexaShop</title>

    <jsp:include page="include_common_top.jsp" />



    <style>

        .admin-actions {

            display: flex;

            justify-content: center;

            gap: 20px;

            margin-top: 40px;

        }



        .admin-button {

            padding: 12px 28px;

            background-color: #2c3e50;

            color: white;

            border: none;

            border-radius: 8px;

            font-size: 1rem;

            font-weight: 500;

            cursor: pointer;

            transition: background-color 0.3s ease, transform 0.2s ease;

        }



        .admin-button:hover {

            background-color: #34495e;

            transform: translateY(-2px);

        }



        .admin-button:active {

            transform: scale(0.98);

        }

        /*
      **** carousel-wrapper 시작 ****
    */

        /* 1.전체틀*/
        .carousel-wrapper {
            overflow: hidden;
            width: 90%;
            margin: auto;
        }

        /* 2.전체틀 조건*/
        .carousel-wrapper * {
            box-sizing: border-box;
        }

        /***************************************/

        .carousel {
            -webkit-transform-style: preserve-3d;
            -moz-transform-style: preserve-3d;
            transform-style: preserve-3d;
            height: 500px;
        }

        /*
      **** ccarousel_item 시작 ****
    */
        /* 1.기본틀 */
        .carousel_item {
            opacity: 0;
            position: absolute;
            top: 0;
            width: 100%;
            margin: auto;
            padding: 1rem 4rem;
            z-index: 100;
            transition: transform 0.5s, opacity 0.5s, z-index 0.5s;
        }

        /* 1.active시 기본틀 */
        .carousel_item.active {
            opacity: 1;
            position: relative;
            z-index: 900;
        }

        /* 2. 가상클래스 공통영역 적용: prev, next 버튼시 */
        .carousel_item .prev,
        .carousel_item .next {
            z-index: 800;
        }

        /* 2. 가상클래스 perv적용 */
        .carousel_item.prev {
            transform: translateX(-100%);
        }

        /* 2. 가상클래스 next적용 */
        .carousel_item.next {
            transform: translateX(100%);
        }

        /***************************************/


        /*
          **** carousel_button 시작  ****
        */

        /* 1.버튼틀 */
        .carousel_button--prev,
        .carousel_button--next {
            position: absolute;
            top: 50%;
            width: 3rem;
            height: 3rem;
            background-color: #fff;
            transform: translateY(-50%);
            border-radius: 50%;
            cursor: pointer;
            z-index: 1001;
            border: 1px solid black;
        }

        /* 2.버튼 위치 */
        .carousel_button--prev {
            left: 0;
        }

        /* 2.버튼 위치 */
        .carousel_button--next {
            right: 0;
        }

        /* 3.버튼 가상요소(::after) 공통부분 */
        .carousel_button--prev::after,
        .carousel_button--next::after {
            content: ' ';
            position: absolute;
            width: 10px;
            height: 10px;
            top: 50%;
            border-right: 2px solid black;
            border-bottom: 2px solid black;
        }

        /* 4.버튼 가상요소(::after) 모양 */
        .carousel_button--prev::after {
            left: 54%;
            transform: translate(-50%, -50%) rotate(135deg);
        }

        /* 4.버튼 가상요소(::after) 모양 */
        .carousel_button--next::after {
            left: 47%;
            transform: translate(-50%, -50%) rotate(-45deg);
        }

        /***************************************/

    </style>

    <script>
        (function () {
            'use strict'

            //2.클래스 get
            const get = (target) => {
                return document.querySelector(target)
            }

            //3.객체화된 클래스
            class Carousel {
                constructor(carouselElement) {
                    this.carouselElement = carouselElement;
                    this.itemClassName = 'carousel_item';
                    this.items = this.carouselElement.querySelectorAll('.carousel_item');
                    this.totalItems = this.items.length;
                    this.current = 0;
                    this.isMoving = false;
                }

                //초기화
                initCarousel() {
                    this.isMoving = false

                    this.items[this.totalItems - 1].classList.add('prev')
                    this.items[0].classList.add('active')
                    this.items[1].classList.add('next')
                }

                //이벤트 리스너
                setEventListeners() {
                    this.prevButton = this.carouselElement.querySelector(
                        '.carousel_button--prev'
                    );
                    this.nextButton = this.carouselElement.querySelector(
                        '.carousel_button--next'
                    );

                    this.prevButton.addEventListener('click', () => {
                        this.movePrev();
                    });
                    this.nextButton.addEventListener('click', () => {
                        this.moveNext();
                    });
                }

                //prev 이벤트
                movePrev() {
                    if (!this.isMoving) {
                        if (this.current === 0) {
                            this.current = this.totalItems - 1;
                        } else {
                            this.current--;
                        }

                        this.moveCarouselTo();
                    }
                }

                //next 이벤트
                moveNext() {
                    if (!this.isMoving) {
                        if (this.current === this.totalItems - 1) {
                            this.current = 0
                        } else {
                            this.current++
                        }

                        this.moveCarouselTo()
                    }
                }

                //이벤트 발생시 값 세팅
                moveCarouselTo() {
                    if (!this.isMoving) {
                        this.disableInteraction();

                        let prev = this.current - 1;
                        let next = this.current + 1;

                        if (this.current === 0) {
                            prev = this.totalItems - 1
                        } else if (this.current === this.totalItems - 1) {
                            next = 0
                        }

                        for (let i = 0; i < this.totalItems; i++) {
                            if (i == this.current) {
                                this.items[i].className = this.itemClassName + ' active';
                            } else if (i == prev) {
                                this.items[i].className = this.itemClassName + ' prev';
                            } else if (i == next) {
                                this.items[i].className = this.itemClassName + ' next';
                            } else {
                                this.items[i].className = this.itemClassName;
                            }
                        }
                    }
                }

                disableInteraction() {
                    this.isMoving = true;
                    setTimeout(() => {
                        this.isMoving = false;
                    }, 500)
                }


            }

            // 1.초기시작
            document.addEventListener('DOMContentLoaded', () => {
                const carouselElement = get('.carousel'); //초기 시작시 carousel의 item 목록 가져오기

                const carousel = new Carousel(carouselElement); //클래스 인스턴스화
                carousel.initCarousel();      //초기화
                carousel.setEventListeners()  //이벤트 발생시 확인
            })
        })()
    </script>


</head>

<body>



<main>

    <section class="hero">

        <h1>당신만을 위한 의류 쇼핑몰</h1>

        <p>지금 HexaShop에서 최신 트렌드를 만나보세요.</p>
        <div class="carousel-wrapper">
            <div class="carousel">
                <img class="carousel_item" src="image/welcome5.jpg" />
                <img class="carousel_item" src="image/deliver.jpg" />
                <img class="carousel_item" src="image/welcome5.jpg" />

                <div class="carousel_button--next"></div>
                <div class="carousel_button--prev"></div>
            </div>
        </div>


        <%

            Member loginUser = (Member) session.getAttribute("sMember");

            if (loginUser != null && "Y".equalsIgnoreCase(loginUser.getIsAdmin())) {

        %>

        <div class="admin-actions">

            <a href="product_create_form.jsp">

                <button class="admin-button">상품 등록</button>

            </a>

            <a href="product_list.jsp">

                <button class="admin-button">상품 수정</button>

            </a>

        </div>

        <%

            }

        %>

    </section>

</main>



<jsp:include page="include_common_bottom.jsp" />



</body>

</html>
