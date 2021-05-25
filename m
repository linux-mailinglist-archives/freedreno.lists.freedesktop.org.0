Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5C39066A
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 18:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD6D6E1DE;
	Tue, 25 May 2021 16:17:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC116E19C
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 16:17:10 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 o66-20020a4a44450000b029020d44dea886so7298966ooa.5
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e7vC82MOW0NW82MNwotSo5AjRB6ZfFedgPehiglFXVE=;
 b=VV2g3jXLjNwfucKdlWfV4nRFS80jeb3aFXhtJ2AzqlGmxZUsqbU05G5W7KCmBkqpDL
 ahNknuP6P5g901L0942qdMcdIDfgQ4hL8PM+EJozRybINL/+fsZvXlynDh6hIGygN1qk
 j12wrvt5JAfE3LewTyCnlQnDbBB2LAEcWWM0ZBmKG6pVaw84RyyS/qivGg1w8/GgwDyd
 ws7Lpm1aUvf1tj/WNbeeVVERuF7aGng6D/nZ6rA/+l/6W4jz4QijyVFnSQizjFg9XKPF
 /fRjpS86hFl/O0cpdm7MZFqZUuXfPIQtSmy7541HMMP1ljykUerNe76XybNKykIz/M04
 hNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e7vC82MOW0NW82MNwotSo5AjRB6ZfFedgPehiglFXVE=;
 b=UfUfdUZRAdVlVcVaWfDDwthztXaYxAb/ZZvwH2Ewd5QawGzTII/uXeMFJLb3MeSL4t
 UlUNyPvq23cFF0s+9MlJbf+kVDqEEVDYWbwgs6GY6bvl7XHIDAWrilycOzoM+2XBU7b+
 ajRsFLQDaTfdC7Yo11IzQzGiiY6IbmFIo3crUwb3+tiXITa2ibX6JTd32N3ARG08o5J/
 52HYYaxl74Ikr6A9D3Np9vMMjfK4KxULcdJO6FMx4E7q3rPC0SiYxh0pFibWymGFOWot
 OeWu4weSvKTzB0bDuww+pn4uVQI8wWFS1L6hIWbBBimdk9gLvIrXpf6ppQLk+1v3fd1t
 4SLQ==
X-Gm-Message-State: AOAM531ebKRXQ1lXGJ2SB/SDm7m8kQD3m7iBMC/eRr/WoMBfSgx+ixH+
 +0TfI0VkHJHqZWm/BYJUv6p0BQ==
X-Google-Smtp-Source: ABdhPJx5dyMTI6IS+EXOFg/tcrLCy9sK0qfNIS9Yu/9171h7psVC/ReR2mUWfvwOujBWOmDkWTb76A==
X-Received: by 2002:a05:6820:611:: with SMTP id
 e17mr23313335oow.0.1621959430140; 
 Tue, 25 May 2021 09:17:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s187sm3373925oig.6.2021.05.25.09.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:17:09 -0700 (PDT)
Date: Tue, 25 May 2021 11:17:07 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <YK0jA9tV/2GUlXQj@builder.lan>
References: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove the repeated declaration
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 25 May 07:22 CDT 2021, Shaokun Zhang wrote:

> Function 'dp_catalog_audio_enable' is declared twice, remove the
> repeated declaration.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a9020a520..f12468dcbb56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -124,7 +124,6 @@ void dp_catalog_audio_get_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_set_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
>  void dp_catalog_audio_enable(struct dp_catalog *catalog);
> -void dp_catalog_audio_enable(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
>  void dp_catalog_audio_init(struct dp_catalog *catalog);
>  void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
> -- 
> 2.7.4
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
