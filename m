Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3489B2CDD
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2024 11:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E749010E45E;
	Mon, 28 Oct 2024 10:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dUtFmKEj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2243E10E460
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 10:27:50 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6ea07d119b7so5692587b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730111269; x=1730716069; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
 b=dUtFmKEj9Bb4X6awU8985LJ18htFcqGltKh4U2RTX4HVR0+jCtZ6/9viYTknaGKC7o
 MxcWsnGbPa/F9cqspKmClpkcgLcwFl5tsEFM1j/BY7jNBE18jGDghLvSsNTF0thGLpzh
 wGpX6sZBakl+6U32YyVSfiVhcrElEBlgFJ4qSWWPTBzz7dGrZBWMDWV3Sd7Xc8c+vLgk
 LaTkSMeJTDpjIwfy5sNQOsW1eIv/tMGEGKm7bMk3B26TekQACqYQjppGWgtNcrdhH8wL
 KRDyJCke7ChAwWBme0FrfHe1Uod8KEImBbO6ZtI7p8wdZEBquwRNz9qaak2kML7+iOGY
 nkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111269; x=1730716069;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
 b=a2HbhBnSJ6VlsqQcPELgP46a4qaL7nJHgFeUOrXsNvEKLLANhQuqjvd7B8Fu8u+9rN
 vCZIrnfQmhQFumKO8kAXH2XN6aswuliyreXPAJRj7Yijtt69i8DJ5a4pBMKSg4i7LaTV
 MBs9QPgmcqdjHUzHv4/W7mUfKVnjZ5gudATRn16REOy7zibVhk/ZU10oVqT6f2iLrm7x
 VkkbYy2GFolZUibxm3oXsCduGjZiBNAWvuzG58XyVTBKQjVRKL1fUCvsoJ0UFo5XiPzv
 UIrZLUYEtJXvmJNQxjMnqmbDuZooKFT5L3gx1QSpzlO5MbVBZNwb5l9wxEpRm0OqOxGe
 vNHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX61y3Hicc/bnLlHxEed9xK2tpRkN2lphTuN8eApw1hx4f6pkjv+zifZPJas2x/s33sMcVxQYH0G8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4EgEqsKXXyDXAVFRL1+PeVoEEK8/LIsgiVxs/XZhQGNuekNGN
 Zx1WNK1w4sSlQCqMP8T0zmyjG4uQVU89wc6ME6SzWVsMM72WyOxE66lMauloMhcPwODUWxJZ1uw
 Elk6fY1ViAAdakyQWl2DqUsOhDoGfss3lO0TKQA==
X-Google-Smtp-Source: AGHT+IGLe+4t7S9ZSveqwANNEzKdjUad0Z1HtQTFx3PEGKze+pVHMLOD52kyDgR3LowLm6wgDiAgoEwd56iMjidmX78=
X-Received: by 2002:a05:690c:48c1:b0:6dd:beee:9218 with SMTP id
 00721157ae682-6e9d8b1754amr70515197b3.30.1730111269077; Mon, 28 Oct 2024
 03:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
In-Reply-To: <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:27:38 +0200
Message-ID: <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Arnd Bergmann <arnd@kernel.org>
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

On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> > On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >> Clang-19 and above sometimes end up with multiple copies of the large
> >> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >> fill the structure, but these create another copy of the structure on
> >> the stack which gets copied to the first.
> >>
> >> If the functions get inlined, that busts the warning limit:
> >>
> >> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>
> >> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >> the stack. Also, use this opportunity to skip re-initializing this table
> >> to optimize gpu wake up latency.
> >>
> >> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>      struct completion pd_gate;
> >>
> >>      struct qmp *qmp;
> >> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>  };
> >>
> >>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> index cdb3f6e74d3e..55e51c81be1f 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>
> >>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>  {
> >> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >> +    struct a6xx_hfi_msg_bw_table *msg;
> >>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>
> >> +    if (gmu->bw_table)
> >> +            goto send;
> >> +
> >> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >
> > Is it necessary after being sent? Isn't it better to just kzalloc() it
> > and then kfree() it at the end of the function?
>
> Keeping it around will help to cut down unnecessary work during
> subsequent gpu wake ups.

Then, I'd say, it is better to make it a part of the a6xx_gpu struct.


-- 
With best wishes
Dmitry
