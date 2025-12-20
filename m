Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938ACD2CBF
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BE810E20C;
	Sat, 20 Dec 2025 10:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LlFWCAG8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E310E1AF
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 10:01:48 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b801784f406so308803566b.0
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766224907; x=1766829707;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
 b=LlFWCAG8llx83AYbiqgbw3sb3twEXpKJHaZrOHgfPqD0FbukGfTPlfvHxWBM10Hs8G
 lxKyPoszc82PMrpdpCKYmydRDfaRXjZA4S6CrHgFNdefOW+57iTVz6xxvTWiJLFcE6wP
 //YEe1UA/WQgcVp5aYjPFWfaM4ifpcdlyBEVneQCHNXaB0hjGwdMs7RwBrzPMgZwyVHi
 6NvMP7HHlNmxDLsF6jCv2Rem7CT+CCNg8tgetNmv0iDSxyK1mSzBEW9rMRqlGtV9Whad
 WTjXipTBKvfOQ32U7C4QKpnykUNf0xVKaq5iXnDQl/Y2hvHnE1ej5Yuq1OKk52jA/CvW
 1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766224907; x=1766829707;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
 b=c6EpV/Cf6TvXuxgwV/e/lz6sizl9OShUxoT/uvO9w2Ubb2X9CUk67vUEihyZ7f7qPQ
 IhEfzxPeSSKjpO5bnDbMR+Uj5Dg+ZAQJT1nG5CRm1ylWxnO1JtUUOeDQgncnkFRX8exT
 z6fREsH1coQMpKyeDZpUrhcho9Rx0goov3cu8o41Lt+vEw4HCZmRWhWlkX0cBd96a2nT
 l8OnhTbNBbwhb+i8+2zjkGvz2TUMZaerc6OgvlOL90M0Y/JbDKJ6vBkypvf0AR3eVpgm
 oU9Cwhkh+eUaL5wcScU9VFX8S4+EeVAtdSQbYllquJ0QM+p52ALkQfG1bnPF5bCwGTnG
 W0JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd9EqWUXsJXQkUOF7+kowT3qV68qtRXT2QlaPt8pJibnTNSyMCjdhxvseWijtGNkH89mPhXWOoV9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFWsnhTry24LzT4y8WW6fFojByLfRgqtmxDG6VYMRWwV1I5GQb
 JCO8V/nOfkwHeDtyw05fW9F1zxytu/Xv6GxxvAad+35M6+xKTmViNBd6wjxc/AOCIHqWpR7pcNS
 PQqqLyGqQ6X5FpJ4fHQ==
X-Google-Smtp-Source: AGHT+IG5pJx6M7iv4XX9yaURjf8mepTlu7YYJc3wOo7y0QcuEDT1u5dJwGmGqq3CfkKzGEqd1szxRNtAfdZCVwY=
X-Received: from ejdcw8.prod.google.com ([2002:a17:907:1608:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id
 a640c23a62f3a-b803719ef9amr511534366b.38.1766224907016; 
 Sat, 20 Dec 2025 02:01:47 -0800 (PST)
Date: Sat, 20 Dec 2025 10:01:46 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ0CsLrHjP3wMac@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
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

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:

Test email
