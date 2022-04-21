Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86676509928
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 09:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0606A10F614;
	Thu, 21 Apr 2022 07:33:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6034710F60B
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 07:33:08 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f19fdba41fso43000977b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01V9WHfUB3GGGFgehY872SwuaOw81Y+TRiEAg/cxRoI=;
 b=f/h7k843egqrQZhRWhF0bbr2W5hN018OVFFQFjvMpgYB8SefO//l95w7e6sEoNNUB+
 hMKSrNI3cDvqbLn2cBHT+AILSYEcL8oJPpCOxUeoUfMw/ssHMfV6baHKGHS32hJwW6L7
 SqhRyXNeyAGwQCbwZWoaqLtmQb+qa7PPzheh9K5VK4+ES6eqpC/2VttNlJZ2prmwICdm
 WLftkFi14uJc3IjLT9AIvWU1nQJpXJlVLzqDSkx5vDR08js7jZvFt4/rK4cSI6UFvjxZ
 iJRBL4kMZxjNuwQmeFGUKz5y7riuORNfQ92+/7bUqhY4uB5MsNhOxNQPNoUsQMOhN+Ku
 8ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01V9WHfUB3GGGFgehY872SwuaOw81Y+TRiEAg/cxRoI=;
 b=l9WZhzlKJjlLQhHWnoL/4O8a9iEMSXaVm+9D1gHoHbb7n0XiAMeYY09WQRaeRnCQk0
 SwWCzZlSE/gUBvfblg2Lo3N8CQetNJYtPx8iXfkZkgUyg3VUcakkFkFg7eqRnW2aaRDU
 XfENylxsN1ZEe4VlEz78RG3P51DlxNa2oyWj5MvgjnypAoz3uYgFSLpdpz4bYPX3iAMp
 X7khgOgtxISYsulo7ZOzGfl+t8z52+l+ZmqMUgFqNyLjpzICqdVL4hM1sWgH+QFZFGRj
 eb4f8yCs/V30uxW+uvidOVOjKtGVB9isIoYcaLFxToxxFZv74ZAs+3IiQK/VlKer/lUj
 cxrA==
X-Gm-Message-State: AOAM530b27TNgXKZNL9bgG14vf0Yif1b2MWnuAV2LlmfRJGhC69K2fFX
 9kNAC6jZit+riU7hYJK7C2bvRb8G+cjWr6nGXY5loA==
X-Google-Smtp-Source: ABdhPJw+7ckzgrh6al+UN7Bu6MiNCZxJJLZO6KmttTiFaNakhX/Mj8ctJSL8sj83GvFCo6mI0AMdk3Ezy3LEPb2Qajg=
X-Received: by 2002:a81:1ec6:0:b0:2ec:1907:9ed9 with SMTP id
 e189-20020a811ec6000000b002ec19079ed9mr25584961ywe.490.1650526387521; Thu, 21
 Apr 2022 00:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650498587-14749-10-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1650498587-14749-10-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Apr 2022 10:32:56 +0300
