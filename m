Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109429E6A21
	for <lists+freedreno@lfdr.de>; Fri,  6 Dec 2024 10:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCD910F04C;
	Fri,  6 Dec 2024 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cGAx6oGY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B835810F04C
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2024 09:32:49 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffc86948dcso19238681fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733477568; x=1734082368; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
 b=cGAx6oGYOlp7gUdk1HOrP+RtUye7wbG+FWQwkSTsosJEFefjdDSV+h2xNMJfL5bCy3
 3Vfd+p33fieMLZBv14Gg3hkjaweRfWokPH+9wF/f2I4vSdSov++kcERbN95rkJ2T2XMN
 +labPKZpsvAP886SHIKHBEYwtNpfckAoAIFchXDp/S+qvQ0SV3v8sES9v1EV4EGZGfyJ
 J2gnoQs6jeCsgaae+Xt2hoFAHNHOWBh3fa1FBlVtnv3/YdYd7r8ln89EaOUV977XXUn8
 YMl+QZj90ys86l9woJNntkgmaMOWvoQFta5LUqmwkYe+l2CJ8Ijhgaln38MqSBys7hr8
 5yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733477568; x=1734082368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
 b=HVUhnwG5/gAlLo8UTxnKIaTusqQAW5HnV0LD6jC+vSyIAEf4dtuRVtfqbsFmWbY8lp
 M5tc3VcEY+sXu/hMGsryPKCUS5+A5LAI2/WHBPh9hSQR3aXHkLA3pWERaTZSAreMTfwa
 0oSbJ7KbjZX7s7kTo7/sp2EX6WzLk6GGEJkA9dwn0VoC1w7v2c2AZj/1DW94iqmtWEuY
 P/Ybju39IPIQ357nfqnR9qtpaVhwmyHD5jg8URACvK6cYbJoqYF0m5lOQV4K9QBrNDyj
 bKM5o9JY6j7JJ+CRgAimOuYMQzVJeSrXEQUoCj3ZQ3PgrLhzbgpKzVAourI+6ysbym3r
 IGkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzhhqhKFx9yJuW8stKeBqIHkmXGg0tDw7/eYvOZiQu1CFpIx23dZf6VzGy9odI8LGoAqkjUvk1JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9LdxXBl2Fx1jnQuD7e1BzPF0d4mdTCQcQ18L6NqaOzMvhspT3
 3DxwU2z4ZpD23lIJD8D7baLrmWiM+tFvgEAQl4SeR79zm9oZjRtl4yda/btN1OA=
X-Gm-Gg: ASbGncvBjl1M+4njdOeMQkkOP739T/uz1w/AjBg49+Q1wqVIA6DJ7eJuS2gDyZsIgSD
 gPnYmVUV7kZBORicEempLMAGlJgfSO0jfcCvHpdfucXAYmChBdrRtXlMkoSZDjgw2Pt1/EifK6U
 YVpj/agej6IHPdJc6tJMg4W1efD+3nRH/LykXtucceRiOPWovFVAKBjqTwxXYYjWdxhU94z5ZTQ
 375Q29Nks9sv4DDzUR3Hbf8kKyqlD9vrATt72RdvYweZYMejAFs675VdeZLOpnV3+5+E9H/BhuN
 0ovbDbkqJeOK/nxDTXl1Jcc1nADreg==
X-Google-Smtp-Source: AGHT+IFt0oQZraChA0vm7bTmEKxi678+NtImtNYWtNbmFt/Emc59radqf3VL2rny8/rMaB+weccu/w==
X-Received: by 2002:a05:6512:31c9:b0:53d:eec4:2bfa with SMTP id
 2adb3069b0e04-53e2c4fed10mr1145884e87.37.1733477567848; 
 Fri, 06 Dec 2024 01:32:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba6fdsm449887e87.151.2024.12.06.01.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:32:46 -0800 (PST)
Date: Fri, 6 Dec 2024 11:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 29/45] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <7khoxaafl2eclgqe2jfwgdmruvtoug5fpjdkvcrmpcynddnloa@toooyaio7rzm>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:00PM -0800, Abhinav Kumar wrote:
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

But why? Isn't EDID being read at the hotplug time to update
drm_connector's data?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 033d238e956263c1212fce45aab01316ef341edb..a67bc7c1b83a5a9996435804ff7337f72dae93a0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -420,9 +420,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
