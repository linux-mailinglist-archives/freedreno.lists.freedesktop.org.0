Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F617C5443
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 14:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C966F10E7B3;
	Wed, 11 Oct 2023 12:46:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2926910E7B5
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 12:46:40 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d9151fc5903so7113212276.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028399; x=1697633199; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
 b=run7b/wQ38a397tut/WfmaVf0wdmZ4gvRBeNngfIPmVDYcnEOxXMlv57bndr7KFPZb
 l7V02Lykpmle7a/LGyP6grALwKhQOWUcPluGLhGO/ZdnvnMkUMTErDEW1i9NDtJoSXQV
 chlFJSqT9ui+1RpTAuQJOFWMBTcgBTLzKBBNcPtpB8gssxSj4YZn+DctpdshqECZzVis
 /k+gH2XGKl8p3zP3IuKTYF40MXeCftFQaeanT3uR/Yjs3RDTpJLlhhq49a/Qf9UU0Zi2
 CGNJJrhKw3ins/tU5HpJjRfQtCbB8kVt+elyO2tp3cY38TEHBrxS2hvLC2pKRrxZCoNZ
 VvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028399; x=1697633199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
 b=qxRZrdg74z7kDtwC2AItq3OxKqqrb9wKesbxB6IQBM1Y1SBRIqVJpGiCGTUyse2+bO
 armOpeHPqiwXsTCKDLKLFCaMmDvg7ZmHy6UKDB5OMY/YTFDUGKRY25nx6U9BD9+wmber
 hmb9GsrpcXvitU+plqOoWV7EGXnp/o79e3Md/k1VcGDYTnYZjFU7pTi0p1xxg7AR56Gw
 K4Y42DI7Pz0yEEAXWMVPjTbJoA0Sc59WgfbSjhI5LBdbY8r8OPlLY0uS5URYUcj7ShFr
 UZYqTghNUKdUyEp7cvaap1XzR2bpjFMjJIJ4AO+8Y4kaeyEwLAx36YQ+3sm7aGspyfzR
 14vw==
X-Gm-Message-State: AOJu0YxwT/OnQbpisGOlb8+ZFBTPPHAYMFHtOJHo/h3/lXptepEWdgN+
 LRa1gltJtKxn8FIHKQ4FY3w2yGEnoAvSliR7d+Ot/g==
X-Google-Smtp-Source: AGHT+IEXxUHgahb5Rv9YlVarko7XshACSDpKCpE2aXKyLar9E29Gzcw5Kx2vRU/DIhKX6Un2J5Ca5vqy10fCukWUVV4=
X-Received: by 2002:a25:3d81:0:b0:d9a:52ee:6080 with SMTP id
 k123-20020a253d81000000b00d9a52ee6080mr5293824yba.37.1697028399177; Wed, 11
 Oct 2023 05:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:46:28 +0300
Message-ID: <CAA8EJpoGXEFisVAde3whLAC8Tt1EL1DqOsi-kfbzMU+MtbK4Vg@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/5] drm/msm/dpu: enable writeback on
 SM8550
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
> Enable WB2 hardware block, enabling writeback support on this platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 4590a01c1252..d83a68a2cc0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -321,6 +321,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
>         },
>  };
>
> +static const struct dpu_wb_cfg sm8550_wb[] = {
> +       {
> +               .name = "wb_2", .id = WB_2,
> +               .base = 0x65000, .len = 0x2c8,
> +               .features = WB_SM8250_MASK,
> +               .format_list = wb2_formats,
> +               .num_formats = ARRAY_SIZE(wb2_formats),
> +               .xin_id = 6,
> +               .vbif_idx = VBIF_RT,
> +               .maxlinewidth = 4096,
> +               .intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +       },
> +};
> +
>  static const struct dpu_intf_cfg sm8550_intf[] = {
>         {
>                 .name = "intf_0", .id = INTF_0,
> @@ -418,6 +432,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>         .dsc = sm8550_dsc,
>         .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>         .merge_3d = sm8550_merge_3d,
> +       .wb_count = ARRAY_SIZE(sm8550_wb),
> +       .wb = sm8550_wb,
>         .intf_count = ARRAY_SIZE(sm8550_intf),
>         .intf = sm8550_intf,
>         .vbif_count = ARRAY_SIZE(sm8550_vbif),
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
