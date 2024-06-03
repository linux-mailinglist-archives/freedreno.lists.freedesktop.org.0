Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716F8DA9C8
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 23:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B246310E2E0;
	Mon,  3 Jun 2024 21:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lF4Q8XlN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCC10E118
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jun 2024 21:20:07 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52b840cfecdso390639e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jun 2024 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717449605; x=1718054405; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U1nvboUWrwT+izheqIMKJAA8UWhsuG1LQYHh6Ih/rJg=;
 b=lF4Q8XlNZkAerVi95OJpDQfdpjRXTrFx8ZlUMx2W5MMFcYSm0NG/QnFLt20As/HLK/
 fP2cgJbt/lXtDnA9A08V3BXiooQCotDsqIPPV5pGzp8Qb32wa+DkZTI56J+Gz9dpAcRx
 xzaveRux3Ul6ztkOPwyoLIwgpcXpAhKujI/SSUqGLWFiEiQS0wSvO/FOTgzSvPwrNdop
 M3p+VLAbGoYfCpL1hMDrhAcj68P4trXiXOhxBX1ABWfLJHQEM3RnmZ8MBCRZwJKwghpz
 +BsRlXmNty1PdWjGaSDLxQ3TS4ghDrcp6+g30kouwLpKTQi2gu+nUHOUWQIN8A/zfKlc
 WG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717449605; x=1718054405;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1nvboUWrwT+izheqIMKJAA8UWhsuG1LQYHh6Ih/rJg=;
 b=RSFOuAwrAJrqpuV6LV8D4Dwcy7DTLBHkyyeICgxqhYm0hk2Wgt5CH2xARjvWcC3y6+
 aWJdOT/y0VF6qEbucYeYFjnMPby1p4Pa1UyjGVfXw9MMFrYUuClqg5TYbu7uShxFyBYo
 IXc7Ky3mfrCyIQZYyRtKrkzUQk5tN2xKfgCXSCGQhMM1H/4NDJSKuF8L0G4EpQk+QqO7
 wCBPiaEUef/VLCTf9/x68U2yQNdBiCvdQb+7BLZlu2AssW8RD/6yVF6eoEJHTAbV4hud
 m+feuR89WegApF6r8CHwZ0COAvsT/SZcAOzs4kr5aFyv9DAv5ze1fagJ/QdXz3XS5GfJ
 0J2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDJvhhEnK3eeJ+b7uLltscrUw1Xt3o5ihpwk69nT9sZvX2ySuJ5pqRFatQsfHscbmumZ47t9B4XUqTv9T5mELzNR1+xMtpuxpMR4sn/G6h
X-Gm-Message-State: AOJu0Ywr466jpmIu/JPYe46RNhoZZL7L6Zyfq0hiNm3HWFuLQT5hpaFb
 ZWLxN9PRpTl7L7ZsyDkqEwimA/GPNvBgjR/Bxi3hrDeDn69oJYxNYPcasqHnkZM=
X-Google-Smtp-Source: AGHT+IFhhrjTB+1TjVZWFCGgzUXx7UwmaTcD4sWkJy1XVm35ERd7tph+1HliSXbdZWovKYKrgPAkXA==
X-Received: by 2002:ac2:4c86:0:b0:51f:696b:949a with SMTP id
 2adb3069b0e04-52b896c7ae7mr6800530e87.48.1717449605203; 
 Mon, 03 Jun 2024 14:20:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9f555afasm128873e87.289.2024.06.03.14.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 14:20:04 -0700 (PDT)
Date: Tue, 4 Jun 2024 00:20:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Ryan McCann <quic_rmccann@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats
 arrays
Message-ID: <aid2ezgphqbshep4vulpct3yfsnhmt7prwhyj2tghvb4fma7kv@ztoe6v4xbnui>
References: <20240524150128.1878297-2-bigfoot@classfun.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524150128.1878297-2-bigfoot@classfun.cn>
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

On Fri, May 24, 2024 at 11:01:12PM +0800, Junhao Xie wrote:
> There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
> which cause weston assertions failed.
> 
> weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
> Assertion `!weston_drm_format_array_find_format(formats, format)' failed.
> 
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

To make patchwork happy:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: 8c16b988ba2d ("drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv")
Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
