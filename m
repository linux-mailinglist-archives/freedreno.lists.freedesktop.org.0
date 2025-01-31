Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEEDA2403B
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2025 17:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679A010E201;
	Fri, 31 Jan 2025 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sgj/Safg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54E610E201
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2025 16:24:29 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30616d71bb0so22142231fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738340668; x=1738945468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
 b=Sgj/SafgWbRcqdRp6AS7GXIIwGUjIjcwQoy9F6zxp/3/hywjD6vCYW1R7fQrTy8DoW
 hA33DWB9RzJOpp8wtVpbUc/Dt2jS136BqI59p7OOYX2om0nHrjcKeWFLIhJPsBeHnDZX
 10x1nlI/jdRUZol6a+98G+2WMxQC+Xs9Bg+EwfuOn4kAV1ipfRicgwwZe9yq+pxkxsUC
 CjN5dTDNMczI9T7TQnlrnabFMAWkjJvk1m4sYSks3kRRmM0DX9Nxw/4d0QdLUMvNiUL5
 C82D+skdRJB4DHmMHITsV0c4TJ1bbyRk75Pox+RlmJ1YLGlAWDWLY+/cC7ol6wsXEBTt
 pAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738340668; x=1738945468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
 b=M83CUwh+p1CEQXRAEiAuHK/MeG8gm6q3Qlt2nbXRm/y83gL6kn+QhuO17s5qeAXtfx
 jO61IWnUcWUfbhhvB1MfnpKEaL5q6bUxN84RkVKCcLNOTAyHPLe1u11amiVVnETneYs0
 yfY/A20OG7rrG3SxF6hE05Wx5F4FzgAbjouvcAOgvZRuAVD03QZRuRZPxJguyfbqqeya
 PgklpvNCnNHDFHU022bsgAiS2EUikaF7VbyoVBNc7QQCCqgS0PNFRpCB/ljM4Jno1Z71
 GPtu0Twln85Gh27V8RM+EpNdSST37OrpJG/0UCRzdw9gUKdDoAry8yA+iBh1UU1y++vb
 NODw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqPZDiJ4R9b+WyQETHgSv+6JY0bC0q2m+Hi2HPF96vURrzibnOqRul1Hx2gTz4SxT/3T8Bj3kYFK0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4hxDwnnabzqJWPh8jknTPHh37g9hWjDjQYyuYOEjV/HMMZOwN
 FhsJF5XuNep5EYS7L47X/wCR9ucV1Zy/lIrdVY3Myh3YZw7G41UhlxFJSCcXIo0=
X-Gm-Gg: ASbGnctv7d0jwb6YCQyh1LTjm0xLaKXmrPVS7QrpQUptkxAe9TvI49YMUYgTcyzP1Ko
 kP2J6gTvZo2eh1fmy0//4wZR7qY9fGL2FeG2N77XwXl88fAtUBEBAqeeXU9z/RCaqyinBRRhARc
 Vb5RwQjapx1CnYo+QdmjHgcYe9Ps/5nwC0qg+C0cD4l0AZmdcJSBonckeAiV5PUeEL47GjBTfHf
 iVXXe+DvqBl4SGebhIS+tLqA5auLXfy8jCrHe5uht1odvQj21kd49GzCqQfDznLlyegAt0+z8Pi
 2LWIRxTwAhULY6Ulh22DU88/jZpQ0eHqWdCbSpFYlKudy0doADOv1jGWLD7TKStlOhlFOhk=
X-Google-Smtp-Source: AGHT+IET6Ip7seInrKN40IUQ5plgR5Wbm/yFknTx/GqkNshb2c2sHr/YKBS3/IVjV6dDw1EBZWuIdA==
X-Received: by 2002:a05:651c:2214:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-307968fa2acmr43084751fa.32.1738340667875; 
 Fri, 31 Jan 2025 08:24:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a34282a5sm6090751fa.102.2025.01.31.08.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:24:26 -0800 (PST)
Date: Fri, 31 Jan 2025 18:24:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Message-ID: <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
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

On Fri, Jan 31, 2025 at 04:02:49PM +0100, Krzysztof Kozlowski wrote:
> Calling these improvements, not fixes, because I don't think we ever hit
> actual concurrency issue.  Although if we ever hit it, it would be very
> tricky to debug and find the cause.

All of the patches miss Fixes: tags.  Could you please provide those.

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
>       drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> ---
> base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
> change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry
