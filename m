Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124189E8496
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 12:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D8D10E10F;
	Sun,  8 Dec 2024 11:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yFOmHsDo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35B310E19B
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 11:08:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5401be44b58so257495e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733656083; x=1734260883; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
 b=yFOmHsDoiJ8hoq+ej+FCtdCzJKuQS3nsZX6XsSp9KIx7tRITQBweRni5DNWN4DaEVt
 RzlkvBnYQwiVkD/bfmJ37Hq/BwdZafB2jUMkA9rZKJQxJJqDMuCGaUY8nPA3XY3/X1Sp
 D+vZH+fXdoyVmxPKB+VqsZkeekQ6qx1iKyN3WNIZPgqgHq5O5kKEtNsu42hNkwx2S0fq
 X5omef25iI5QuX9/+NCfwC46S+wNvXaGtwB0cxw7Zc5vvlj9PdvLEMGCGtxbtcajuk/0
 BH1XfE4CZimQPLL9BOjlYPshU+TM8lP4SwAnTHe/JNeYlHG5IgNkGu1IqygdROJCy/E1
 93tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733656083; x=1734260883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
 b=kFL8Hxw8ydn4NOuJoOrWjwhlrWKHUomt8TzjhaiAw6we1fay6nzgX5qD61pMOvcWvo
 cItrxwZv8Ym/Gqo0utP0sa4UpSuYXEVMUH2T5ywWHG4OdegkbNPNHhA9xar96XpuhFhn
 rBrHBBwOjd+xHwcxtUd6yyXgFEYlw4l0F2fHGaEiM+KMDs9rSrlVV7SzrjHAGuQAdEU7
 tY7iBgdQTJuLg2Z9ukGOMkajxpOC00RmjbQpjk2T4xcZ/LrlPj2JgYyauMFkRbl7zb8/
 U2MrsH+rVD48sikSKD2RIKfHGBJ4OOUTOI162KsU/Qch572pcHd2+x15bC5bHvdhDvCT
 4sBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV555ZfR8i7bOYy/Ft7F2ohi0S1WM1FRNoYkh/Ys9ciw3NapcnWHgFq3Bw5p3mKCmF1+3o4Exr/09k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm2rUQ4Oyqca5+WWY/pV78FQLwW2JuBctoiD/YxWsfWRNRmK04
 2/WsI7AXBF+tuEFMikAS71lxoKL1XFUaXh97yFn/Orz1zVnDbIj9xRFyA5rMoNw=
X-Gm-Gg: ASbGncuGp7hZx/zU6gcR9KBBixLjCElzo42Kb9a7dhXGIoDoYmE6H1LSMQU00wXsK0x
 lF+5u57YR6MCO5F+KP6m3f8BG0A/gJbT4ffn6MIn3J+93jTp59uKjum6JK48OZLFohfVN7Gmv6M
 7ocASoGxVuI0TZa3/ioifA2/Noet5hx/NKaX6sCiFttzSSB7KCO4W8ZHNCeVXFNrOw9ktIpuzWk
 HTcLYCkJNdcDh24D2lzorf0b5MGfN8i/06mVSaxSPNzdis6LYcL5YZCfcBKSqqj6wvl2mteYVtu
 518xFQffP0B1jJ/TuVmYgwdNmFTfBg==
X-Google-Smtp-Source: AGHT+IEPwz/DlmKiUGnz4YB99+xhYKrQeR262SJLPjLUw84SmBKtXiKNCszuVXMjeWuRzdQf1Pt2pg==
X-Received: by 2002:a05:6512:398f:b0:53d:e4d2:bb3 with SMTP id
 2adb3069b0e04-53e2c2efb94mr3986572e87.50.1733656082939; 
 Sun, 08 Dec 2024 03:08:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e377f3ba3sm648212e87.187.2024.12.08.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:08:00 -0800 (PST)
Date: Sun, 8 Dec 2024 13:07:57 +0200
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
Subject: Re: [PATCH 12/45] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Message-ID: <zdod6f2a6c33wbjxcw2kqg5mb3lkedmfxq47lgjxzxuul3lcsb@elka24uhxyw4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:43PM -0800, Abhinav Kumar wrote:
> dp_bridge helpers take drm_bridge as an input and extract the
> dp_display object to be used in the dp_display module. Rather than
> doing it in a roundabout way, directly pass the dp_display object
> to these helpers so that the MST bridge can also re-use the same
> helpers.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 49 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     | 12 ---------
>  4 files changed, 67 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
