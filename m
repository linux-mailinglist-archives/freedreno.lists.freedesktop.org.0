Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7F589F06
	for <lists+freedreno@lfdr.de>; Thu,  4 Aug 2022 17:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8CB9D2A7;
	Thu,  4 Aug 2022 15:59:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB214BB81
 for <freedreno@lists.freedesktop.org>; Thu,  4 Aug 2022 15:58:57 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id u8so13370838qvv.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EOSA1ipEONvwIiVLkOm/G9KBqxDibYTA7jNR8f2wzec=;
 b=gcrPbowTAuzSl9SbjvQe1FKQqld1ecqy5j7CS0sx5zQuLiI3VZJe1prue31K/0stWm
 Rp3FxCsiy2ySSrddcbf5JH2OXIcPPvN9D4boR20fCm2FPXuDWyKi5tAwhH8gjwjeOYwH
 uGeorse+1TpqaQUIrukoZgJIv5mHVfEGJgf5FCqOiv/+TinOIXKmJInR0ETyCt8wR26H
 jSVTH+aI93BwwZPbCEkaBDHsROhryLw4d9HxRKyAGTimHMk1Bd2eiQ+r4fZr3rQyl8Xl
 9T8Cs8XRIpwlJ1huAH2IVBP0Hzy8jOErlvh0+9FbNgfyMQMnYBhrLRsZGQGrwNMTP6ZO
 Qtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EOSA1ipEONvwIiVLkOm/G9KBqxDibYTA7jNR8f2wzec=;
 b=4LBwCtP3vYImK5VQjpCWcNT76Qxmi1WbMK1LUwmbMoMZdzQDqyqjG7of1JMppuxwtT
 f9EqQ3ElV8d1mjxV7y1vSFDmMb9nzCKYhEzAuprioN3BOEdH85EOEikOiM8RHryauHU8
 iVOp5gfjTxPJaOpyzjtD+yl2JEJpBZPoRSyjTwmDhNlUPSA+KawXBw01rBenwhG80/rs
 TmGxJaK7/38IUB2SIDVmPzZKYynbyrbZ4TwZi5vtwlGYzRBgCNqjIumGDjXsY1+J41fK
 mw1RhsxHs9m73tdG0nJu+8DMhTPEKoE8NYtbJupbpA/SI1f0ZDl4GBJndpvTMG7SI2+S
 yhxw==
X-Gm-Message-State: ACgBeo04SiKBsXOcaceBu/ydP7zigiEmprWfcCt+KKMzyLLV8CLfeUF7
 F3LcVEj56EdGJtEcdGN4H61vkaLgXKBzWw3Ao3LOQA==
X-Google-Smtp-Source: AA6agR6+YdOKJ3iA6PLFxLLlTu/AXklKS7TWLL/OmCuTdauV3zrKiLw1M2MqSlUN9lnT2A75AmbQ131YSys+8AunwuI=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr2124165qvb.55.1659628736233; Thu, 04
 Aug 2022 08:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Aug 2022 18:58:45 +0300
Message-ID: <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: add support for
 hierarchical flush for dspp in sc7280
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
Cc: devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 swboyd@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 13:29, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

I'd like to land at least patches 6-8 from [1] next cycle. They clean
up the CTL interface. Could you please rebase your patch on top of
them?

