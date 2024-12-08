Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A29E84CE
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 12:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131710E32F;
	Sun,  8 Dec 2024 11:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mELXXTMt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6110E336
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 11:51:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso1132212e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 03:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658668; x=1734263468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
 b=mELXXTMtUc9U9HCJGBDfwcRIUpCe50E1QvuyG04leOjqmnZGdMFXptYPeKBWbpq1UH
 6Nt/K2FdXqRHjhb5eAMoyO0Mh7lsL8nrOINQbcObScqNx2YcxgMa1NOYFl80lvsqf9MQ
 QB3C9j32m/dk0mS8KB75LbjR8Mf3Rd+KpbntctjtvvLCvEpQNqkqjMK2Uf4Dnp8CGvq+
 I+ZWTTWpqHiFrlb4gTyg0OLwpxjGTIfqJgI3BBeza7q3gzGBx2zkyV2kEyca8fMjI9IA
 v9YISgpR2LT1D6MVpJtFxb2+mdb7mXCbPJTYyIduXxC47wjAsq4w4j6rHA2m7i6cOp+n
 hpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658668; x=1734263468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
 b=cw8H1dOo5zryWMciizEKTj6TehS8ixQHlrcjeyZ9zLz94lb5PHpcJIn6W6vV2edPOO
 c583baJJ5t9fec1Kw8RCQ7K7l0mXa5cj/4t3V7GkElSyuaRs5YLYobU1MaZ95/tAxUwF
 N0Ipsr9Q3jPg8u5I22u22nLj/+kaLWvte7bXrRkdQQoOVbZq84DtYWpm+JglCvS7Be/1
 z2mxpcOm6hsVNRJpVuVuxuxdZkT058iArctaguBrRWI2A2s6fo1IpJYx+oLjcTGdwfFx
 j+DPmW8kpxz1neDapyYWttfscwfqTMGPdgFeQXNL0OFk3m/CVrRwOdoINR5MPVmizX+P
 PUZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVViUGmyKgsi6IJU+4ny34aVBFKsE5SaYYPqDlyokb3R8Lr7hB+zzp4ZD1AGzxW9K7xrR0+3DJNSf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYuEusHMcSrtEAMSKg2tHJxPwJSo3+bFxDeufjI+n1VWOjEKAK
 x63ws2dFOvTom7mv+kGxyxz8/LwBrmp2qqduVz1YUCe/p7Mk6Q9/DLe6mcZNfYg=
X-Gm-Gg: ASbGncthQ6IdTI4mMD50mxgxWJQBrTlzaRqVWk78/knmRPbmSRBbJnGGj8H+Yvxjc4S
 MPjRAeXleAkvM41m01R0tYVuXJyqoe1rX0VpWfbu6bXHZdsFtNVX35V0YO3AR61cI2O9MsdEs+V
 K7w2ST1oO671bWNO4AusT0ZIRJ1pes5L8NcYkQvmxpZRxyRT1h9XxXj1SCPv+alo2PftMmow1KK
 Xazrizubf/FXJRcLSv7GF3N63kzFmqu3heNmaXC+35h4NTvYTSA+M7Oa8867rqPxc0Y3mO/ePUO
 yGWOARsJ1uxf++hFiXE5NUGtZftoNA==
X-Google-Smtp-Source: AGHT+IETn40N7+7crT4iVG8T/A8ynVmzE/UWImTWcqofhQT1b5XaQk0o+SD2OB6XC+TybBpfRfOZsQ==
X-Received: by 2002:a05:6512:12c1:b0:540:1be6:f15e with SMTP id
 2adb3069b0e04-5401be6f545mr507128e87.0.1733658667917; 
 Sun, 08 Dec 2024 03:51:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93369b98sm354427e87.280.2024.12.08.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:51:06 -0800 (PST)
Date: Sun, 8 Dec 2024 13:51:04 +0200
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
Subject: Re: [PATCH 27/45] drm/msm/dp: make the SST bridge disconnected when
 mst is active
Message-ID: <mzo5hjocxp666mfadqdmzzbkcbzcga3aatqtv7p5jfrlfeide2@hmmamwhvbfik>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:58PM -0800, Abhinav Kumar wrote:

missing commit message

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 920392b3c688821bccdc66d50fb7052ac3a9a85a..225858c6240512cf2c5ca3b5eb52cf9b7f4db3e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -27,7 +27,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
>  	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
>  		(dp->link_ready) ? "true" : "false");
>  
> -	return (dp->link_ready) ? connector_status_connected :
> +	return (dp->link_ready && !dp->mst_active) ? connector_status_connected :
>  					connector_status_disconnected;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
