Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45793D4B64
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412A2737F7;
	Sun, 25 Jul 2021 04:09:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E311737F7
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:09:09 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso4575412ota.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XsOomHsagha9Fe+7yEyhkFKXqWi8OGM/BC3XLcUzh3c=;
 b=WJHqntMpjQoASjgw3nvDB6VDxvWIEQ+kqoS2e+dZ3gx0+Low/cqHPeWuVtpaqDDGBi
 W/e3/8HZGtnjmb4zlfiYwtGFgGPlCxhEvmZbTd9aTdM/wQvBCzESdm247syHxxZXgoRm
 CrCTo87S13rnCMGUOOGJr68DxsPa+oKBwnzqizpZNLoyYv1+VZXg0uz+KHFxrKqDXXol
 lK5w+e/AVbiYLFoti93PcVUvwelqXfCu/ms/d4uMElQ9fa+wMWu58tGVwdw5DQfPiGh0
 Rm51zWy6KSMR14E0v//Vtwe/sNZ50cUgfHV46qOm4krBFdPqZPnq0Ls5sS9UYpRUps+s
 5+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XsOomHsagha9Fe+7yEyhkFKXqWi8OGM/BC3XLcUzh3c=;
 b=ZA7ZORM7BqcAhemPZZLcDre4oDlPcrTIZim6jlt0bGx/lwBYjAb+Zamm5YCinMp64S
 71wh1i7tMM8jueak/jz4ij+4qPdkZFga9bSJKR+lxZFnj23/ivk3B65A43e24RotVOxi
 OfT5+QHN+qZvSbaiX5OV0afAWgTa6H3vT5ddx3hs9MW2DbSpVLRJRXsYS/eUFxFnVzFe
 PE3NBlUyp00d/nKdYD32JwwZ2uv8WGvaAozgtmdnFFp3pj96NpHzmnG4eKevrYmW6d9+
 t6oPqZvS9qiRH4c8jwKAZXdLE+7BI01/dApUeSQ6CuiHLTx8PUKneuKKgDIOWGey3FSR
 OYqg==
X-Gm-Message-State: AOAM531bSeTHW3YG3w8sXSYPctTHP1SAvO/b06neyfoOAGkNEApEfRTs
 tRac/ygQbtBWp/uAVmHvcAwZQQ==
X-Google-Smtp-Source: ABdhPJw89eAvGX619ev78112N8AQSStiF+TDCXhViFNPfC2fU8J2UZXoQmkMrtRDPokBOIL5ab7Qbw==
X-Received: by 2002:a9d:6059:: with SMTP id v25mr7766284otj.204.1627186148383; 
 Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r6sm1134577otv.0.2021.07.24.21.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
Date: Sat, 24 Jul 2021 23:09:05 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YPzj4QExgE/nCaJQ@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 7/7] drm/msm/kms: drop set_encoder_mode
 callback
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> set_encoder_mode callback is completely unused now. Drop it from
> msm_kms_func().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/msm_kms.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 086a2d59b8c8..9484e8b62630 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -117,9 +117,6 @@ struct msm_kms_funcs {
>  			struct drm_encoder *encoder,
>  			struct drm_encoder *slave_encoder,
>  			bool is_cmd_mode);
> -	void (*set_encoder_mode)(struct msm_kms *kms,
> -				 struct drm_encoder *encoder,
> -				 bool cmd_mode);
>  	/* cleanup: */
>  	void (*destroy)(struct msm_kms *kms);
>  
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
