Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08E9E2137
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 16:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8672210EA55;
	Tue,  3 Dec 2024 15:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cg84JMa+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A110E22B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 15:09:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53de556ecdaso5706783e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733238553; x=1733843353; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
 b=Cg84JMa+gA/TaXz7U1zmiwmsYdbMJkzZ++bhjxyC+XLkWHyni2CdcUKWWL5nVqWk3O
 GCZRYLKWPHtHFCEflCfAZPvLKTuwCjRLIkZX/Hrk6pFdd2u4WwLnFrJlJLmKMMGQsvWk
 XktqrtMrpzRIf1knI46N9iktukuu1CDlxdp4BEEh1xO7iOvFjRYPIJDSf/mifm6ylpdh
 vBy5UZ0xQUIqS2LrJdkcJSezSnYcP+3X05Km9MvmGZtirK6//tXjmR1pjMT3ZZnX1361
 PlztWGOd3/DmgimQ4LXmYYhkq4ej5CLhDsG41M+gwagg5fvgxouyfhb/sY/ZnUPT8zYA
 P37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733238553; x=1733843353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
 b=a3geQhcihLHl0LwHKeEHl1PzZZFv5NjaEsOW9rW3BSrwZMb9RS+3Y7iYnMCTJz0j3I
 soO6tdXjMz617u+P0t2C/uhW/FpZx5aULOwdFyRMQn58L2+7U6k+5CSQNrKhE0FZngx9
 cSU3p/2N1FGk6afusUdDFOBnhLc90P9Gt25ci3qDMjAYD64WjMimyCD94IeMYe6cwlbw
 cdgEbGDV21tUwQ/5llX+2IHtFt32uvmLtt2Fieh/p5WKbfedCyNwlKoAsBAvp+TCLw7t
 HqkKV+G1q278ddc4F0lX1By5mh0WALs+yzgw/Wo4IhAQWS1pVOw8+OFnF4ss8LJKs+mM
 Imzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+LCiIxsCFflguuT+4D365I+WxRPu9cKUHs/RLrxVhN87clHM1MIHGFED6ca8ybJNam/tAmVEobq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydEHU7uEJY3i0qGSzFlb+ZdHzLyedtjSPGrVNcrsIlqrrHaxs+
 42Zqwe3SFngVlVeECV2v7DnS/WW76hiNj7cYk7K6S9PDGGiKFHL4vZSIhXwfEKU=
X-Gm-Gg: ASbGncssmMuJDKsz/PZ9BNXJ2r/W7gjyuqmx0wYTzNnIXX6fU9uRWTcSKJsbDVUgOsa
 94iSBZS3TCaP277kqUWQPrGV8ifu64rAx4chTwvP/YwQWXTKDE27Hcgzg9GCXTWFphEC1kPXO7U
 lKdHOJdNZ+98L9COdvY+rVemAG6aBOaTG2VLTUFvuo7DuU31NSlhlbGF1xeo1r2SPHxMF+5CqWC
 V0EmAnWsFYW5eA6DGa1RtogZsUbJ8rSFE6Qg0pwaC/p5+iEs1FFZfL//VYhVihmXzt/L3furkXQ
 IAkaS/EfmQFMgIuVYMyRdFJWVey+OQ==
X-Google-Smtp-Source: AGHT+IEjlfUflJI02ZJGU+Y+a8G3HUQsKv6NYL+aTiOcebMKzBeRoE8K/ZaRgeCLnat3VtUDppoaYQ==
X-Received: by 2002:a05:6512:31ca:b0:53e:1b79:ada3 with SMTP id
 2adb3069b0e04-53e1b79aea5mr687508e87.6.1733238551539; 
 Tue, 03 Dec 2024 07:09:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f08csm1852548e87.164.2024.12.03.07.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 07:09:10 -0800 (PST)
Date: Tue, 3 Dec 2024 17:09:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for
 tpg
Message-ID: <fieuuhtisu6ztpuzks32rvnjdfnusywmmcyj2oz7rg36ablo6l@thq5p2xha6jx>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2024 at 12:41:59PM -0800, Abhinav Kumar wrote:
> MMSS_DP_INTF_CONFIG has already been setup by the main datapath
> for DP to account for widebus to be used/unused etc.
> 
> In current implementation, TPG only switches the DP controller
> to use the main datapath stream OR use the test pattern but expects
> the rest of the controller to be already setup.
> 
> Keeping the same behavior intact, drop the clearing of MMSS_DP_INTF_CONFIG
> from the msm_dp_catalog_panel_tpg_enable() API.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