[1] https://patchwork.freedesktop.org/series/99909/

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 40 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  3 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  7 +++++
>  6 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558..4eca317 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -703,6 +703,10 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>                 mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
>                         mixer[i].hw_dspp->idx);
>
> +               if(ctl->ops.set_dspp_hierarchical_flush)
> +                       ctl->ops.set_dspp_hierarchical_flush(ctl,
> +                                               mixer[i].hw_dspp->idx, DSPP_SUB_PCC);
> +
>                 /* stage config flush mask */
>                 ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 021eb2f..3b27a87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -58,7 +58,10 @@
>         (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>
>  #define CTL_SC7280_MASK \
> -       (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +       (BIT(DPU_CTL_ACTIVE_CFG) | \
> +        BIT(DPU_CTL_FETCH_ACTIVE) | \
> +        BIT(DPU_CTL_VM_CFG) | \
> +        BIT(DPU_CTL_HIERARCHICAL_FLUSH))
>
>  #define MERGE_3D_SM8150_MASK (0)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b85b24b..7922f6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -185,6 +185,7 @@ enum {
>   * @DPU_CTL_SPLIT_DISPLAY:     CTL supports video mode split display
>   * @DPU_CTL_FETCH_ACTIVE:      Active CTL for fetch HW (SSPPs)
>   * @DPU_CTL_VM_CFG:            CTL config to support multiple VMs
> + * @DPU_CTL_HIERARCHICAL_FLUSH: CTL config to support hierarchical flush
>   * @DPU_CTL_MAX
>   */
>  enum {
> @@ -192,6 +193,7 @@ enum {
>         DPU_CTL_ACTIVE_CFG,
>         DPU_CTL_FETCH_ACTIVE,
>         DPU_CTL_VM_CFG,
> +       DPU_CTL_HIERARCHICAL_FLUSH,
>         DPU_CTL_MAX
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 3584f5e..b34fc30 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -28,6 +28,8 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> +#define   CTL_DSPP_0_FLUSH             0x13C

Please change to CTL_DSPP_n_FLUSH(n).

> +
>
>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>  #define CTL_FLUSH_MASK_CTL              BIT(17)
> @@ -292,6 +294,36 @@ static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
>         return flushbits;
>  }
>
> +static uint32_t dpu_hw_ctl_get_bitmask_dspp_v1(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp)
> +{
> +       return BIT(29);
> +}
> +
> +static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active = 0;
> +
> +       switch (dspp_sub_blk) {
> +       case DSPP_SUB_IGC:
> +               flushbits = BIT(2);
> +               break;
> +       case DSPP_SUB_PCC:
> +               flushbits = BIT(4);
> +               break;
> +       case DSPP_SUB_GC:
> +               flushbits = BIT(5);
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       active = DPU_REG_READ(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1) * 4));

So that this line will be simpler to read.

> +
> +       DPU_REG_WRITE(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1) * 4), active | flushbits);
> +}
> +
>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -600,7 +632,13 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>         ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>         ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
>         ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
> -       ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
> +       if (cap & BIT(DPU_CTL_HIERARCHICAL_FLUSH)) {
> +               ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp_v1;

We have used _v1 for active CTLs. What is the relationship between
CTL_HIERARCHILCAL_FLUSH and active CTLs?

> +               ops->set_dspp_hierarchical_flush = dpu_hw_ctl_set_dspp_hierarchical_flush;
> +       } else {
> +               ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
> +       }
> +
>         if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>                 ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ac15444..8ecab91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
>         uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
>                 enum dpu_dspp blk);
>
> +       void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
> +               enum dpu_dspp blk, enum dpu_dspp_sub_blk dspp_sub_blk);

The word "hierarchical" means particular (internal) implementation.
Please change to something like set_dspp_block_flush().
Or with [2] in place, it can be hidden in the
update_pending_flush_dspp() function. Just pass the subblock to the
function and let the dpu_hw_ctl care about it.

[2] https://patchwork.freedesktop.org/patch/473159/?series=99909&rev=1


> +
>         /**
>          * Set all blend stages to disabled
>          * @ctx       : ctl path ctx pointer
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index bb9cead..561e2ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -166,6 +166,13 @@ enum dpu_dspp {
>         DSPP_MAX
>  };
>
> +enum dpu_dspp_sub_blk{
> +       DSPP_SUB_PCC = 1,
> +       DSPP_SUB_IGC,
> +       DSPP_SUB_GC,
> +       DSPP_SUB_MAX
> +};

I'd prefer if we can use DPU_DSPP_* definitions instead.

> +
>  enum dpu_ctl {
>         CTL_0 = 1,
>         CTL_1,



-- 
With best wishes
Dmitry
