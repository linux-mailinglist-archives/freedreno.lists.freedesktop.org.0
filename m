Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F69509911
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C2010F541;
	Thu, 21 Apr 2022 07:29:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5243B10F408
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 07:29:35 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ec0bb4b715so42885367b3.5
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrcEdrXVlj4r5RH4ReRK52xz6L0DjBEq+2BFbr6VjJA=;
 b=m4RzDIdaTXtzt4QTZ6PzHwPZ8L51qyWQsDjJuiEvzVIBTHmEjxE9kTTFXr4AJJ+mFH
 Q8SthNSXe+bywwgaDVJHcgV1NoVKLNbxogEgqOJj67LR58SZhit8gAbJttvzBdXCmKzW
 3JufaUxpYhfTyupcrgTiKwQORYbLVZO89OaFFzmgX3ebZjYOiIozQ82y9w3B8psgvPrY
 U05uplj2G45QbCMg8iQ4IrERPFdwMJzEt37B71YUW2Q/35VlZI3atHKSoqrela/daB7m
 6IjQ0xEpk4eqn4wIprwJs66tLqa/9fYuujgFeps+RCcg7YReYWWLtQMXibTy7wzBRwlP
 dWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrcEdrXVlj4r5RH4ReRK52xz6L0DjBEq+2BFbr6VjJA=;
 b=b0KETx34fT0U0KVsKPyPl30+BfH23JE9s/0cqpO1E17bZG5fgzAM2WXHtpGYI2JtTo
 Xa2M2tDAS8uj73F1TTQb6yqQcNQTEMIOejpxZNTMom5kchtFZtL0hiTRXZnCWA0ZY0h4
 rPwoT2mnfdLfxfGE4Sfn5hAXyisLc1exHOf+wUnTxiGOYeEpYKGEuQcD0ZcjDMPtRuGm
 ffzTCWLJdrEHp46VgBz4FJk6A5/uPQ2g3gu0axAL07KoojCaugLvwFmqeAWXCAJlq44f
 0zue2yn5VfBQ4c8vL2okbDbDXEk0Lsq4A6DwnVeZ2C2hxo1ToNRcF2g57De0w7HSLbYt
 kFLA==
X-Gm-Message-State: AOAM530IMzFv/z3bCtxa3vYNZ5+3IXbf3Q+h8aqdWhc4EIiylEPPH2BQ
 SqI1fMLFCprTiNJhF3s+sUjAJzZ//u5HD3Ax5OrIww==
X-Google-Smtp-Source: ABdhPJywLuWSZ7nSMMuRfA1YD223SvDFYfG1uC8J5gYCBYe5ARjfhy1HCAOW1WKUZRT0HsIT5KOhnetCvJxg3w2+GQM=
X-Received: by 2002:a81:650:0:b0:2f4:cc5b:c510 with SMTP id
 77-20020a810650000000b002f4cc5bc510mr4282247ywg.113.1650526174540; Thu, 21
 Apr 2022 00:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650498587-14749-9-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1650498587-14749-9-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Apr 2022 10:29:23 +0300
Message-ID: <CAA8EJprKnTOUFiyq-0Se5yg6a=2_sREXK6O8Yd=LYZvS1rvnjw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 08/18] drm/msm/dpu: add writeback blocks
 to DPU RM
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 at 02:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add writeback blocks to DPU resource manager so that
> the encoders can directly request them through RM.
>
> changes in v3:
>         - use IS_ERR() instead of IS_ERR_OR_NULL()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 12 ++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0e6634b..06f03e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -9,6 +9,7 @@
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_pingpong.h"
>  #include "dpu_hw_intf.h"
> +#include "dpu_hw_wb.h"
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_merge3d.h"
>  #include "dpu_hw_dsc.h"
> @@ -87,6 +88,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                 }
>         }
>
> +       for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
> +               dpu_hw_wb_destroy(rm->hw_wb[i]);
> +
>         return 0;
>  }
>
> @@ -186,6 +190,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->hw_intf[intf->id - INTF_0] = hw;
>         }
>
> +       for (i = 0; i < cat->wb_count; i++) {
> +               struct dpu_hw_wb *hw;
> +               const struct dpu_wb_cfg *wb = &cat->wb[i];
> +
> +               if (wb->id < WB_0 || wb->id >= WB_MAX) {
> +                       DPU_ERROR("skip intf %d with invalid id\n", wb->id);
> +                       continue;
> +               }
> +
> +               hw = dpu_hw_wb_init(wb->id, mmio, cat);
> +               if (IS_ERR(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed wb object creation: err %d\n", rc);
> +                       goto fail;
> +               }
> +               rm->hw_wb[wb->id - WB_0] = hw;
> +       }
> +
>         for (i = 0; i < cat->ctl_count; i++) {
>                 struct dpu_hw_ctl *hw;
>                 const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 32e0d8a..ba82e54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -19,6 +19,7 @@ struct dpu_global_state;
>   * @mixer_blks: array of layer mixer hardware resources
>   * @ctl_blks: array of ctl hardware resources
>   * @hw_intf: array of intf hardware resources
> + * @hw_wb: array of wb hardware resources
>   * @dspp_blks: array of dspp hardware resources
>   */
>  struct dpu_rm {
> @@ -26,6 +27,7 @@ struct dpu_rm {
>         struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>         struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>         struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
> +       struct dpu_hw_wb *hw_wb[WB_MAX - WB_0];
>         struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>         struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>         struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> @@ -96,5 +98,15 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
>         return rm->hw_intf[intf_idx - INTF_0];
>  }
>
> +/**
> + * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
> + * @rm: DPU Resource Manager handle
> + * @wb_idx: WB index
> + */
> +static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_intf wb_idx)
> +{
> +       return rm->hw_wb[wb_idx - WB_0];
> +}
> +
>  #endif /* __DPU_RM_H__ */
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
