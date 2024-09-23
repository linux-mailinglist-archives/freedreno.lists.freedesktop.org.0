Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C5A97E92A
	for <lists+freedreno@lfdr.de>; Mon, 23 Sep 2024 11:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94510E3C4;
	Mon, 23 Sep 2024 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nJnTgZZv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31B610E3C4
 for <freedreno@lists.freedesktop.org>; Mon, 23 Sep 2024 09:58:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53653682246so4263864e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Sep 2024 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727085511; x=1727690311; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
 b=nJnTgZZvE6MTnZCY1Mw8v8S6ZIl8/O0RMXgaANeKdAlY49tNHPzOv9OPMFUAaUaoZF
 A0VTiZ/TmHZBU0EF/bad3v97e01CRhZ1/lFrYcU88a0LDbfSWoZpGXsiVxvE5S6g2pv3
 4ZZlUvfT1YMuwCa4bALInu8kLsMmNGrU3+iAraR0Nv+1CKyeY37ZRu1He+g/p+EZR2pv
 WEYYf5eSNH9p79kfbZY0KgDsV2UrW4ObzSknm9SOe2l2vRKTdhV/0YNCFHomADhDKufe
 Nw+zK7MsOf8EC+IBWz3sJX0N6J1kx6pcAI5rJ+F6pKPECbteKfSN0nYc7oeh8ECnUFz3
 vNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085511; x=1727690311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
 b=PhoFl8dMGy3Wq8Q71jL+wmeglnFhNXXgnAUSYUYmuFG2O29V24ydHIOIwO8CK8nXRr
 gU/ODkj4dFJE8UNkPejNoUmIcgbGdmYnPK5t/SnrxM7Ad0yWP0kj1aAHcBLg5N9j43M6
 mzSOwnfdU57X5Wtc5uFb/bNHK22MbCvFn93tWDkIMQ+kSzzKcCgnEsHszoivSgxu54Jo
 srLiwHONh+F42k25NLOO0rjzZhDRKHVoviXQQmKr0XjP+f7dO44pjJyY/3c/XRrO14VU
 gWNmDUC1tbuguT7JfPe5jp/2pqOJdA1kYIQT+OXtFFqV+hTx74Y6Fbd7k2yxANaK7zV9
 8Q/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo8+BDtFM6MXIPmgQYhwy0RGxn8XCJXkk5WbVJxqKqxVZpMdagdk8IW9CqT8yXjGzzGjxMI0TGgSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3yCUijDA/6+U+984nJvUoMjR8ePOwnN9YHDf0YJvrsIBwnRVJ
 L5NvLcqL39yKlsp953ceQOpik2CuTYnOkArBySBaO/ZDttWgz27nEU+sKi2u2Mc=
X-Google-Smtp-Source: AGHT+IF70YCd6NPOg2g1uNWxOpDA5cEHVgZRGvQWfOhS4sHNqYU0tUy6qbj/ZoxZsUYtksuWhlIynw==
X-Received: by 2002:a05:6512:1309:b0:536:568f:c5ed with SMTP id
 2adb3069b0e04-536ac2d6909mr5891988e87.1.1727085510477; 
 Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368709684dsm3220907e87.148.2024.09.23.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:58:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
Message-ID: <utahvquemchnryqnbhuv2rfxqcgfowqqhjrbs3xtxej7ts47km@bbir4nq2mfwv>
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
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

On Sun, Sep 22, 2024 at 12:14:48AM GMT, Dmitry Baryshkov wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
> 
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 


And of course

Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")

-- 
With best wishes
Dmitry
