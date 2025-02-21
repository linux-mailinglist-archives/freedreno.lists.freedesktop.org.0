Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172CA3FA5B
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 17:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E220B10EAA4;
	Fri, 21 Feb 2025 16:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BK+/lJvR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD210EAA4
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 16:12:12 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a2f240156so22196311fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 08:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154331; x=1740759131; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IbnhtJEa4SquPfm19GzdxAOTsJ3ZtzFT/hW1Tsd7YMA=;
 b=BK+/lJvRzKMTBCCIg0TBoGTChTW/vvwWmH3iqMmw25YUphwLCuMM3P1KDY3BqLUHdI
 eOUyz/pFWHfASyDAnh7D1SpuqC16PFgdNzV4+RhFbs+hqSakUrc9qISCUA5a0KK6eCgw
 XQHJ3DDkBIUDUvoeGRXpSoG6khhe8C6zInFZcKJz4SAh72K4JRSxecE6/fSpEILRXE8Q
 M6Z+wQhOf4Axb3aE4Ts4tzwmhFt5g9HQyYYD4iJNCnU0F6LWNAWHObsfDBA4yuOC96JE
 3g7oW4w6V1aM5bS5aNVvsiGY3aNDKseDr2A+P+SFQVG3ePwpVmqoIm/8kpUdkVyHZFkX
 VhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154331; x=1740759131;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IbnhtJEa4SquPfm19GzdxAOTsJ3ZtzFT/hW1Tsd7YMA=;
 b=JWJPucEHJFBQTyWlKB1muyxk7Q/svmxG9MqgJQoNAKsFA3aAfxMNp94R8X++8ezb15
 J1ylhsUpfNlJQr0vx5xz8F0vF8MvukpcmJabyTl7IOzc0q3cGyM8BGMVh4VHjk3tJ9AU
 bNXHisgJwiaVEHYNO913sk913MUI52TigRrXIYyhJHB/Np169/9qyedXQ0D73Dt5JQmS
 DCmkUPS2Bun9fxkq7Iqb7wtAjsMRrQdaTsMeNFoF/ZwaQxcpwCxgv8mqN02ziokl1zs9
 iKYTMhbU/wWEU3Sd3vKR0lRLC0KY7Z8rFioCtkdjiAY/V3/LQIyHIfYhZ4aWa7Z4yUaH
 LZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6bGlcNN98AcCDCsFR38+D03Sk4sKH6WgdLeuVLbDgNNRyNIfQrZS21Z8V7rD7Bk0unnLr9UD3/Zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEKVmDNwtM7FDndoMmrOfSI954vVql7uUL9hYm7WjtyjCiBRJ7
 tDtjW+3Rf+sbV6I7mjvhH5BZJOOQJMrIoFagdGmEXLb5kSGolFOkI8yIoXq4cmE=
X-Gm-Gg: ASbGnctc2FjA5Qelc0hL/l9Nec3q9DOcyemMuxbwLAfgNvIptFhq1Yu7PXSxGY58o8X
 SlS+wxDI50nGEZtmpwpPLL2sG8es4v1PKj3qTQ8aaN3ajJB94eiGzvuvcTejXhszyLmEO7Wy3UR
 u3+5zJtFgEKWPca3rasmd/ckwsj+ln27xvbmPKPmLWe8fSs6Z8YhTAQx5hSW+3NgYF3ksjhb9a+
 oRA81952YQMapcc9yz+ONRA0YWFxvbEon27kwCvZZl/C9NY1Qj9vENHiNR7yG3tQXt5N/I5BWu5
 MyhYSMpWWe4aGnj4vTtItnOPl2V+Ud0rfmfLVBxp2CEYabwOU8kNmCt9Qu8vAEsnXN8UbyenbGg
 IdKy0sw==
X-Google-Smtp-Source: AGHT+IEKm09ffSc5M3frvvgU3E9J1EUpouTHSwPL5rhTUfv0oqJAypzPAMmviTh4qLAjGZjUYSJxPQ==
X-Received: by 2002:a2e:7d07:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30a598e29c8mr15100431fa.17.1740154330646; 
 Fri, 21 Feb 2025 08:12:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a25195701sm20109501fa.4.2025.02.21.08.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:12:10 -0800 (PST)
Date: Fri, 21 Feb 2025 18:12:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 11/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
Message-ID: <7nd7j7wslq5fclik6trs2egwj7kx5wy246ljaqmwbkvnutu547@qgxcx66kjsw2>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:21PM +0100, Krzysztof Kozlowski wrote:
> Before blend setup, all existing blend stages are cleared, so shall be
> active fetch pipes.
> 
> Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
