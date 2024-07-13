Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642C9307F5
	for <lists+freedreno@lfdr.de>; Sun, 14 Jul 2024 00:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CED10E0D9;
	Sat, 13 Jul 2024 22:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UHlwztJ1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6771810E0D9
 for <freedreno@lists.freedesktop.org>; Sat, 13 Jul 2024 22:55:38 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ea0f18500so3150953e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 13 Jul 2024 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720911336; x=1721516136; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ncYPX+7Asq9PPYrO1DJYNdoPMBQuM8Zo8xSB8y/YwE=;
 b=UHlwztJ1nShKruj71RX/sVi6jFYiDSPK+WxsneuV78dI4mnUt9B+ULlWqVKPWivqxf
 XfASi/hzWBwIYH2uvhDpfYN/iIUbxWIB0LwcHyZA6dHukEFLlrGrts+h0tLMzDjpRWmS
 SlV3kBaHC8c+EV0kfeUqXa0m4TEGGjDXKEs6JKkmY/STIkcTzJ+AiAaG7zqMmzXsHSFe
 pHsdlg9mcmn1BxkSmFpZegnBhzVKZhi5CgIvZ7ObsQ0GAm1yb7l6uwBg5bfQYl7z7lJB
 oE7faQCkudPuiZqaF9g2am0oaVNwWM5mSoaeDsD1SLHNaO17+fvaaxMGQmbMJcDR1PFC
 2fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720911336; x=1721516136;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ncYPX+7Asq9PPYrO1DJYNdoPMBQuM8Zo8xSB8y/YwE=;
 b=N8qaPZ6Ol+herEHIQjde4SEACFSn3XDgQo/bpA1FhScG4o22qkX1qFUAFDaRHcbM8R
 tDUyXczAldanFxRfTIxfIrQhm80OzgnUW+03JwXhh82UxIb8WGONbYXY0Q/jRZBWx8+E
 s/KVjEUFc30XXmUUkZSQr2NpI52nAyqK82sPkBTAuSHB0ahR7mnWQ0yF9F6g0HK04lS/
 3B5DEofMEIJ30DT89RBFI0+CSaLSjOiEd15uYso2eHO+CrRAsmih16cy9UQOujMIWVq4
 sfIdDxpjl0ts82sbSDpPGHHcJdy3RSsPf7kAJlzL2sa4LuATxGCrha5XadBUJ2m+lWAQ
 ZCyQ==
X-Gm-Message-State: AOJu0Yynyz1UIwpLZ/28vRFGriu52dwBny1TrGOahsuf2X6fvfNI4TWr
 Wpq7caX+U4XENqX/pjiYdLl2Irt5bnZwEHjqWi6gDO0cYukeVVwomvxJY/+WE00=
X-Google-Smtp-Source: AGHT+IEhwHVC3K0rEjJohPz1JS1RmLGBZWld5R1IufdJk0BRYdLg0pMSt+FKcRLiIV3Hgn5icbbQ6Q==
X-Received: by 2002:a05:6512:1384:b0:52e:be1f:bf7f with SMTP id
 2adb3069b0e04-52ebe1fbfd5mr7917903e87.27.1720911334977; 
 Sat, 13 Jul 2024 15:55:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed252d543sm308907e87.155.2024.07.13.15.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 15:55:34 -0700 (PDT)
Date: Sun, 14 Jul 2024 01:55:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 neil.armstrong@linaro.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: enable widebus on all relevant chipsets
Message-ID: <xmkcy7xjoaodxnyzbskjb7y5xne444qx4jdrtcgoqwh45aqjn2@4rnbkhr5uuby>
References: <20240711224850.1672662-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711224850.1672662-1-quic_abhinavk@quicinc.com>
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

On Thu, Jul 11, 2024 at 03:48:50PM GMT, Abhinav Kumar wrote:
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
> 
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Although it doesn't seem to fix the 4k screen corruption, I think it's
still a proper patch (and we should be following hardware
documentation).

With the Fixes tags in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
