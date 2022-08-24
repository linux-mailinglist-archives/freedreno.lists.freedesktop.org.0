Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34495A0069
	for <lists+freedreno@lfdr.de>; Wed, 24 Aug 2022 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C829AA168D;
	Wed, 24 Aug 2022 17:30:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF56BE51A
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 17:30:39 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so21690464fac.9
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
 b=fcQ5BKX6CF1pB0Q5K+QtelbSTU2ihxqxPUnaPzIVR0MQ/vdL6bmvl5OMW4nPfeQxcI
 xjTPKRTjCubgelgY+XlCapqkiKrgDLZc9Iv5SNleO0KO7Xz048d0ap823yKYrg0UJOiT
 m2Rf5yz4zgPncnzKbEPPJipiprzWzx6yl5n2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
 b=h7Zv9y29VjCfIPr50nXbSPPCjCa9Dj290aj2awJyf/QYZPb3SC2qP4HGt2nCeu6bL6
 Hku54vGVUXyunPB6jNC3l6UIsdaO2X3o8Q6xZ29cYFqT0mDW/SBgWHnoreZpwMIHuhU3
 XMSzXBni7/u5WWJbHoSRqPDttgnu2KWpt7rlYxv94Pq5CUXwhFZvGYzrm21YmSi+8Fvs
 5ju9uj7myMCsN0b/vdqne/2RTjtbbJfxUhelSjp6AqMXwskjOdzwBXA/0GLtf6BieD1M
 NgUNFcqcEk21ibAhKbAh6CHEZaVr8okEHBfzFkQ4IO+l2tz5wirY4/ht+SFdhoSmzoMr
 207g==
X-Gm-Message-State: ACgBeo3G4VMz+yUj6AZ54hhnY5qnFcIADQsCmGruYVf+h+MCEaqxcw9Y
 JrId7iUBX7k2LbeZFjiwmj2tuI7vbKhbodNbPtMtfg==
X-Google-Smtp-Source: AA6agR7QDhwW4ErLZ7pKcygsrPIJ67UAWeCMGbJtFeUUkR9yxPnuX6YfLksltT67IRMFVnSMhpLZXdZbOmpszg5JuT8=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr91633oab.0.1661362239159; Wed, 24 Aug
 2022 10:30:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:30:38 -0500
MIME-Version: 1.0
In-Reply-To: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 24 Aug 2022 12:30:38 -0500
Message-ID: <CAE-0n50wZkb5sYcZ2g+4L3S7OAYAti+5GEaBDZfANyOJCF3JzA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-24 10:22:31)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> eviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing an R.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7257515..676279d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -431,7 +431,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>
>         if (rate == link_rate_hbr3)
>                 pixel_div = 6;
> -       else if (rate == 1620000 || rate == 270000)
> +       else if (rate == 162000 || rate == 270000)

BTW

  $ git grep 162000 -- drivers/gpu/drm/msm/dp/
  drivers/gpu/drm/msm/dp/dp_catalog.c:    else if (rate == 1620000 ||
rate == 270000)
  drivers/gpu/drm/msm/dp/dp_ctrl.c:
ctrl->link->link_params.rate = 162000;
  drivers/gpu/drm/msm/dp/dp_ctrl.c:       case 162000:

We really should have a #define for these things. Can you send a
different followup patch that makes something like HBR3_KHZ, HBR2_KHZ,
etc. and then replaces these bare numbers throughout the driver? That
would prevent this from happening again. This one liner can and should
be backported to stable trees.
