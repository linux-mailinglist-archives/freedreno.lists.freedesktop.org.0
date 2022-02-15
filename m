Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07144B6F99
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 16:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A96E10E464;
	Tue, 15 Feb 2022 15:16:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0A10E464
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 15:16:39 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 c7-20020a4ad207000000b002e7ab4185d2so23539277oos.6
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
 b=ElJfexzG+s95N7RLESkvdDA0n8ZKZ8AXW7mszPN/VbW7YxdYaXwiLdi+X02TZJ2auL
 dO4zAtvAdBA0QyGCZv8HXijxnfmMQki9AklqFffIJxHJudkIMJ5MzrnhdInWp36503v4
 dblADlPE5En0kiHKxwTlKzeDSAMum4ZNHSSx27vgCaj2W+Xg97fo78VZl9T32RdFqbLl
 OB5ipmu5NA+d/PzTB1vpaY7yISkO/cNzmecvey2C6kH/tZ/Ge0t04ODAldv1RR65o6Vq
 tlE8fho5wOicehOlI3NLKqEKp99HHj13NWPx75LLArY59rLYgimAu5DLwXnB+9xFU6Rj
 uT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1ts+DysZBP3Fk9YvZ0HkFKUTlIrINUUB+qMVi+XB4xg=;
 b=PcniOW3z7RPBgj07LX6+zsVV/JhHb5bdVXXvS3x14JBK5jQDgDs4GPgdUXHxRYfm8P
 U/3j1KOXoM0M0tgYZq6f2fo+k3pXa1B6sb9SH1i4pdnsbAx4xcVWHRuG7L4v9gRRIBVE
 m3BNW6OR/4WQW/AWcHiX+xwVyhpkXAmbTL/l9qYPSN6XsiYCVWpPhLuLShTtpu26BXyT
 /IAwKamnMDNUzNzmBhqBxGM1AX4CJIZYlr5xyHewGUQNr0zrVQ/UJzJ/z8gBPuY+XAO4
 1trfNpigw/V6HZGxs5vKeF61XBFu6qbHdjtN6i0aipvzJIdiF+EFD9v6p+76WpbLT5s7
 1tzg==
X-Gm-Message-State: AOAM5337bKI+TKjOULywkIZj0zzXP3b9mo5L5gbHmPDXMsa9OlLEzlR5
 LoVkoit05YGzWwThKt4nO0jv5g==
X-Google-Smtp-Source: ABdhPJwJfcwzqWijJtAs5kf1G4teVCQGSMOsW6WhptZhd7xMf9U1KQ0Qy7qSAZ1tX3OK5oGg/XkF1w==
X-Received: by 2002:a4a:d622:: with SMTP id n2mr1391443oon.19.1644938198461;
 Tue, 15 Feb 2022 07:16:38 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id f16sm3086611oae.6.2022.02.15.07.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:16:37 -0800 (PST)
Date: Tue, 15 Feb 2022 09:16:35 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YgvD08auVa5Pbpgm@yoga>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: drop unused access macros
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:53 CST 2022, Dmitry Baryshkov wrote:

> The access macros BLK_foo are not used by the code, drop them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cac0298aeb52..975ff3a4ae3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
>  	unsigned long mdss_irqs;
>  };
>  
> -/*
> - * Access Macros
> - */
> -#define BLK_MDP(s) ((s)->mdp)
> -#define BLK_CTL(s) ((s)->ctl)
> -#define BLK_VIG(s) ((s)->vig)
> -#define BLK_RGB(s) ((s)->rgb)
> -#define BLK_DMA(s) ((s)->dma)
> -#define BLK_CURSOR(s) ((s)->cursor)
> -#define BLK_MIXER(s) ((s)->mixer)
> -#define BLK_PINGPONG(s) ((s)->pingpong)
> -#define BLK_INTF(s) ((s)->intf)
> -#define BLK_AD(s) ((s)->ad)
> -#define BLK_DSPP(s) ((s)->dspp)
> -#define BLK_MERGE3d(s) ((s)->merge_3d)
> -
>  /**
>   * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>   * hardcoded target specific catalog information in config structure
> -- 
> 2.34.1
> 
