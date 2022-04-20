Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B12507F17
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 04:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FA110F18F;
	Wed, 20 Apr 2022 02:48:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5385C10F1CD
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 02:48:42 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r12-20020a056830418c00b006054e1142acso252923otu.7
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 19:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
 b=xJQQvbGeiv55LxOgRCAxCgC9ZiBXWIggFHAJQV+kqOo/UxUl+LQqeAmAvnk7ypXt5V
 se5zB4Ez70kwsW8uPe+64bZzeadkPOkPg3c8sFvMS74WiPjabZ/cEm+S8w5IBAt/POhJ
 20tph+hKKIc1Rt5DSHPY3ueFYM9+Us1NVQKXMKiMwDyAI7GC+sfbC7n6aZGfKTP0Qegc
 fiRyzh4V8hHOgAGEBcLA86KqxAW1G5RaVemUcn9F4tmgwawojJN5ZCfPvl+Icqdp65N4
 gcNhDqpjrch4yLNwUu5AUrXGNZSunusoxGSUhL2YamKpprMNvIT4vp1cDS3uSEFWGzH6
 lkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
 b=MmmgCJ8xWCpioixgc8GEPISPcLzIyO78N9dXlAPJJU5696UoOMqkiPvsBeZQ12CrVH
 w3m5LNFdimgg5CTl9iW16ze2YJf3CTCM2/NgSh2zAZ3Ksogi5OYTMilODyVAM30t2HYu
 G/ANiIn7uXr0gOuSNUpsDNN0JR8hK0KNfB6Xg2pXzQ54qWewegPIIQWinPiPFCB9Zc2n
 asqb1uQfTpHggKnwzAzBEzVgkbTpSg7hvxvOzLrHAZHIsNA4spFHBU08RN3gONgwe6Lj
 Bx1rZgKOro30datdgq7mRfZU2IbsQxISN17pcqAo+Jk3fhyLahAeYHDuUn34EmbTddnr
 rf0A==
X-Gm-Message-State: AOAM533xSVCLIn4uEouRpnpqXlJNLgOt6TkG2C1X9yddFgu6QfDsspgU
 jyv0u0VXIZ1HBTWlBL5jQMBOCA==
X-Google-Smtp-Source: ABdhPJyDQoZdetLa1WR+iC8qmsQIEGsOqkaYfUCgaps/vrkB92VYUqzJ5B11+iUsOjAXBVem+glQDg==
X-Received: by 2002:a9d:6d06:0:b0:605:4e8e:fe89 with SMTP id
 o6-20020a9d6d06000000b006054e8efe89mr3984218otp.329.1650422921576; 
 Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 bp17-20020a056808239100b00322c34c4afbsm1165291oib.25.2022.04.19.19.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Date: Tue, 19 Apr 2022 21:48:39 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Yl90hxm7+nbAV4cN@builder.lan>
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

Reported-by: Rob Clark <robdclark@chromium.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
