Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E1570E30
	for <lists+freedreno@lfdr.de>; Tue, 12 Jul 2022 01:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82EE89580;
	Mon, 11 Jul 2022 23:22:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B553A91B90
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 23:22:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y8so8074889eda.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
 b=fAXlbz7CXR4/Kg6TafHz6Jq1ObQFjoGNWKETyL5sK1ogIAZ7eh86yG8EZsMgg7dLi9
 i4WwRk7mJjU5ORPXarDHnJ6nA7DhMcGY5zkpAGZAjIj2sF0ZoSiyOfhWy3cqaB77JJH2
 dTkyj2oPvErEYbjlvTsVHSPFBKhF6aamfznp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
 b=suz9e5BDQbY+m4wpJpnM9qzEtOhf6Ve6sYshnZm8QDyBH2ewZkJfuSEJuIuVLsRu5z
 uLP7Rkxql6rwfN7/Yq91QkHJRHKZUEzoOgqmkCq4+rs33P/omBMwixSHMG8OnefZkQsD
 OZosLMn0l/7AOjU9AAFjrP3yiXtsvsWoYEtorlrgwZRMyfLhpLc6DWMEnahwJKR1qDPe
 GUQz6W/6R0ZtXasHRsPCLPN7C9t4IKheGxWhS4D3xJN0zVd05BsTVeLLYrJswEpPV3Tl
 5yPUGloV3tw7mQIt4h7i4tZd5o9GgFuhC/hIunE0w1xvbg2fmxv2Lyyl4Wu7IYrI6qe8
 7kTg==
X-Gm-Message-State: AJIora9LuAn0zaBePRACbZUPUik6LoILBpjhoyTBMLnOvROtpiumEuIM
 GxlJJM5aBuo8FbQQzAbN1Ucx8Y4lCW9+Jm29rcE=
X-Google-Smtp-Source: AGRyM1ucYoDug0mmmTbngokUHm1/rIBoSdfd/38HJZv0luKiMpmFd7L70cpVeJN+fqBJWFXA6I5vuw==
X-Received: by 2002:a50:e608:0:b0:435:be99:202c with SMTP id
 y8-20020a50e608000000b00435be99202cmr27510059edm.407.1657581759098; 
 Mon, 11 Jul 2022 16:22:39 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 lx27-20020a170906af1b00b00728f6d4d0d7sm3145308ejb.67.2022.07.11.16.22.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 16:22:37 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id b26so8910738wrc.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:22:37 -0700 (PDT)
X-Received: by 2002:adf:d1e9:0:b0:21b:c8f8:3c16 with SMTP id
 g9-20020adfd1e9000000b0021bc8f83c16mr18888013wrd.659.1657581756957; Mon, 11
 Jul 2022 16:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
In-Reply-To: <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 16:22:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue
 during recovery
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>, Chia-I Wu <olvaffe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> There are some hardware logic under CX domain. For a successful
> recovery, we should ensure cx headswitch collapses to ensure all the
> stale states are cleard out. This is especially true to for a6xx family
> where we can GMU co-processor.
>
> Currently, cx doesn't collapse due to a devlink between gpu and its
> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> that the iommu driver removes its vote on cx gdsc.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4d50110..7ed347c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>
> -       gpu->funcs->pm_suspend(gpu);
> -       gpu->funcs->pm_resume(gpu);
> +       /*
> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> +        * First drop the usage count from all active submits
> +        */
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_put(&gpu->pdev->dev);
> +
> +       /* And the final one from recover worker */
> +       pm_runtime_put_sync(&gpu->pdev->dev);
> +
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_get(&gpu->pdev->dev);
> +
> +       pm_runtime_get_sync(&gpu->pdev->dev);

In response to v1, Rob suggested pm_runtime_force_suspend/resume().
Those seem like they would work to me, too. Why not use them?
