Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A68A7E02
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 10:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010E91132B3;
	Wed, 17 Apr 2024 08:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ykCPEj4D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153A1132B3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 08:19:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-617d25b2bc4so58361587b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713341950; x=1713946750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
 b=ykCPEj4DbBor3xv2NMdpyodV0tTLHEBUWcoAiHAj9mNr5rvZUkho90IFgfvVeQP6i1
 e9xsq1ppd9+Qq8b8GXizS7whXgHZ35FaI3kPJtAWOVK6UzjrYcBbepMTWYxA8TCKrzbu
 5w1ghY1QjFnjrWgftuPdEcDlLV2inArs++ux2s7kEjJxuqNbDD+cp4B8sIPgdofLtAi9
 vITMs3/rwMLsItwFZIRTFsCQx3Jx6+a5y+HiZ1hrrMV3y/XcjkX8ysV08Vk1eHI4fBMw
 LnLdCxT68EibGRKQAcyrd30zqxYcey53/VaGq4q8EOrArjeK76+1HbTyCXPZKF6FFssu
 we0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341950; x=1713946750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
 b=SsOfE09DfSu3OZ95yQuP5VM7zx/QEWnT77M4nEBc+8s4hbjI7rLNePZ/lQT6hLQDim
 1FTjRO8Ow9GXBwN6B9hnq9LHuAtZAzilUmmPkNvg2/FT7v+38eXOt4St1+h++jOaA7tX
 1MOhpN7Fc5peEKLtlF2PNglaFHnmowqSSFNoni8TGXWEbD8ph8o0fpqjAAz12J+xFPlA
 9S8vQvJdD/tR31Fxv7qaMJB2npcwoITFucs0IXFhqhxnmiUlOuxNdRBuDks30m/DVCsx
 +NV0I2iXNZwPcXQKPyadPVecv4Djou7sM5CQg0CFYYJZzBnh5IiBi36P96MxC6+fCEEI
 HDpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxQ3GzXj8+5izL66Z6luBO0rdo7pHFaVoXKpH+gGKMECeS+lbuw+37VRqIykZM+g835UFAhgyH6NX8AHmJ1uZ5Jjwnez311NkZdea+nXNQ
X-Gm-Message-State: AOJu0Yyw8Vfm39kOS9P5ugRiXP++P6dZOLuwVkvNtj7xYlOcbgXas/Ec
 pJusPoYYUC89CvKYZH9BHgMQTITqH3JS+e9Ti47j/zwN2qUewz5aYhtkIKN+Alrk8k4Uaa9Az1l
 rKUtIfIs99zu1MpmOOsHmqFYKsjsaN5wkAp9CDw==
X-Google-Smtp-Source: AGHT+IE2lKg2BSkdW3aFZxTMV4gr/x3dbq3U7YbGvWBPNOlVvmP5HPCh/lfty+hy19RjhqRJv46ueaHdDZUJSm/+bS0=
X-Received: by 2002:a81:430f:0:b0:615:1e99:bd6e with SMTP id
 q15-20020a81430f000000b006151e99bd6emr14355086ywa.35.1713341949713; Wed, 17
 Apr 2024 01:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 11:18:58 +0300
Message-ID: <CAA8EJpry5Gct7Q2sAwFBVYV163X9BOcuKu9So47FEJaeXcdSaQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/dsi: Set PHY usescase before registering DSI
 host
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Ordering issues here cause an uninitalized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
>
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
>
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index af2a287cb3bd..17f43b3c0494 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -85,6 +85,17 @@ static int dsi_mgr_setup_components(int id)
>                                                         msm_dsi : other_dsi;
>                 struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>                                                         other_dsi : msm_dsi;
> +
> +               /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode.
> +                *
> +                * Set the usecase before calling msm_dsi_host_register() to prevent it from
> +                * enabling and configuring the usecase (which is just a mux bit) first.
> +                */
> +               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +                                       MSM_DSI_PHY_MASTER);
> +               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +                                       MSM_DSI_PHY_SLAVE);
> +
>                 /* Register slave host first, so that slave DSI device
>                  * has a chance to probe, and do not block the master
>                  * DSI device's probe.
> @@ -100,10 +111,6 @@ static int dsi_mgr_setup_components(int id)
>                         return ret;
>
>                 /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -                                       MSM_DSI_PHY_MASTER);
> -               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -                                       MSM_DSI_PHY_SLAVE);
>                 msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>                 msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);

Please move msm_dsi_host_set_phy_mode() calls too. Also please update
the non-bonded case.

>         }
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