Message-ID: <CAA8EJpo5XhNq68yb8KwJmo=Dch67O0Qt4uPP0Zp5CmVX8XLfCg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 09/18] drm/msm/dpu: add changes to
 support writeback in hw_ctl
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
> Add changes to support writeback module in the dpu_hw_ctl
> interface.
>
> changes in v3:
>         - read the intf_active and wb_active before writing
>           to preserve existing bits
>         - add the update_pending_flush_wb for non-v1 targets
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 54 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 15 ++++++++-
>  2 files changed, 65 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 524f024..67522ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #include <linux/delay.h>
> @@ -23,10 +24,12 @@
>  #define   CTL_SW_RESET                  0x030
>  #define   CTL_LAYER_EXTN_OFFSET         0x40
>  #define   CTL_MERGE_3D_ACTIVE           0x0E4
> +#define   CTL_WB_ACTIVE                 0x0EC
>  #define   CTL_INTF_ACTIVE               0x0F4
>  #define   CTL_MERGE_3D_FLUSH            0x100
>  #define   CTL_DSC_ACTIVE                0x0E8
>  #define   CTL_DSC_FLUSH                0x104
> +#define   CTL_WB_FLUSH                  0x108
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -38,6 +41,7 @@
>  #define  MERGE_3D_IDX   23
>  #define  DSC_IDX        22
>  #define  INTF_IDX       31
> +#define WB_IDX          16
>  #define CTL_INVALID_BIT                 0xffff
>  #define CTL_DEFAULT_GROUP_ID           0xf
>
> @@ -135,6 +139,9 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>         if (ctx->pending_flush_mask & BIT(INTF_IDX))
>                 DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>                                 ctx->pending_intf_flush_mask);
> +       if (ctx->pending_flush_mask & BIT(WB_IDX))
> +               DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
> +                               ctx->pending_wb_flush_mask);
>
>         DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>  }
> @@ -255,6 +262,26 @@ static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
>         }
>  }
>
> +static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
> +               enum dpu_wb wb)
> +{
> +       switch (wb) {
> +       case WB_0:
> +       case WB_1:
> +       case WB_2:
> +               ctx->pending_flush_mask |= BIT(WB_IDX);
> +       default:
> +               break;
> +       }
> +}
> +
> +static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
> +               enum dpu_wb wb)
> +{
> +       ctx->pending_wb_flush_mask |= BIT(wb - WB_0);
> +       ctx->pending_flush_mask |= BIT(WB_IDX);
> +}
> +
>  static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>                 enum dpu_intf intf)
>  {
> @@ -504,6 +531,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
>         u32 intf_active = 0;
> +       u32 wb_active = 0;
>         u32 mode_sel = 0;
>
>         /* CTL_TOP[31:28] carries group_id to collate CTL paths
> @@ -520,10 +548,18 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>                 mode_sel |= BIT(17);
>
>         intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
> -       intf_active |= BIT(cfg->intf - INTF_0);
> +       wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
> +
> +       if (cfg->intf)
> +               intf_active |= BIT(cfg->intf - INTF_0);
> +
> +       if (cfg->wb)
> +               wb_active |= BIT(cfg->wb - WB_0);
>
>         DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>         DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> +       DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
> +
>         if (cfg->merge_3d)
>                 DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>                               BIT(cfg->merge_3d - MERGE_3D_0));
> @@ -546,6 +582,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>                 intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>         }
>
> +       if (cfg->wb)
> +               intf_cfg |= (cfg->wb & 0x3) + 2;
> +
>         switch (cfg->intf_mode_sel) {
>         case DPU_CTL_MODE_SEL_VID:
>                 intf_cfg &= ~BIT(17);
> @@ -568,12 +607,13 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
>         u32 intf_active = 0;
> +       u32 wb_active = 0;
>         u32 merge3d_active = 0;
>
>         /*
>          * This API resets each portion of the CTL path namely,
>          * clearing the sspps staged on the lm, merge_3d block,
> -        * interfaces etc to ensure clean teardown of the pipeline.
> +        * interfaces , writeback etc to ensure clean teardown of the pipeline.
>          * This will be used for writeback to begin with to have a
>          * proper teardown of the writeback session but upon further
>          * validation, this can be extended to all interfaces.
> @@ -592,6 +632,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>                 intf_active &= ~BIT(cfg->intf - INTF_0);
>                 DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>         }
> +
> +       if (cfg->wb) {
> +               wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
> +               wb_active &= ~BIT(cfg->wb - WB_0);
> +               DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
> +       }
>  }
>
>  static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> @@ -622,11 +668,13 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>                         dpu_hw_ctl_update_pending_flush_intf_v1;
>                 ops->update_pending_flush_merge_3d =
>                         dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> +               ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
>         } else {
>                 ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>                 ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>                 ops->update_pending_flush_intf =
>                         dpu_hw_ctl_update_pending_flush_intf;
> +               ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
>         }
>         ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
>         ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index c61a8fd..df8f8e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #ifndef _DPU_HW_CTL_H
> @@ -44,6 +45,7 @@ struct dpu_hw_stage_cfg {
>   */
>  struct dpu_hw_intf_cfg {
>         enum dpu_intf intf;
> +       enum dpu_wb wb;
>         enum dpu_3d_blend_mode mode_3d;
>         enum dpu_merge_3d merge_3d;
>         enum dpu_ctl_mode_sel intf_mode_sel;
> @@ -102,6 +104,15 @@ struct dpu_hw_ctl_ops {
>                 u32 flushbits);
>
>         /**
> +        * OR in the given flushbits to the cached pending_(wb_)flush_mask
> +        * No effect on hardware
> +        * @ctx       : ctl path ctx pointer
> +        * @blk       : writeback block index
> +        */
> +       void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
> +               enum dpu_wb blk);
> +
> +       /**
>          * OR in the given flushbits to the cached pending_(intf_)flush_mask
>          * No effect on hardware
>          * @ctx       : ctl path ctx pointer
> @@ -199,6 +210,7 @@ struct dpu_hw_ctl_ops {
>   * @mixer_hw_caps: mixer hardware capabilities
>   * @pending_flush_mask: storage for pending ctl_flush managed via ops
>   * @pending_intf_flush_mask: pending INTF flush
> + * @pending_wb_flush_mask: pending WB flush
>   * @ops: operation list
>   */
>  struct dpu_hw_ctl {
> @@ -212,6 +224,7 @@ struct dpu_hw_ctl {
>         const struct dpu_lm_cfg *mixer_hw_caps;
>         u32 pending_flush_mask;
>         u32 pending_intf_flush_mask;
> +       u32 pending_wb_flush_mask;
>         u32 pending_merge_3d_flush_mask;
>
>         /* ops */
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
