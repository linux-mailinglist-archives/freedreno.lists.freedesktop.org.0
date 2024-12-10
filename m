Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205F9EAED3
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 11:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FF610E39D;
	Tue, 10 Dec 2024 10:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nPRE3XF5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37A10E39D
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 10:58:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso2945703e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 02:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733828288; x=1734433088; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r5ZSfy2xDxDQ8s69afPzdWrhJXHaV4xhzcq4XiywxXg=;
 b=nPRE3XF5Z6HrQNF6KMwvWWKKt1m+M84fV+D2Ffo3nNPnVoQNQX4ffPXc75TRRL0IZk
 UVGgL7JhlmBPh8DXtxmIT/Wwfg64lYtJqS297p95gFqcoHUOcRv3KndbdH6f7k1XZDw0
 u2GV0Y9hz6QukmzPVs/OgmW//4f9leG4JhYaWR1h+fclgVUSdGeBuNZeogw/K0REaNXK
 FaImSOf1VN//sVVZoHtl7mI9IzDkus5j8TW4pbF8uFa3Ztoi9jTfajXwU7QeeipA7qxg
 X+wIIP7iJjcgDMNeHAot1Wh2pBVzFtcPUQNF51nTa08wKiAat6uoqIbgvmSKtP66H77I
 3l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828288; x=1734433088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5ZSfy2xDxDQ8s69afPzdWrhJXHaV4xhzcq4XiywxXg=;
 b=XwIF0L9myTRSF8ACFHd56jmNOOcsitkTptMRf1bLLI1oWcbUMwLoE1iorI5FCwzF3a
 9MQJco3Er0V7D1pigg/FBfAAVilFflb2LgPH9m4gUyQDgnOQ015lk4XX/hqou/UZUbjg
 GBd9rqISLHEB/Q2q+UBbMGMWRGflsBp/oQA5K84k+x++OFew7r2mVaHudTmeDfpejvtc
 17zxFbhW04u57FR/NJlCbGpCRAmy2ByXv8KLTuopElujI5Fg+d0p7/uzoN2xaLPXkiCq
 bMosKTlisDM4RxdP3Uix3+B/g6wyCYRGT+gcwNK5gmWuPYPQRwGb6fbvW+TRy1cfA33n
 4/xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWgLjFE3yezzn6lBIjCcQZ8y5OWj0Wd0cokgqArKKCpHRl/sgwwERIP/dQtzh+FXnYHWMl+00Rsiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnSet2rWrXwoeOWASNwc741LpY1ZA0k+pXMaM3wyzPPfVBW3qg
 2d3TRUw3Uv1NAC84qPWpZgwfqRzkjVuJtTmOheGZMrCLQwk1g28vIoKW0aJwGKw=
X-Gm-Gg: ASbGnctghbgrVHgeHSF1K3msovFnntH+CEFHc9IMM04ITdywfGaOIMC+Z06qk9umbBP
 Zj+VbtYoCuOiOdqPIIKjJkXbdeevz+hZYR7OZLYViB0VaxVjMw+q39lgy1HKZcb5Mx4JRwLpE+l
 anYM4hgkS65JJMzJg+Emvkys3Ot0U8qnz6qr4n6yH9X6iUet9inD9jxYqDV/xgFCi2A6HLGaSWm
 RsY7pjx/mS7wD6mtFtXkcDHUFHeLnqvuCEa0KoWWccQx/nqKZFNhujYLkqqRwtuwC2+x284Mkyh
 UgwYwMAoeOtu3D3ZX3P4V4T/+5cw5e3adg==
X-Google-Smtp-Source: AGHT+IE7+ryAMqJtCxAuJvc/qOGq5Ck0ZMSjTv00rqBtwofn1LyRnlQNhWyrc/EQiBZpPjSjCdJE+Q==
X-Received: by 2002:a05:6512:238f:b0:540:21d6:d681 with SMTP id
 2adb3069b0e04-540240c0f47mr1559055e87.19.1733828287631; 
 Tue, 10 Dec 2024 02:58:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3855a6b8sm1232351e87.69.2024.12.10.02.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 02:58:06 -0800 (PST)
Date: Tue, 10 Dec 2024 12:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] drm/msm/dsi: Add support for SM6150
Message-ID: <3cr32yulhhnruhi5cf4agxxottt4ofnwbnwjqv6ib36ebipswd@qhbuhoejhjld>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-7-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-7-2d875a67602d@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:53:58PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on SM6150).
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
