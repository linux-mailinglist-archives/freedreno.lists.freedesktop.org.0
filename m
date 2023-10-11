Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B17C543D
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 14:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD8C10E7B1;
	Wed, 11 Oct 2023 12:46:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CBE10E7B8
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 12:46:01 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a7dafb659cso10832877b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028360; x=1697633160; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2o0g9qCTG3HoWvcTZG921t8fsHcZPOC6eWWcKbXQ7nM=;
 b=LQ1cihoc4ECbpvw4BYDioR/5wCscUbJ/YeumWI5Bfp71huY1FLMfFunzNhPDSWtFLl
 rsTfWsGH5MRUfh3X321AA+l07cw4T/xf/I4aeu2twibY57sNM1WH5/NIKRSRycyK/JRz
 cHiwci2duFP3O5Ky2RqdK1WCgTF4G71ahsANEWgb6++GieveCJMNpGi16iqHahPLASHD
 IGVCx+IIBPSlqGFBhpseOnsdOmuKZCFj0tswUWBDevMeFyc/bu+89ZEDmrwBtSt80Lto
 e7fnJFnAPKJapWb4BJfoqKThmWk3/8HLyXDlcNTxGlpkGKzVONcSpC5LPE2iXg/3vpU1
 noFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028360; x=1697633160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2o0g9qCTG3HoWvcTZG921t8fsHcZPOC6eWWcKbXQ7nM=;
 b=iYxAGhibjLpnALowt/keljm3Sq2CLWoHvaqYvZ6MjVyHYcZ/uNKEqi2WwsH3R71IN7
 kwysufqSx4o7u1I5Qixhd/lUTxRFiNd2M16OTDnJa8ImCXtktBulZCX9E2piJAP5sA/b
 I46tlgPSg62EjUeVLUc9Au9qlHG4xUh8tgr4mLopFec8kcn9hTCImcP5vc1FlM6uDQht
 2dU1nv746JFodBjBzi6suNswtiAic+UK5ht/ozIrBbpqPr7+ShornAV3QN82kDPVedEf
 9Re9zkWsMN818GKRCZtBVRFnQ1U/w+r0PR7BjhmhuI1NLJAQpeozyxQZF1/ViBFyjYW+
 LtPA==
X-Gm-Message-State: AOJu0YwGJKVuywebFLgeiH1+xiLtbOn1v0tBiFduO7k2kUPOKDht8pr6
 jk+URz0ZPKzB3N7hRwUWV/Ucvf0+Jp33SWLmZx9NOw==
X-Google-Smtp-Source: AGHT+IEmXXTmgu0PhQyUMG9lH6Jifxk5C7ypx/CxRpUPv8BdpeQ/LMCyB9Nn+bNXhUXUwp+cwDQTaSf8gVrrnpFoQcQ=
X-Received: by 2002:a81:8647:0:b0:595:89b0:6b56 with SMTP id
 w68-20020a818647000000b0059589b06b56mr23473114ywf.28.1697028360290; Wed, 11
 Oct 2023 05:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-2-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-2-b219c945df53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:45:49 +0300
Message-ID: <CAA8EJpps7g6LWFUS87j2oGwMW6He=MDSm_GaR_zOyQPHUvGReg@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/5] drm/msm/dpu: add
 setup_clk_force_ctrl() op to sspp & wb
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Starting from SM8550, the SSPP & WB clock controls are moved
> the SSPP and WB register range, as it's called "VBIF_CLK_SPLIT"
> downstream.
>
> Implement setup_clk_force_ctrl() only starting from major version 9
> which corresponds to SM8550 MDSS.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

