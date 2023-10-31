Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CD7DC802
	for <lists+freedreno@lfdr.de>; Tue, 31 Oct 2023 09:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173B310E41B;
	Tue, 31 Oct 2023 08:17:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1010E41B
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 08:17:03 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d8a000f6a51so4687151276.3
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698740223; x=1699345023; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
 b=ILhuhPQ1jJ3FgEFNtR7Ou1GVJIsMEaKDp+JJnJObJ+Z6rbcPtcDpNDlWT/BY9jP3tX
 fx7sBM6sXQ6UTDiq2e/wttnIviIupW8HFaV9yweCK+tTuLiP6CMj/j2MdhVxn0KvM1Uv
 ReJbhd6YNC79d6wNLziyde764s4L3EZsXXC+XV4m4eCJD1VGtEhzPEybuYzz+x1C7f3m
 g4ApxUU3ysq2Jw7KW+qAPPoSzHeYcyaXBd4K+xi/vVckNPI/jtApXovZCviuZI3ANX9z
 62zGyIUj9SdZhtFHe2znhngfnc2BAVxWprPNxJUAMrYUJsvlpOe8niyvfcQBYejYO9Xd
 HPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698740223; x=1699345023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
 b=IOlj1WctcNQIDpxUp1jvvBMdeVCfMMbIdGssiy/zBR6N4mnro0YgsJ5eYyKgdq2Frz
 tbyabd9DgtEqxbGCOkJe0UdF31ObKXSbCUaSIPl4bL5gjDjMlJf/q6gVgjAU9CrsLTxi
 RLIdWtM2doQoF64yP+EjgPS88ZQVlMTvgDk640ZyqhoS4Igcz9yUvNIuajDzceyHNK2R
 f5YsscJ1wRICC/ZIhukSerHl8UKfrgbWS64+/9ACp7Vl2jqfivUNejRaLd60/iAQFtgf
 iofbu2+dgMH8jt1FG0tikMGTbZRWn3uPfk0Fi18i4w8/us2T8+Snp0xFgBScRUU7Oy1e
 JLoA==
X-Gm-Message-State: AOJu0YxPO759lHtKnShirGzgRtpIxpOL02NVtn1CU3xXpYk8X+rih/t5
 7XF8jT4Wed5fuXdjxOJ+P6T9VOj2mFWod3MRNvAdbA==
X-Google-Smtp-Source: AGHT+IHWifJqXC6H9D9kHYHXl1DQa3F7wXkSKAOFkAJmE2UoxCTGIcCFzuVkIhkNunb7Tg2gq9HFmGzJe/dab3ccdIE=
X-Received: by 2002:a25:238e:0:b0:da1:2a2b:4c5b with SMTP id
 j136-20020a25238e000000b00da12a2b4c5bmr9488785ybj.41.1698740222839; Tue, 31
 Oct 2023 01:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
 <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
In-Reply-To: <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Oct 2023 10:16:51 +0200
Message-ID: <CAA8EJppLGU1ZUCNxkb5TxzMyHGB1CsqhLSxrhrN0L9JDPRQnQg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 06/10] drm/msm/dpu: deduplicate some
 (most) of SSPP sub-blocks
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 21:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> > As we have dropped the variadic parts of SSPP sub-blocks declarations,
> > deduplicate them now, reducing memory cruft.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
> >   17 files changed, 120 insertions(+), 167 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index e60427f54b27..860feb9c54e6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
> >               .name = "sspp_0", .id = SSPP_VIG0,
> >               .base = 0x4000, .len = 0x344,
> >               .features = VIG_SC7180_MASK,
> > -             .sblk = &sm8550_vig_sblk_0,
> > +             .sblk = &dpu_vig_sblk_qseed3_3_2,
>
> Some of this naming doesnt sound right to me. What I had suggested was
> just dpu_vig_sblk_scaler_x_y but what is used is dpu_vig_sblk_qseedx_x_y
>
> This is not correct because technically sm8550 was qseed4 as its scaler
> version is > 0x3000
>
> So this adds some discrepancy in the naming.

And as I wrote, scaler is also not correct. We know qseed2 and rgb
scalers, which use different versioning (if they have versions at
all). I used qseed3, as it is the base version of the qseed3 / 3lite /
4 scalers. Of course we can switch back to 3/3lite/4, but I thought
that it was not that related to the hardware.

-- 
With best wishes
Dmitry
