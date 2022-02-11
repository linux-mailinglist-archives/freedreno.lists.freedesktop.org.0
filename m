Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1E4B3151
	for <lists+freedreno@lfdr.de>; Sat, 12 Feb 2022 00:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D91F10EB33;
	Fri, 11 Feb 2022 23:36:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCAE10EB4E
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 23:36:41 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id b5so10436448qtq.11
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 15:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WG5k+B0lV7CrUABwtgvGajHugojxli7tl5EUiLu8xiE=;
 b=R7hlMWRg+u9ThSNZUL3M/YEQMJzhczNKB+HVPESg5hccrwxBZKMtlgaOMTHEyz0A2y
 tUipd1LkkMJB4R3psAnybe0qse2XjZoW2wIYyt30LezMDYfmDjaqKXzpXU8QPO7K8PHk
 9EnnzKX+42iRyjSgE+ieJS4VKMCRRMBuHww63c+GPd5FnOzLJBohYLlPTBz4U88+8WJD
 CZnFzjbDL1uE7gNj+24JRT+ZY1wmvr9ijsO6RUkYZ7s5L3XH8a8Meh7FRArwooiLfy0c
 eRQB8ABRwcDFDb/k2d1EWFwMZ1QgTWH0Awt9yybhh4DckyAp7whozI6cGq4bmxr0FOQe
 cAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WG5k+B0lV7CrUABwtgvGajHugojxli7tl5EUiLu8xiE=;
 b=CyedsKR9rIw+Gb8gu+/MWSGSRyVlLKW5wPMDiFmensBQvT+PPdEXl99F39T4EjpCIV
 191HCoapXre53MThMH84pz9MkO8jSpyiHJgpo4pq4v+GzJdQ5soguNuCwGRDrUAyz7ez
 sxZnm/i041vtQatQJoXwSU7GsewHgVOsQ/yUcB77vJ2bNYOb4mcIHvqmYsfuURU03wTm
 IyE1DmQMKM2e0KysbNs6kzN/ISqB69fKqlpYGKiU+PfSKiJmxloxwr24i9JL/w6mw4Cu
 Eztq7+bHQKpfvbgd62NsIJ1J8UsKKUEd2fodYY1SysCM9LcmTevcPT5/aqVZMU7yEWw8
 18SA==
X-Gm-Message-State: AOAM531SxWyGA6bg/7RGxb+pNjcPwIrdQ9/sNdKXft3ckUP9ZW3bLSTq
 k8kHPv1CuqqEvvgmOfVkyJ407/Vb5rPnXYjI+4CR+Q==
X-Google-Smtp-Source: ABdhPJy0rWyAoEGABnzg5qLa2bkeCwPpRw+TfpLVlWFJzB30Cfw9FysHKCmhO9MfpXGQaW9H2tlyvbC+7X2oDYdaOF8=
X-Received: by 2002:a05:622a:4d:: with SMTP id
 y13mr2941923qtw.629.1644622600592; 
 Fri, 11 Feb 2022 15:36:40 -0800 (PST)
MIME-Version: 1.0
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 12 Feb 2022 02:36:29 +0300
Message-ID: <CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: populate intf_audio_select() base
 on hardware capability
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 12 Feb 2022 at 02:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 272b14b..23680e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>         .has_dim_layer = true,
>         .has_idle_pc = true,
>         .has_3d_merge = true,
> +       .has_audio_select = true,
>         .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>         .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>         .max_hdeci_exp = MAX_HORZ_DECIMATION,
> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>         .has_dim_layer = true,
>         .has_idle_pc = true,
>         .has_3d_merge = true,
> +       .has_audio_select = true,
>         .max_linewidth = 4096,
>         .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>         .max_hdeci_exp = MAX_HORZ_DECIMATION,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e5a96d6..b33f91b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -357,6 +357,7 @@ struct dpu_caps {
>         bool has_dim_layer;
>         bool has_idle_pc;
>         bool has_3d_merge;
> +       bool has_audio_select;

I'd suggest adding a bit to dpu_mdp_cfg's features instead, following
the example of other hardware blocks.

>         /* SSPP limits */
>         u32 max_linewidth;
>         u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 282e3c6..e608f4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>  }
>
>  static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> -               unsigned long cap)
> +               unsigned long cap,
> +               const struct dpu_mdss_cfg *m)
>  {
>         ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>         ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>         ops->get_danger_status = dpu_hw_get_danger_status;
>         ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>         ops->get_safe_status = dpu_hw_get_safe_status;
> -       ops->intf_audio_select = dpu_hw_intf_audio_select;
> +
> +       if (m->caps->has_audio_select)
> +               ops->intf_audio_select = dpu_hw_intf_audio_select;
>  }
>
>  static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>          */
>         mdp->idx = idx;
>         mdp->caps = cfg;
> -       _setup_mdp_ops(&mdp->ops, mdp->caps->features);
> +       _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>
>         return mdp;
>  }

-- 
With best wishes
Dmitry