With two minor issues below fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 21 ++++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 12 +++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 20 +++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   |  7 ++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  4 ++--
>  5 files changed, 54 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index f2192de93713..5fd213ed6491 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -69,6 +69,7 @@
>  #define SSPP_EXCL_REC_XY_REC1              0x188
>  #define SSPP_EXCL_REC_SIZE                 0x1B4
>  #define SSPP_EXCL_REC_XY                   0x1B8
> +#define SSPP_CLK_CTRL                      0x330
>
>  /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
>  #define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> @@ -581,8 +582,18 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>         dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
>  }
>
> +static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
> +{
> +       struct dpu_clk_ctrl_reg sspp_clk_ctrl = {

Nit: static const?

> +               .reg_off = SSPP_CLK_CTRL,
> +               .bit_off = 0
> +       };
> +
> +       return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
> +}
> +
>  static void _setup_layer_ops(struct dpu_hw_sspp *c,
> -               unsigned long features)
> +               unsigned long features, const struct dpu_mdss_version *mdss_rev)
>  {
>         c->ops.setup_format = dpu_hw_sspp_setup_format;
>         c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> @@ -612,6 +623,9 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>
>         if (test_bit(DPU_SSPP_CDP, &features))
>                 c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> +
> +       if (mdss_rev->core_major_ver >= 9)
> +               c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -672,7 +686,8 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>  #endif
>
>  struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
> -               void __iomem *addr, const struct msm_mdss_data *mdss_data)
> +               void __iomem *addr, const struct msm_mdss_data *mdss_data,
> +               const struct dpu_mdss_version *mdss_rev)
>  {
>         struct dpu_hw_sspp *hw_pipe;
>
> @@ -690,7 +705,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>         hw_pipe->ubwc = mdss_data;
>         hw_pipe->idx = cfg->id;
>         hw_pipe->cap = cfg;
> -       _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> +       _setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
>
>         return hw_pipe;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index cbf4f95ff0fd..f93969fddb22 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -271,6 +271,14 @@ struct dpu_hw_sspp_ops {
>         void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
>                                bool danger_safe_en);
>
> +       /**
> +        * setup_clk_force_ctrl - setup clock force control
> +        * @ctx: Pointer to pipe context
> +        * @enable: enable clock force if true
> +        */
> +       bool (*setup_clk_force_ctrl)(struct dpu_hw_sspp *ctx,
> +                                    bool enable);
> +
>         /**
>          * setup_histogram - setup histograms
>          * @ctx: Pointer to pipe context
> @@ -334,9 +342,11 @@ struct dpu_kms;
>   * @cfg:  Pipe catalog entry for which driver object is required
>   * @addr: Mapped register io address of MDP
>   * @mdss_data: UBWC / MDSS configuration data
> + * @mdss_rev: dpu core's major and minor versions
>   */
>  struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
> -               void __iomem *addr, const struct msm_mdss_data *mdss_data);
> +               void __iomem *addr, const struct msm_mdss_data *mdss_data,
> +               const struct dpu_mdss_version *mdss_rev);
>
>  /**
>   * dpu_hw_sspp_destroy(): Destroys SSPP driver context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index ebc416400382..374c2c64c9e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -43,6 +43,7 @@
>  #define WB_MUX                                0x150
>  #define WB_CROP_CTRL                          0x154
>  #define WB_CROP_OFFSET                        0x158
> +#define WB_CLK_CTRL                           0x178
>  #define WB_CSC_BASE                           0x260
>  #define WB_DST_ADDR_SW_STATUS                 0x2B0
>  #define WB_CDP_CNTL                           0x2B4
> @@ -175,8 +176,18 @@ static void dpu_hw_wb_bind_pingpong_blk(
>         DPU_REG_WRITE(c, WB_MUX, mux_cfg);
>  }
>
> +static bool dpu_hw_wb_setup_clk_force_ctrl(struct dpu_hw_wb *ctx, bool enable)
> +{
> +       struct dpu_clk_ctrl_reg wb_clk_ctrl = {

And here too, static const. We can even move them away from the function.

> +               .reg_off = WB_CLK_CTRL,
> +               .bit_off = 0
> +       };
> +
> +       return dpu_hw_clk_force_ctrl(&ctx->hw, &wb_clk_ctrl, enable);
> +}
> +
>  static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
> -               unsigned long features)
> +               unsigned long features, const struct dpu_mdss_version *mdss_rev)
>  {
>         ops->setup_outaddress = dpu_hw_wb_setup_outaddress;
>         ops->setup_outformat = dpu_hw_wb_setup_format;
> @@ -192,10 +203,13 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>
>         if (test_bit(DPU_WB_INPUT_CTRL, &features))
>                 ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
> +
> +       if (mdss_rev->core_major_ver >= 9)
> +               ops->setup_clk_force_ctrl = dpu_hw_wb_setup_clk_force_ctrl;
>  }
>
>  struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
> -               void __iomem *addr)
> +               void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>  {
>         struct dpu_hw_wb *c;
>
> @@ -212,7 +226,7 @@ struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
>         /* Assign ops */
>         c->idx = cfg->id;
>         c->caps = cfg;
> -       _setup_wb_ops(&c->ops, c->caps->features);
> +       _setup_wb_ops(&c->ops, c->caps->features, mdss_rev);
>
>         return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index 2d7db2efa3d0..88792f450a92 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -29,6 +29,7 @@ struct dpu_hw_wb_cfg {
>   *  @setup_outformat: setup output format of writeback block from writeback job
>   *  @setup_qos_lut:   setup qos LUT for writeback block based on input
>   *  @setup_cdp:       setup chroma down prefetch block for writeback block
> + *  @setup_clk_force_ctrl: setup clock force control
>   *  @bind_pingpong_blk: enable/disable the connection with ping-pong block
>   */
>  struct dpu_hw_wb_ops {
> @@ -48,6 +49,9 @@ struct dpu_hw_wb_ops {
>                           const struct dpu_format *fmt,
>                           bool enable);
>
> +       bool (*setup_clk_force_ctrl)(struct dpu_hw_wb *ctx,
> +                                    bool enable);
> +
>         void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>                                   const enum dpu_pingpong pp);
>  };
> @@ -74,10 +78,11 @@ struct dpu_hw_wb {
>   * dpu_hw_wb_init() - Initializes the writeback hw driver object.
>   * @cfg:  wb_path catalog entry for which driver object is required
>   * @addr: mapped register io address of MDP
> + * @mdss_rev: dpu core's major and minor versions
>   * Return: Error code or allocated dpu_hw_wb context
>   */
>  struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
> -               void __iomem *addr);
> +               void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
>
>  /**
>   * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643c71a..f363bcfdfd70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -175,7 +175,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 struct dpu_hw_wb *hw;
>                 const struct dpu_wb_cfg *wb = &cat->wb[i];
>
> -               hw = dpu_hw_wb_init(wb, mmio);
> +               hw = dpu_hw_wb_init(wb, mmio, cat->mdss_ver);
>                 if (IS_ERR(hw)) {
>                         rc = PTR_ERR(hw);
>                         DPU_ERROR("failed wb object creation: err %d\n", rc);
> @@ -231,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 struct dpu_hw_sspp *hw;
>                 const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>
> -               hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
> +               hw = dpu_hw_sspp_init(sspp, mmio, mdss_data, cat->mdss_ver);
>                 if (IS_ERR(hw)) {
>                         rc = PTR_ERR(hw);
>                         DPU_ERROR("failed sspp object creation: err %d\n", rc);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
