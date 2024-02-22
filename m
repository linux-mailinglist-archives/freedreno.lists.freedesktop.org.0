Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CD86046C
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 22:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8A10EA90;
	Thu, 22 Feb 2024 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EZET5orJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852E210EAA8
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 21:10:23 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so150893276.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708636222; x=1709241022; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KISjjhinzIu3kIcQRpPQsw9fHAQrHUvQiIbfDFbxHeA=;
 b=EZET5orJEue0up5TLMjX484VOoq+gpcHAHPv+0mT1529kCBGsZKRt2d4+tu2vqEp0f
 WucdHZD5qPQ5P+Hr8XBdCLIQcwQhsExvkZZPjsrPUMmCkj4pCWgRg4lh7oQC40BAckWJ
 KxdEQT5P3uNVMVD+RYK/kFYYSGsREA+wQad+n6jtBgTQ85+p3QZSRwH4hwahHz8D6KiF
 4TLYQxendTihdisZbEin3z7B1TAE8YZnSOULrKFMmVW0DFLhANx4M5m7LajnG/SyQiQe
 n1e9tu7KjP1QvoTdthxx9wu1NFWWouhIqg7MmbbwPMzgSvz5govXFZRbkxZ64BsH5Fyp
 3QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708636222; x=1709241022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KISjjhinzIu3kIcQRpPQsw9fHAQrHUvQiIbfDFbxHeA=;
 b=Gex826G4xO7C+EH4GAsMGdkYC8Uq2gHxiy2rxCWpdtB3yGSlzMuSDAHPOIJp66nZbB
 veE7rbXjDIhH7AdKK+cxGskg+Bnle/6YHPv3wyHKcdcEBqgIKGjHHGx0cm0Y7Iu1zQfI
 uzj6iuDc7NErVMBZjQxnlH35Tm9KQIPxTW/ZiDa/Hv+4cV6dPAxHM/a5X0N0zU0IWUcZ
 M8/yGcnSy5tG0MUGRPP9AE0XDp08dhT6huQOODTO5mQwjNaQrDQl6+RkCM5i8pjbVfb8
 qjXJ070pNe0eBcS5JDgwBoV9paPKiWdvGBTjn9WuGzH4Uwh3X68mP8gRnyZKxgbsQH9B
 K4Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVU5FCR1haKA5uWA25Zx6Cs/4yWqRbkliDC49pKvHfCb6ay8ZE0tZyWVYv353kZz9Zj8UOkygxFCvRnt60bJXNG27BDpNesDOX0wQVE1EA
X-Gm-Message-State: AOJu0YxIYrUDt1MJzRSXaET2tfhTj26Z37V0CMpt4eIKN/a5hvFClQb0
 wd6JFn+yAbGStco5OwvqUMiayabZiSXkdEidrdqdjeU2GYPHe328GcfmvycAlsEycjA3sKz61X1
 QOvsSlCj4Miwzm/UsA5yxDdR+3jExag/zdfmujQ==
X-Google-Smtp-Source: AGHT+IEBy/FkALInxvThzqnKOPLYZgoL5uV+k6buUGcPqG2FwQZGtnq6q8rWdEVgVmBapKjqMXBdOJ9HXitiHUCL6FU=
X-Received: by 2002:a25:888f:0:b0:dcc:aa1f:af3c with SMTP id
 d15-20020a25888f000000b00dccaa1faf3cmr366027ybl.40.1708636222326; Thu, 22 Feb
 2024 13:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-4-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:10:11 +0200
Message-ID: <CAA8EJpoPaknqPUEg8p37Nh1MV62Cr8fH+MxE-1b+T-8h3BmO9Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, stable@vger.kernel.org
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> A recent DRM series purporting to simplify support for "transparent
> bridges" and handling of probe deferrals ironically exposed a
> use-after-free issue on pmic_glink_altmode probe deferral.
>
> This has manifested itself as the display subsystem occasionally failing
> to initialise and NULL-pointer dereferences during boot of machines like
> the Lenovo ThinkPad X13s.
>
> Specifically, the dp-hpd bridge is currently registered before all
> resources have been acquired which means that it can also be
> deregistered on probe deferrals.
>
> In the meantime there is a race window where the new aux bridge driver
> (or PHY driver previously) may have looked up the dp-hpd bridge and
> stored a (non-reference-counted) pointer to the bridge which is about to
> be deallocated.
>
> When the display controller is later initialised, this triggers a
> use-after-free when attaching the bridges:
>
>         dp -> aux -> dp-hpd (freed)
>
> which may, for example, result in the freed bridge failing to attach:
>
>         [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
>
> or a NULL-pointer dereference:
>
>         Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>         ...
>         Call trace:
>           drm_bridge_attach+0x70/0x1a8 [drm]
>           drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
>           drm_bridge_attach+0x80/0x1a8 [drm]
>           dp_bridge_init+0xa8/0x15c [msm]
>           msm_dp_modeset_init+0x28/0xc4 [msm]
>
> The DRM bridge implementation is clearly fragile and implicitly built on
> the assumption that bridges may never go away. In this case, the fix is
> to move the bridge registration in the pmic_glink_altmode driver to
> after all resources have been looked up.
>
> Incidentally, with the new dp-hpd bridge implementation, which registers
> child devices, this is also a requirement due to a long-standing issue
> in driver core that can otherwise lead to a probe deferral loop (see
> fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
>
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Fixes: 2bcca96abfbf ("soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
