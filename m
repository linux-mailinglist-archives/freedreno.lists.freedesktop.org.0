Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48032172C69
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2020 00:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0446ED8F;
	Thu, 27 Feb 2020 23:41:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF356ED8A
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2020 23:41:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g6so460566plt.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2020 15:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
 b=NgD9KMhGVNVhQUdRxhMPpfYcyj4KNSCvL5unnyCbaQTOPhFfKGRPgZ+HQFMfzKULX2
 aPNS2TYrdM+f3jXnVBZMXwXR3BpGH+Qs4QzCMeTaGA1XeJAChmSALB3gsedpMWHKl5I5
 7vSS6POjQckU5dQYHVECKTG9TVgtWw56n8PkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
 b=toXI3HQrYlNP8/9UlQwQ62vwQ3FldE9HQBVhS+BOYJXbAYzGpIPd/DW0Xo3x0kzMfG
 ZtHb+X43YU6baQAb+915QQq7S4r6QrqiE5j+hOgIedb5lZ5y5L6A3l9iPM7GAq34LBy+
 UMGeQPPkqg89uy9jiR/gQSuiX27dUSbUyW+UjmE9pRHFeZXK6RDKNCt35BZpVqmk2Jgm
 ODOcTl/kRSVd8kKMVCy0JyPO85Z0CLT5Fxo2xBUF+jn0sdbmesXpmzY/nSD+K+aP1Zs2
 nXBM3PZjFbvnNX5xBnTs9cVQThgRDcBERBttQEb6jDpt2ILKjvZWTRGZ/wbnHRdAihGE
 gb+g==
X-Gm-Message-State: APjAAAU9qCTpUDXl+kAudMzqtg1XR8hym5iihbc7QLXEll2TTDKUzbKY
 NO2CVd8k6H5Aj/My6rL4WjD9bA==
X-Google-Smtp-Source: APXvYqwF7mXopVy4e3b74ONItwDUAaWOB6zck1YGUfvRN/uUanLfN7+dU7YIvhfbunorfy/XmpJlhw==
X-Received: by 2002:a17:902:aa49:: with SMTP id
 c9mr1254841plr.145.1582846896504; 
 Thu, 27 Feb 2020 15:41:36 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id u24sm7665466pgo.83.2020.02.27.15.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 15:41:35 -0800 (PST)
Date: Thu, 27 Feb 2020 15:41:34 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
Message-ID: <20200227234134.GL24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [DPU PATCH v3 4/5] drm/msm/dp: add support for DP
 PLL driver
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2019 at 01:48:27PM +0000, Chandan Uddaraju wrote:
> Add the needed DP PLL specific files to support
> display port interface on msm targets.
> 
> The DP driver calls the DP PLL driver registration.
> The DP driver sets the link and pixel clock sources.
> 
> Changes in v2:
> -- Update copyright markings on all relevant files.
> -- Use DRM_DEBUG_DP for debug msgs.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
> new file mode 100644
> index 0000000..6ef2492
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>
> ...
>
> +static u8 dp_mux_get_parent_10nm(struct clk_hw *hw)
> +{
> +	u32 auxclk_div = 0;
> +	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
> +	struct dp_pll_10nm *dp_res = pclksel->pll;
> +	u8 val = 0;
> +
> +	DRM_ERROR("clk_hw->init->name = %s\n", hw->init->name);

drive-by comment: DRM_ERROR doesn't seem the right level, DRM_DEBUG_DP
would probably be more adequate.

Also I found this line triggers a NULL pointer dereference on a SC7180
system, where clk_hw->init is NULL.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
