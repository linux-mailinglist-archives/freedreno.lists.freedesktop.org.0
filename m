Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77C9F4A9A
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 13:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9BC10E94C;
	Tue, 17 Dec 2024 12:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n6NqXr5l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A327310E948
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 12:06:53 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e3c8f39cab1so4098100276.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 04:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734437213; x=1735042013; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtcNS4WYNQ7vwgcHRVs06xAqqZt34Z8yAs31pHoB2MM=;
 b=n6NqXr5l53ALWLMr25ftXM93mMm9AfKl4xhmpoNCbzW8tWoexZ5IeUMt0R+7UmC17O
 q7kvFOa4zfan5pmjVwgqST4IdhuoNU2z/ldnqe5xmJ3W8zJwSeLwzW7/TUhWjsDw48lT
 3yVnS8p9YGwYPfwt5UVTLt8HV5h3TCpuDgt4qCPwTMVAxeR3tAbMYurYJ/9yFmQPJT2W
 Z3bSG63AnQePAvvfRltiX2GRyP6riNj65zlyEiQZBLoCTH0xvJEkMOwm7p/0JERtKXbz
 DUOOM7y/n2kRdVwdEwsUE04P9LyFlL/52PfRQUf8TlVAmIaxp2DL0rQXSKCVOg6o8Ccq
 CArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734437213; x=1735042013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtcNS4WYNQ7vwgcHRVs06xAqqZt34Z8yAs31pHoB2MM=;
 b=YjuYEP09u4ajHXJz2Y+dCvVV/gB2SXZ5syfB9eGlqeIld2FnU4rOrGQse8+CgvDkVX
 kWnF5RqMC1Kqz64wS5pdzdYxYO7+wVReLTqHDV0V5mWIBFXJN1NlL0knci03ndexe1dO
 oja+ccwGcyKkhICGt5iwF8tn7N72RcbdFSU8z/GhipMRK26CuTbBlZvAF+hdDms2f6Er
 JjWtKAV0YSQSsTdzfr4WYy8wuZu+BhXnhwhMwrro2w5Dxd7bMJ6YCyxm1PhCGGjqsAZL
 LJMGmG3l5XlAbGPlsbtdh791yk9FqHw18+q9lheCgJIyM71ZvHhunvV/jHfqt00jG8I7
 X7Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtmRP6eVq2rrfu86Qq32WfmrT63+vLZ9wjh2xUKLP0TFhKS5JlNZCS4lCr34VOL+3ioUOub/Ub1hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTkr+WQCiakXLI71xHfNBMflGrXOBsdXaE09I+qoppZWQZjdCa
 CkMXnbn0kiP3vNpxPaa9ok5eneF7VGKuWNOHmd+LuAI5O6kFHwvF/7GuHCvnMj/RS2ieacVPHCr
 XkTuwEYKQh9syj3o8orRuFhNISiifVcY7pJrGbQ==
X-Gm-Gg: ASbGncvImtEUWqbdHCKTrNWWXcuwQGc12NUuw5Z7OpYteQBNGcJlUHDtTkVBZ1IKPdv
 EBYwTZ83HQ4Rck2tHg3vQmf1PHFJBKhSsdJNk5dwDhKBnGavFpqKf
X-Google-Smtp-Source: AGHT+IHA892uAzKw6cPgSlziTULlXbGE7tU9YemAvZukjV0KTn0lzS8KUSWqbZi8euRBjZNVY3gThecx/TV6P6m2k58=
X-Received: by 2002:a25:acce:0:b0:e38:8d3b:66e0 with SMTP id
 3f1490d57ef6-e53299709aemr2594135276.19.1734437212629; Tue, 17 Dec 2024
 04:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
 <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
 <ba59f164-2ccd-4cf9-9426-9b6a2c199224@quicinc.com>
In-Reply-To: <ba59f164-2ccd-4cf9-9426-9b6a2c199224@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 14:06:41 +0200
Message-ID: <CAA8EJpqApTLaNTkfHyfg5vgPtDQZs1cWjBSgdGULP=xRm+WmMw@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 17 Dec 2024 at 13:02, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/12/17 18:54, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add definitions for the display hardware used on the Qualcomm SM6150
> >> platform.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >>   4 files changed, 257 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> >
> > [...]
> >
> >> +
> >> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
> >> +    .mdss_ver = &sm6150_mdss_ver,
> >> +    .caps = &sm6150_dpu_caps,
> >> +    .mdp = &sm6150_mdp,
> >> +    .ctl_count = ARRAY_SIZE(sm6150_ctl),
> >> +    .ctl = sm6150_ctl,
> >> +    .sspp_count = ARRAY_SIZE(sm6150_sspp),
> >> +    .sspp = sm6150_sspp,
> >> +    .mixer_count = ARRAY_SIZE(sm6150_lm),
> >> +    .mixer = sm6150_lm,
> >> +    .dspp_count = ARRAY_SIZE(sm6150_dspp),
> >> +    .dspp = sm6150_dspp,
> >> +    .pingpong_count = ARRAY_SIZE(sm6150_pp),
> >> +    .pingpong = sm6150_pp,
> >> +    .intf_count = ARRAY_SIZE(sm6150_intf),
> >> +    .intf = sm6150_intf,
> >> +    .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >> +    .vbif = sdm845_vbif,
> >> +    .perf = &sm6150_perf_data,
> >
> > I noticed that the catalog entry doesn't provide writeback configuration
> > although the vendor DTSi specified that there is WB_2 on this platform.
> > Please send a followup patch enabling writeback on this platform.
> ok, will update it in next update

Just a followup patch is fine.

> >
> >> +};
> >> +
> >> +#endif
> >
>


-- 
With best wishes
Dmitry
