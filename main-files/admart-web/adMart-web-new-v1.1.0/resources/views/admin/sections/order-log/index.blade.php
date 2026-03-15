@extends('admin.layouts.master')

@push('css')
@endpush

@section('page-title')
    @include('admin.components.page-title', ['title' => __($page_title)])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb', [
        'breadcrumbs' => [
            [
                'name' => __('Dashboard'),
                'url' => setRoute('admin.dashboard'),
            ],
        ],
        'active' => __('Order Logs'),
    ])
@endsection

@section('content')
    <div class="table-area">
        <div class="table-wrapper">
            <div class="table-header">
                <h5 class="title">{{ $page_title }}</h5>
            </div>
            <div class="table-responsive">
                {{-- <table class="custom-table">
                    <thead>
                        <tr>
                            <th>{{ __('TRX ID') }}</th>
                            <th>{{ __('Email') }}</th>
                            <th>{{ __('Phone') }}</th>
                            <th>{{ __('Amount') }}</th>
                            <th>{{ __('Gateway') }}</th>
                            <th>{{ __('Status') }}</th>
                            <th>{{ __('Time') }}</th>
                            <th>{{ __('Shipment') }}</th>

                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($transactions  as $key => $item)
                            <tr>
                                <td>{{ $item->trx_id }}</td>
                                <td>{{ $item->user->email }}</td>
                                <td>{{ $item->user->mobile ?? 'N/A' }}</td>
                                <td>{{ get_amount($item->price) }}</td>
                                <td><span class="text--info">{{ $item->gateway_currency->name ?? $item->type }}</span></td>
                                <td>
                                    <span
                                        class="{{ $item->stringStatus->class }}">{{ __($item->stringStatus->value) }}</span>
                                </td>
                                <td>{{ $item->created_at->format('d-m-y h:i:s A') }}</td>


                                <td>
                                    <a href="{{ setRoute('admin.booking.log.details', $item->trx_id) }}"
                                        class="btn btn--base btn--primary"><i class="las la-info-circle"></i></a>

                                </td>

                            </tr>
                        @empty
                            @include('admin.components.alerts.empty', ['colspan' => 11])
                        @endforelse
                    </tbody>
                </table> --}}

                <table class="table table-bordered">
    <thead>
        <tr>
            <th>TRX ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Image</th>
            <!-- Add other headers as needed -->
        </tr>
    </thead>
    <tbody>
        @foreach($transactions as $transaction)
            @php
                // Access the already-decoded object properties directly
                $cartItems = $transaction->booking_data->data->user_cart->data ?? [];
                $itemCount = count((array)$cartItems);
            @endphp

            @foreach($cartItems as $index => $item)
                <tr>
                    @if($index === 0)
                        <td rowspan="{{ $itemCount }}" class="align-middle">
                            {{ $transaction->trx_id }}
                        </td>
                    @endif
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->quantity }}</td>
                    <td>${{ number_format($item->price, 2) }}</td>
                    <td>
                         <img src="{{ get_image($item->image, 'site-section' ?? '') }}"
                                                    alt="{{ $item->name }}" height="50px" width="50px">
                    </td>
                    <!-- Add other item details -->
                </tr>
            @endforeach
        @endforeach
    </tbody>
</table>
            </div>
            {{ get_paginate($transactions) }}
        </div>
    </div>
@endsection

@push('script')
@endpush
