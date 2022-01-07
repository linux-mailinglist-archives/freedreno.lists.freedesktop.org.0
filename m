Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79893486FB3
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 02:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238EA10E740;
	Fri,  7 Jan 2022 01:27:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2973110E744
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 01:27:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 h5-20020a9d6a45000000b005908066fa64so4166339otn.7
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 17:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
 b=mEC7vPS5TCGs6eV1fpNRUln7/hyrdk36yWS/g33sqDr4/XwyVkqxbXGSd9fKIdAfMd
 ASWLNeX7JfjF9ehKRCeDDu966GIdoq9EgIvQjqemqQ2YQEVMdPbGdo09Y3SOzAftRR+Z
 IWFM0iZ8hKS29BHp4Y4WgrgRFSs5MjXzl3wXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
 b=ZU4f6ImJyWH+2+tbfzUIq4x5Ax99O+V10MyzaPACtCagT6iYT8EL8jmDN7kdmHonyU
 lrdq12virLiSmOBRwwu3Xol7Q+6xky9RZmKvnvDGqTpQEfwWQjUdSlDIRcKbxqvbUbiH
 rvqAexd8R07F2KzQdLEE86aZ8Zr3jJQXUMIOxFotQFs6UVV/Qed89WX1pbD7i5sEC1Fo
 nRvI6+RfdR7LCuDDFYVrbRn6XSsdJEJAMkrpAHybuYvNxTwOY67ooqzq1cJU1P5MQ7m+
 fYQS6R1t8Z1+kPhwOQ2hU4KcjMbzSXQZny6xQu6Sp9Rv5xGI1PTKPatLe02jAIynWNWh
 UlZQ==
X-Gm-Message-State: AOAM530hCjWSmk6wpL5KSzTY72DmCb8CO9AyPPnHiYnO3n2sPPuNloWA
 fdgWmY01ORD3s4x6q/0r6HGGCQdj+F5r0awQIFgDqw==
X-Google-Smtp-Source: ABdhPJwKfFHMBlJIJaY2hsxyem1OasEe1YK5DAXLA5bYWAjzbIzZYfCNh/D+Sq9/WeskQdSq2rBFMT/L0TS4FZx/DOg=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr43194959ota.126.1641518862462; 
 Thu, 06 Jan 2022 17:27:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:27:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:27:42 -0800
Message-ID: <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks
 handling to dpu_rm
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:31)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bf4d72356a12..2301ac114920 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                 if (rm->hw_intf[i])
>                         dpu_hw_intf_destroy(rm->hw_intf[i]);
>         }
> +       for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
> +               if (rm->hw_vbif[i])
> +                       dpu_hw_vbif_destroy(rm->hw_vbif[i]);

Maybe drop this check and pass NULL to dpu_hw_vbif_destroy() sometimes?
Then the check can be omitted and the braces dropped

> +       }
>
>         return 0;
>  }
> @@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>         }
>
> +       for (i = 0; i < cat->vbif_count; i++) {
> +               struct dpu_hw_vbif *hw;
> +               const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
> +
> +               if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
> +                       DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
> +                       continue;
> +               }
> +               hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
> +               if (IS_ERR_OR_NULL(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed vbif object creation: err %d\n", rc);
> +                       goto fail;

If it's NULL then rc will be 0 and fail will return 0. Is that
intentional?

> +               }
> +               rm->hw_vbif[vbif->id - VBIF_0] = hw;
> +       }
> +
>         return 0;
>
>  fail:
