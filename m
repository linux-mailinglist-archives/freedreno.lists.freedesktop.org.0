Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E3507F11
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 04:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA27C10F273;
	Wed, 20 Apr 2022 02:47:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0F10F273
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 02:47:15 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z2so634407oic.6
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
 b=iruwlQMQmkHPdfb5AUtOdH7s6RB4z+YA3vS74UUFPPoI9qTD2pH2mcQTnXg78CVToG
 Q5zsNfXphSO1QQAk/vj3875wHTzoeSlZ2vXJO7asCXN5yVk/jZK7KSzWIN+zQrtjHSzC
 JgLnEjBkjJMfRSqoiGAfGUFtMKk5Qd1MHOcNNK9rXQ2N79STDLNknk3YsCQqROd8eqDN
 K83lmvqOaYoK5rTmwC1AcQhk/7BiBVtX+7UPL3qdAkdGRGvB06YApqKCgowV1mMo16wa
 JdLAiTaTpGjpbImKUzleBacTZtMddsi30sZpK2RLjT2atcF2jhXSpjpCs7xbkuxbnlEa
 Bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
 b=wLgOUiW50W8yqxQbIJBTtvjN2wYGfmV8hnE+CTwM/sI/Qg+K2oBkIbgca80vt8abyL
 oRm/8wiK7OSsit55oIYaUgnUWKlerdY4e1tVd2D9zYui71HVp4ZBDzFnU/FiWhYXcesc
 rmVkYMAjP8S/UrosUbcInhSnfzn+xrwi1QVyzLbb+aTraNTt4FbssMEwo+XZsgP9I1cH
 5cGvBVtQc9pkDnujbSLU3D1Foile7i1HCjykodRqXZLwUYr7A98Pux6+rWuB7fwbMft2
 c95bewK/0okw+3K8tsHXBFqm7VlFtdJhpL4eFJqqKXim+TIAYeeA9QyA+nnn+j+5fILX
 IHUg==
X-Gm-Message-State: AOAM532nraq2Kp1bNpWHaGDWMCs9TPzwRLpUdbg3LY6093FgHT1yW/ga
 LOADvg3PT2vXLHakaeq8Q2KG5A==
X-Google-Smtp-Source: ABdhPJwpUgs1fxza/ioCVfipQG6pgrpTluzQomDGAxienilt70kyO+VUXsamqwicKGfF+JtOL5M7+g==
X-Received: by 2002:a05:6808:140a:b0:2f9:a830:d12e with SMTP id
 w10-20020a056808140a00b002f9a830d12emr772201oiv.235.1650422835061; 
 Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a4a9593000000b0032176119e65sm6117380ooi.34.2022.04.19.19.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:47:14 -0700 (PDT)
Date: Tue, 19 Apr 2022 21:47:12 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Yl90MENoa52cGtna@builder.lan>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency
 calculation
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 19 Apr 18:54 CDT 2022, Dmitry Baryshkov wrote:

> Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> the clk_core_determine_round_nolock() would clamp the requested rate
> between min and max rates from the rate request. Normally these fields
> would be filled by clk_core_get_boundaries() called from
> clk_round_rate().
> 
> However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> which did not have these fields filled. Thus the requested frequency
> would be clamped to 0, resulting in weird frequencies being requested
> from the hardware.
> 
> Fix this by filling min_rate and max_rate to the values valid for the
> respective PLLs (0 and ULONG_MAX).
> 
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Stephen, please pick this for -fixes.

Thanks,
Bjorn

> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index f675fd969c4d..e9c357309fd9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  				    struct clk_rate_request *req)
>  {
> -	struct clk_rate_request parent_req = { };
> +	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>  	struct clk_hw *xo, *p0, *p1, *p2;
>  	unsigned long p0_rate;
> -- 
> 2.35.1
> 
