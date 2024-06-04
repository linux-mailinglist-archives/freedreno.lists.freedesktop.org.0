Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9C8FBEBC
	for <lists+freedreno@lfdr.de>; Wed,  5 Jun 2024 00:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17EC10E19F;
	Tue,  4 Jun 2024 22:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kgNpps3x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8810E19F
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 22:18:03 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dfa4876a5bbso5620865276.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717539482; x=1718144282; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
 b=kgNpps3xQoplY4EfmjKTfMn16xDonCw3mR8WoEMNGetbAplPYnj75ZiZL2ehLw6YLK
 drQs2Gb8yU3bYj1qVTU1XF8E8l9mubdkHbYNbdhi7OUoobyjUKyAzf+rI1jaedH7DICy
 8IURyyAMH7IJdn/mZPESt0fJbXgVlVpvp6Fq4C/Q8IS9LlnVs6l1cGRs6IA0KadgEZvm
 pFBCQysncOpC7uFVPGb6P0q5I+Gp9jpqBp2Z5+Xko3hX0ZPCawbU9WgPsWBLaO4f03OG
 2pU/4iNEvpC5nW3ZN7mFRTLwJ7fl12RShB+wo3SIvpJjnbtBrA8zzxyjEzrNEVjmmVfl
 jFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717539482; x=1718144282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
 b=Yi4qtgd0VlnrTvhSJ/H8kCDx5aTOb3iVpux3jL6FzFBdqB4NItTDk47p1mhbf3wI5b
 bzF+HBuHw1ikmsZ7F98sJt8YUZdIbgriY/M6uLG8zcma6WZ6PJSGAyMeFw3oA5dMzyQX
 nT7/DfPHYFoJDb2jp87duEMK7esQuo3ZPUiC4u/8aeiRoCazRODo2xfNUkp8SwwzmrhE
 C6QaY5NTr9WuzADMzbfTVH1VYaR7bpYzmdpP11dHn6yDjDStqfKOTu6ibQBTlelynQZQ
 AaeY7GYVtI4tkEIifeoJAGQR9u2ZQAJ+ZIGGjRi8PdxiOBk4KddXJbGLbj0wo/aySESy
 HMBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfI8+fOgng95E/qfRpVd5y0LVfnwtbAa+LUmGVE1i/0YwMmFTjQzdz/10a/483JWdVKjfZgSokj/qsB1gWtlABWgmakCrhfKJARB9IYmHl
X-Gm-Message-State: AOJu0YzI8nCzgP5hdF+QANltyl/dVudiHqjxi7CiEhhW2qKguUZaCUkC
 M5iAWbldVzJUG7H9F9hN5uyMsP1DD0YG1xoY9h71bDr9Il3/Oymp9wDdkuNDUMo9Nppa1cuB4dT
 tjgWsYx29a/4OiXBtJTYFf9EuhOVImIcw2sM8nA==
X-Google-Smtp-Source: AGHT+IGjOfS4i93Row/X3jqzU0dH+hExXMYcFf+ZqDyJ2rsltsLw1J6GpgelC+gB54Q/xtCmXF7iFbUk4LEnR14NsBE=
X-Received: by 2002:a25:828a:0:b0:df4:e791:867c with SMTP id
 3f1490d57ef6-dfacacf972fmr736847276.43.1717539482510; Tue, 04 Jun 2024
 15:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
In-Reply-To: <20240604214018.238153-1-pbrobinson@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:17:51 +0300
Message-ID: <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> this is needed for automatically adding firmware to things
> like initrds when the drivers are built as modules. This is
> useful for devices like the X13s and the RBx devices on
> general distros.
>
> Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b4..fede5159e7f5b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
>  MODULE_FIRMWARE("qcom/a650_sqe.fw");
>  MODULE_FIRMWARE("qcom/a660_gmu.bin");
>  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> +MODULE_FIRMWARE("qcom/a660_zap.mbn");

-ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn

> +MODULE_FIRMWARE("qcom/a702_sqe.fw");
>  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
>  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");

I'm a bit sceptical here. Each device has its own zap MBN file (this
one is also a fancy named a690_zap.mbn).  Do we want to list all such
files? Consider all the vendors, which are open-source / Linux
friendly, like FairPhone, OnePlus, etc.

>  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
>  MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>
> --
> 2.45.1
>


-- 
With best wishes
Dmitry
