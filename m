Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD49ED855
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 22:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E4A10EC19;
	Wed, 11 Dec 2024 21:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="L4Rt4Xs4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC12510EC17
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 21:20:23 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6f006748fd1so38872777b3.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733952023; x=1734556823;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
 b=L4Rt4Xs4TMuaG65RwVya/usnaaqdglSpdrO/xgc2VkrbE72RBDIsbt6kk/6KmsxQKN
 BTHRSvKAA5ieKk5xtlnklVWePVw8WiPISSmq6veuDm3LtW1eU0AMHs0S90UgE4OEO5w+
 c7+54x+ujARL8l0LG7j4nU5SYjtN4wc1W7N4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733952023; x=1734556823;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
 b=p7PUSQU6oTDgZRP2iJjTqeSV4cMYRZmsvYe+SPXEny8L+0FWSElSDYR/OP2O48HUa5
 k4+WOKajvqMxtPVvSF1/DXW5/uSabeiCVDMSr9UwMH6kG1inTknMb5U7HTbhg/9EYQhZ
 AmNqoyNkTFsahRUpBchEl/X84HChy35b6sY66EzuBrTMsxTRYiTYn7wXOiTy33XudgVa
 6P1F90odtyWMoCs5zVIK7t8Fad5+5z823Cad8rCUgXT8FQ/GcuwuFgLvO+YHR43h5BAa
 OayFQb9ZBeSv9TrzIx80sbvix6gtWXcJCR9l6+YhbVeiM05ilPb8PWyBGp1FUgn/eLWj
 BoSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjbdCUbnhq1r4j49GyIUhy8iu497a0hX1jk7ESThwHdngwepBGwVVq7DDS1kvBOXLZ6RBB5fmq8OE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/4tEbhtycslajgZKEMxaR0gHauRRZr1YaQ/i6nq2aKbER4PPY
 h7R2R9V9E26AfF6kAamSbo4R+9xNbhVwAfkBzsycWkl6wRelm7r6gEtvxMeJq8eNSM+MwVN//X8
 MCkFu73I7hwvxOgGW5IktiT8EmiOpByXBqz0v
X-Gm-Gg: ASbGnctdQjVTH1xrCmYL2rwOzZYjY7kDnS3+vHjUG2vw7hqz4Qgg1SlCePkgTU5bQJd
 tRaKVD2/jdF9Sht4PEm3CNum//kIc5LFXtFg80fBwzU58bSEPInT8T6g/4K81mRY=
X-Google-Smtp-Source: AGHT+IGiqcJUcizFAGyQuCjc5BPiqK/fm5496Pa//h9SFBYiB9+QTvjnCAELvBpBSrKYiF5MVCjIFkIU1R/GLCyr/Zg=
X-Received: by 2002:a05:690c:6e03:b0:6ef:8122:282f with SMTP id
 00721157ae682-6f1a508837dmr10285587b3.24.1733952023136; Wed, 11 Dec 2024
 13:20:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:20:22 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:20:22 -0800
Message-ID: <CAE-0n52dsQko18bY2uu_k4AFNdeirQ0FaE-k0Jy9=Re_fGV+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:32)
> The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
> for the header output, while it expects a two-element array. It performs
> a sizeof check which is always true on 64-bit platforms (since
> sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
> an error code which nobody actually checks.
>
> Fix the function interface to accept u32[2] and return void, skipping
> all the checks.
>
> Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
