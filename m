Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800A9D9E13
	for <lists+freedreno@lfdr.de>; Tue, 26 Nov 2024 20:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452B10E083;
	Tue, 26 Nov 2024 19:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pH/Q0Ee2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF7E10E083
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 19:39:39 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e38df4166c7so5507444276.0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732649978; x=1733254778; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MKZGQZXr/HtSG6ikM1HGVeIoUI7E9BgamozW8+s0o9c=;
 b=pH/Q0Ee2vzUoRurW6f2zwJVgfypTCWuHfwuUwkrAhSgFkbBpxT00KkO/MRE2amn4bs
 HsDUNd8DnvqIwurGNq5xR19re3e/e8iVgkw1P3xN+JrGWq8T0rZ5J4Cxvi16q6IssRqz
 iezGJma6eVNwib+OwTMqa5JQRTM/tB4gNDjSpkWIGJcCUak/C1y35zK3krZtFI/rf6Lc
 LLYPa5ggvlxMnOYzf9ZP5JNEtJA2pxnTFzb5BCme0EiUwJNpB5KylohlY9f9hr/n3eJO
 ZZPxcV1asT9y5iiUZRSFj1Oxbj5cI+YzgsR0YY8wkbEX6a4s+T8huaw8XH7x31k2bezQ
 U01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732649978; x=1733254778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKZGQZXr/HtSG6ikM1HGVeIoUI7E9BgamozW8+s0o9c=;
 b=U6WY0LK8/DNVDpukH54JANgST0qF95wOHZmn1BckXh4ENoW3349eK4DaDojLnmjToO
 W1LGnWh531+xbPthKe2FiQ7tN8YHbe4aH3Q+F+7+V/QYBpcWvK1ObVa1mqKTO5tpNA6l
 tDBS7pLHZXsTFxoX0JwABo4kqICcblI0aa57cXQld+D+GYNWO5Wqotks+ke+v6zyVaEz
 DrFpFWPZtmOe/Jy2MetKIucz3Pn0Iff8ODwTOhwTj2FjeQwdnfeCshfCiN9QtqNNKPhu
 NU6N7P8+uttiZwZNRigrvddc2AOPQQhJr/ELFUPnCpxD5J6tmwfxUwX0nuuLRhSUb8Fl
 AUxw==
X-Gm-Message-State: AOJu0YwpjpZOcba9rmLS3AeJMzGaRgsraZ+LDSSKPNsScxrUl18Levd+
 MyAZ0QbCiRubpSd2ynWt/6C1dwm8vkhv5aZp3UfeBXttsgERMIOeTWlZFWKPw9fJ37Eb/Ho64gQ
 lPBOsE3lYyVTVNVUUY5EkDZBSwyC4zC/6Ksq7CXpEw8BkYRpR
X-Gm-Gg: ASbGnct0+mQufHCK1YeBjYVUpPUGIIvfDW2vSbV0z4v92A2aFqcpgBviJhw+BCftLLv
 NlJTVqSNpEtYukNA9vQHoRkGQX44z6vAkWj795FmV8gaXxIJnW0rQ+YrumuDZDOs=
X-Google-Smtp-Source: AGHT+IGaq8XgSDiY+Bz/arCegPHjXVpSkwupysNHq2R3KZrtTqzwDKRJ+3vv4ewg4wRIBfdf2wOKq4l7jfURMd8bTTw=
X-Received: by 2002:a05:6902:1022:b0:e38:93af:4133 with SMTP id
 3f1490d57ef6-e395b943279mr309916276.41.1732649978266; Tue, 26 Nov 2024
 11:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <vfbklrbereo3j5dp2w4pvctef364sb2dqogccmaevjerkm5u43@jytwobqwvuv2>
 <ba4e830c-e37f-4f5c-b461-2bcd8330234c@quicinc.com>
In-Reply-To: <ba4e830c-e37f-4f5c-b461-2bcd8330234c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 21:39:27 +0200
Message-ID: <CAA8EJpoUbUpzaQmTNeEFvt7Wcr86T=0bZg=QoiT_N6NL0BzD5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno@lists.freedesktop.org
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

On Tue, 26 Nov 2024 at 17:37, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 11/25/2024 10:16 PM, Dmitry Baryshkov wrote:
> > On Mon, Nov 25, 2024 at 10:03:00PM +0530, Akhil P Oommen wrote:
> >> There are a few chipsets which don't have system cache a.k.a LLC.
> >> Currently, the assumption in the driver is that the system cache
> >> availability correlates with the presence of GMU or RPMH, which
> >> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> >> with a full blown GMU, but doesnot have a system cache. So,
> >> introduce an Adreno Quirk flag to check support for system cache
> >> instead of using gmu_wrapper flag.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
> >>  3 files changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 0c560e84ad5a..5e389f6b8b8a 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
> >>              },
> >>              .gmem = (SZ_128K + SZ_4K),
> >>              .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >> +            .quirks = ADRENO_QUIRK_NO_SYSCACHE,
> >>              .init = a6xx_gpu_init,
> >>              .zapfw = "a610_zap.mdt",
> >>              .a6xx = &(const struct a6xx_info) {
> >> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
> >>              },
> >>              .gmem = SZ_128K,
> >>              .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >> -            .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> >> +            .quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
> >>              .init = a6xx_gpu_init,
> >>              .zapfw = "a702_zap.mbn",
> >>              .a6xx = &(const struct a6xx_info) {
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 019610341df1..a8b928d0f320 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
> >>
> >>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
> >>  {
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> -            return;
> >> -
> >
> > Shouldn't it also be a NO_SYSCACHE check?
>
> llcc_slice_putd() has an ERR_OR_NULL check inside. So, not really needed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> -Akhil.
> >
> >>      llcc_slice_putd(a6xx_gpu->llc_slice);
> >>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
> >>  }
> >> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
> >>  {
> >>      struct device_node *phandle;
> >>
> >> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> >> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> >> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
> >>              return;
> >>
> >>      /*
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> index e71f420f8b3a..398be2218110 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -57,6 +57,7 @@ enum adreno_family {
> >>  #define ADRENO_QUIRK_HAS_HW_APRIV           BIT(3)
> >>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT    BIT(4)
> >>  #define ADRENO_QUIRK_PREEMPTION                     BIT(5)
> >> +#define ADRENO_QUIRK_NO_SYSCACHE            BIT(6)
> >>
> >>  /* Helper for formating the chip_id in the way that userspace tools like
> >>   * crashdec expect.
> >>
> >> --
> >> 2.45.2
> >>
> >
>


-- 
With best wishes
Dmitry
