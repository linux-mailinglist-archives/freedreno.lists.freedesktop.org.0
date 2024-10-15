Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7B199F272
	for <lists+freedreno@lfdr.de>; Tue, 15 Oct 2024 18:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2733310E5B6;
	Tue, 15 Oct 2024 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VXzX8QVI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8272A10E5B6
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 16:13:18 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c941623a5aso13870a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729008796; x=1729613596;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
 b=VXzX8QVIbhfcBtglcVel/aYDgbEGogROIV9vyPHJ7AKbtYvMz7KltiLhjiKhHWd0vN
 G9wQOF33au4He6BFXqYzY3n/aGOCKeDB8dLs98NPAT5QX6OUX3zBW6rSMa4dNNMbWy2e
 VVYET6DAD1mYWETwtqAT39wekTYgBvAAIx9tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729008796; x=1729613596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
 b=bXi2S5aZRQQREbp1yKlqoZcnzTOA9zPFg5UkEn+IQ0V4NlSL7O/fyRgsYg7ZFJZb61
 /jXwYcl1DHDpCv2j2BIcF1cdp2PPM3HuUYFYkn7cC5DeY6/qW0656Py2ETesb4kdeNjX
 5OJyuPX9vc/dN9u+khJ9say7R9/aQK4OQD3Ijp9RnTFWREz2PKk5lpsX6DA38s8EVqDt
 AGkqxwViewpzOSTLZubIhHK7uY7/5oDK6x6od9F2NcPcZ5EVa13TG3DY4UmiX/QH4gzp
 6Qqg8qGgqdnFZVkZB4P3TempKBEApnt5lTZ0jscDwNCJdg3TaAW4gjZ1+1qxurZjScCe
 FY0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4lteW8wJgO4aIG0fTe6izKPPILjciv9rz38Ai4LtnDLyH59BFAK+GbndtKvwUxblDB72kO0vxw8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWGCy+f/e/ZfjC70BkzsjDCKc/3zAiLeEe/nS7J5sf9ZJS9xn/
 jookHTCRM1abLm/WC5bIC958C3z0VQJ08Yj1fI9OhpXzFtY/gMLM66MzdyzsL0ZNZV/jELTLccq
 nVWpY
X-Google-Smtp-Source: AGHT+IFt44xxLd8ew8l4NpH5RqV8XFCjUXNSkIAT89dUcJYHwFlYiQ5SioYFM8705t0DSUyqbQtFeA==
X-Received: by 2002:a17:906:7951:b0:a9a:597:8cc9 with SMTP id
 a640c23a62f3a-a9a05978d8fmr826271966b.12.1729008796560; 
 Tue, 15 Oct 2024 09:13:16 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817576sm87105766b.130.2024.10.15.09.13.16
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 09:13:16 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso8122478a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 09:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHHyctu0ONrDFExe4Q0xMxb9FqIjJnblvuqxyyOZj5DWsvRJzU9cpqdqtJWILHjbwUkppQ4wf4zJE=@lists.freedesktop.org
X-Received: by 2002:a05:6512:a95:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53a03cc8dedmr370366e87.20.1729008378263; Tue, 15 Oct 2024
 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241015134606.5b87093e@endymion.delvare>
In-Reply-To: <20241015134606.5b87093e@endymion.delvare>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 09:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
To: Jean Delvare <jdelvare@suse.de>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 YueHaibing <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Oct 15, 2024 at 4:46=E2=80=AFAM Jean Delvare <jdelvare@suse.de> wro=
te:
>
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>
> To avoid reintroducing the randconfig bug originally fixed by commit
> 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> on OF. This is consistent with what all other DRM drivers are doing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> For regular builds, this is a no-op, as OF is always enabled on
> ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> explained before, allowing test builds only when OF is enabled
> improves the quality of these test builds, as the result is then
> closer to how the code is built on its intended targets.
>
> Changes in v3:
> * Rebase on top of kernel v6.11.
> Changes in v2:
> * Let DRM_MSM depend on OF so that random test builds won't break.
>
>  drivers/gpu/drm/display/Kconfig |    2 +-
>  drivers/gpu/drm/msm/Kconfig     |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>  config DRM_DISPLAY_DP_AUX_BUS
>         tristate
>         depends on DRM
> -       depends on OF || COMPILE_TEST
> +       depends on OF
>
>  config DRM_DISPLAY_HELPER
>         tristate
> --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> @@ -6,6 +6,7 @@ config DRM_MSM
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> +       depends on OF

Perhaps nobody landed this because you're missing the msm maintainers
as specified by `./scripts/get_maintainer.pl -f
drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
we'd at least need an Ack by those guys since this modified the
msm/Kconfig...

FWIW I haven't spent massive time studying this, but what you have
here looks reasonable. I'm happy at least with this from a DP AUX bus
perspective:

Acked-by: Douglas Anderson <dianders@chromium.org>

Presumably landing this via drm-misc makes the most sense after MSM
guys give it an Ack.


-Doug
