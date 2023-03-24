Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF96C8207
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 17:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EA010E548;
	Fri, 24 Mar 2023 16:00:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9581010E541
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 16:00:24 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id p204so2704715ybc.12
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679673623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dksB5iUeGdRvRQe9WabXTIoiziL1Tg7lbGcFiUozL5I=;
 b=huop7HKeUTs3oNm4X0dfZWPkxEHd4eJSM7/8AC63zKy1bhtOPpkACHUgplxCr5og6y
 7n8O59piNxsAXGmaYOCSFrc1iUlq59lyB+TYuD1irJs1a2dJymlJ+dWHvAtKks3Wy8rZ
 weDFNYJfiDOuqkTOG+FQ2Ek+UXUoMeN8S+kWzRWsNCQ2Mu0BnWEP77XxF8nQPBJUUyhy
 JZT3oRqB1Uc+l2f/tsTkM3x5Zbes3NPzIUnW8ZCaJuJyo10XBlfSLYpm8jMXhWKMABKD
 sj201UpqF9QsEv6F2+G8qFHpwF8sVDihFncbKo7nPat7oJTOIm6zkP/Uf2v2Iu9mb3Ln
 yOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679673623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dksB5iUeGdRvRQe9WabXTIoiziL1Tg7lbGcFiUozL5I=;
 b=IEp7Ca//GhvtqzupwE+jtdYi46AnwIfVb8U558fMhvuoZIiVyBYSGKfueuIebs5ziO
 PB1cNxlxC2YTzFBgrc3aD8Hs2ilG/KMfEUgeqETh9hCGJIuct+pYN2Pgmh9D3sC7XVMw
 ytIrAtIpDF2QdBK7zcMgTZAlv4qEqdWbQ+VyQn+MOjTwOm841Q9YvycCilFmToxjoAkx
 8SZjVye4k1Kgnj3gUzTZIwDKQ5ngrE6rp/VVPHbnk5WfbRvbW0HGgDRG7Mmke/Redhwi
 CEhly1c9D+kXDZkLwrGYNTBrMP3c3nnnFxHXFlr49wszVQpXbiN3GXV5wVMUezYVQaep
 nDZw==
X-Gm-Message-State: AAQBX9fvVunRWPYuidl7imSdIGpswRmXJkcLakANU09fBX+nI5CRHV43
 Bm0g0Ia8P8m2BiReFu6A4r0W3nGLgZ/Lrzl2AqN7VA==
X-Google-Smtp-Source: AKy350ZoxswfuZe1V0eDrNYugY+teAimH2xnIykHhpuOjIfpxFVli6q2uii5Xx2zsLdj7tAw829/nisfatey66SbkeY=
X-Received: by 2002:a25:db91:0:b0:b75:8ac3:d5d9 with SMTP id
 g139-20020a25db91000000b00b758ac3d5d9mr1586805ybf.3.1679673623712; Fri, 24
 Mar 2023 09:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230324095502.3289094-1-arnd@kernel.org>
In-Reply-To: <20230324095502.3289094-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Mar 2023 16:59:48 +0100
Message-ID: <CAPDyKFok_k=M8-g4kgm+5CT7vzrqfbZYfLWCD1oU3W6r-2fsog@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: add CONFIG_PM dependency
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
Cc: freedreno@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 24 Mar 2023 at 10:55, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting CONFIG_PM_GENERIC_DOMAINS causes a build failure when CONFIG_PM
> is not enabled:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
>   Depends on [n]: PM [=3Dn]
>   Selected by [m]:
>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM [=3Dy]=
 || SOC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT =
[=3Dy] && (QCOM_OCMEM [=3Dy] || QCOM_OCMEM [=3Dy]=3Dn) && (QCOM_LLCC [=3Dn]=
 || QCOM_LLCC [=3Dn]=3Dn) && (QCOM_COMMAND_DB [=3Dy] || QCOM_COMMAND_DB [=
=3Dy]=3Dn) && DEVFREQ_GOV_SIMPLE_ONDEMAND [=3Dy]
>
> drivers/base/power/domain.c:654:13: error: use of undeclared identifier '=
pm_wq'
>         queue_work(pm_wq, &genpd->power_off_work);
>                    ^
> drivers/base/power/domain.c:853:26: error: no member named 'ignore_childr=
en' in 'struct dev_pm_info'
>                 if (!dev || dev->power.ignore_children)
>                             ~~~~~~~~~~ ^
>
> Fixes: c11fa1204fe9 ("drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc =
collapse")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/gpu/drm/msm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1c417ba53b5b..85f5ab1d552c 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_MSM
>         depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
> +       depends on PM
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> --
> 2.39.2
>
