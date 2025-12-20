Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1550CD2D42
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 11:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286310E262;
	Sat, 20 Dec 2025 10:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="U7KRWRoK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1410E286
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 10:18:37 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4779ecc3cc8so17524085e9.3
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 02:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766225915; x=1766830715;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
 b=U7KRWRoKEX8G1249GJssoQfEj86+AwYy34keNYoi18HPm/kArEqd0CRLZ300+pSzid
 at+y7kXsm494dEaNwxOEXEqhmWW+J9rkj0ltkHZM8sDXKEEjazn38eTVhrskBS2wL6EY
 X1D7xGbuhNUAR2dRQOvl7bSeXN9dxCj2eLy47AS1fd7XJ6NCawiTjVWUy7mqn7dK87O5
 0Xz6wUnz26vVj8EDvVYk6De45n/QVdJSFKs2LepD/Z1Kod5iCPDby37bbyBQnz5o1Wmp
 YB65Bcw/L7MqC610K7Ncf05tilfycGutkqC6lUL2i9UPJXBAgIWjnUpV6PniFeznE/H/
 86rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766225915; x=1766830715;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
 b=c5dta7qfvUcRJjkZAHmevlkHvg3UDtWNjGZ6dDMErzTnNN1iyLDA1AYmqwvuVuDsn7
 7zA0fhNH6cpElCCOvwOtssqheC9HS2pCUGVlhYqKcC4ywAlTh5DPtfyFRuNgs8Gaxenr
 NFSSzWmGEiSZ9zghYqFBfezYoTiIuIRlPCweI+L0IsfFZgh+OStSKUOHBX5HPgO6zrmK
 9B6QASlSwpVOXClSM/XTNo6tPFuiMlZDprrv+EFsRmsKbW4wr68RH2zuAocTnGV/9O1D
 SVP4AZ2pxHacgsmIcn/FGY4XMKaVEgYTICl8Jd5FmKo4TJOFKeWTaVNsl2ZVjv7cMKdb
 +bag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXRItkKkJNQ7KltWvOXGQk32yslz0pOMQuNcE56guN6Xi9hL8upUrcs74h5gh5sh6icmwXXYOb0Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSBGpRF0QrCGHnq7aRQgKcRZ8urlpdHbGS0YtQ+Np2xKIbFQVS
 yaAMRxm8IfOlFAd8oi4I7oRSIvxhuFwxK73myyVH7gRVB/mOxcZaC/B0vcQULvd+XD6DEnlp0Zt
 oaN6iKIyk6oagtMelng==
X-Google-Smtp-Source: AGHT+IHezTbdkQabpgPR3pVcmu1YjPdSolIwP7RQSXNt0PalcelZIDHJL+QGmDx/ShI8sV3gW2XIBlw4p3buplU=
X-Received: from wmxa7-n1.prod.google.com
 ([2002:a05:600d:6447:10b0:477:5a0f:1860])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8b:b0:46e:6d5f:f68 with SMTP id
 5b1f17b1804b1-47d19566aa8mr51108125e9.12.1766225915629; 
 Sat, 20 Dec 2025 02:18:35 -0800 (PST)
Date: Sat, 20 Dec 2025 10:18:34 +0000
In-Reply-To: <aUZ07zYew7Mfwc_C@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com> <aUZ07zYew7Mfwc_C@google.com>
Message-ID: <aUZ3-iStCAWShvt8@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Dec 20, 2025 at 10:05:35AM +0000, Alice Ryhl wrote:

Aha! This one didn't get duplicated on lore. It's the nouveau list that
is broken.

Alice
