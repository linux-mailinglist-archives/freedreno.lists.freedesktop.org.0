Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99EE54D863
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 04:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32559113B22;
	Thu, 16 Jun 2022 02:34:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4810EE5E
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 02:34:49 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id k24so371106oij.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
 b=ggJmfGCPsbsopNVADBV2HKnPKfr9VRAHXlBBfNm/8YCMgP+0xJLx+S6W+EAH9wimOg
 JFnqPOJl3Mq1Gw2hIVLkfT2XCSJhbwydzaQl+QIZp+hadAtTrTqNsEdqknQcmn/DwqIY
 3ackF/HDy9VPD3bRAWdTXALtsPHsdsC9xMxAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
 b=PYf1LBLwkcxPven1WOwh8afzR8GNAuBr1frdPSDxjA4xt4+L/54FiSP+G4aTRGxVK9
 RZ5oR8VHP1qZ+JE1t05Ftw2rzCsQ4r+zor10pjvyr23gnHlA5ynKKdOn/UyYO7wcXBaV
 WGYnkEhFUFz9XfkF567AGW10dpN6TDOABuyR2NiO6vYVbpMEEpHP/s3qc6CzOnL/zepW
 UevCIrEVC4voHWSw1re7aJoXF6vA8qFsXrrAIxA5yAtevaWxTzrRUd0eMYzhCE7U0zW6
 Z1W3B5HFWhhi4hgjCoGWQ/A9nltxhjHnKpq6WIQfDSWHe9oy3aocHG22It4ERK7sO9PR
 eA0w==
X-Gm-Message-State: AJIora+ZM2KwLWHhtbChWiEsa/ViWf57vblu25FvJWGKRsS+rJG6YjvH
 58yaDOvyM+vfDALe83r2CkRg76dZCIpRPidJCHeHnA==
X-Google-Smtp-Source: AGRyM1sa6lplkMCFOipTd6Swl2l6u6vpT25FP3UquGCoDEY0DTPWPu6rIDvFT/FDYo/EvUHSAfEBD56GyD6Ms+JkhYQ=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1497286oib.63.1655346888488; Wed, 15
 Jun 2022 19:34:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 19:34:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 Jun 2022 19:34:47 -0700
Message-ID: <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/5] drm/msm: move KMS aspace init to the
 separate helper
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-04 17:16:04)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a37a3bbc04d9..98ae0036ab57 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
>
>  #include <linux/of_address.h>
>
> +struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
> +{
[...]
> +       }
> +
> +       aspace = msm_gem_address_space_create(mmu, "mdp_kms",
> +               0x1000, 0x100000000 - 0x1000);
> +       if (IS_ERR(aspace)) {
> +               mmu->funcs->destroy(mmu);


> +               return aspace;
> +       }
> +
> +       return aspace;

This can be 'return aspace' one time instead of two.

> +}
> +
>  bool msm_use_mmu(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
