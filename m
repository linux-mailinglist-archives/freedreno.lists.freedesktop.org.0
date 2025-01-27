Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCD0A1D778
	for <lists+freedreno@lfdr.de>; Mon, 27 Jan 2025 14:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0914810E51F;
	Mon, 27 Jan 2025 13:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JOQF+pMT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D7C10E51C
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 13:54:42 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30219437e63so56708001fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 05:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986080; x=1738590880; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
 b=JOQF+pMT6yt0NcObN8yjUy7XRjb3A5UwrKwAgEqrDKEQhazI+LwhrvFIMwySO4wpTE
 7ghGCSF/GZRJA8cU4ZDpjHhW04It/GCK01zC+qvrrMP01pOjxWMq2nfgpqBkPjc9QbKo
 eAN4G7ZIWLe0qZMRR2sGOovTcyLnQ++mQVYRDc/SQfPzd+Eh70effkRYlJJ0a3TWuxaN
 gMXbMFuIyoDTY7EGYfjNZwG5lVMHwTVPXMhj4JEGXPTx6/oWzA7eXSXEoLnVIj6eZaoO
 sHHjdA8/ezbCtcSNGmYDfby2VZoQ0rt59mxzstBZUsI2S9RvUx9G/1pqUFWEh8h9ql3s
 CNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986080; x=1738590880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
 b=J8fpA7EoQN4bDHTxOkpIVdXGyrgyafcfYzuXBru13WqEr0g89QClA+/znJWwp4M7X2
 oQN+z9BM/wAKiqmNIZduo332CFsCHsbH3cH5kf/OhAxDtYUlDwwSmDz62pzNe6OuoGr5
 kInGxKkEEp1CoD9wypIbIC0RlegJG2kaPeq+ZRG/dQRrHpqJu85Lq0rH2gpxm6rJsD5M
 3u/YUhtqhi12uwLY7fvwJQFhilVxe3mSuSXEm1+HHIxQMSD34rtqrCSR7nckgwvZjhX/
 OrT9wkfBk+S++ItaHWL8vbEUa4JJVJ5TyfajQfyudGsL4PfjdVpK9X3VDccJa1S1qOTx
 917g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaB2eS2hxm0Z8I8Wu5UZN1j4RreJKWCjdwQI1mYaJutZC3q22ouO8onQPNkUS4RM9Z4lQIgMXeYts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp2j+cU4CDP96kiCw2aZZogxkwHvRDsy6b3PLX9L+uYeF+JzcT
 MhUvHgmn8GobcxrJHEHKi8Daf7gNbOzYIzAyIB1FiHwzg9ER+yf56VrllHfXd1s=
X-Gm-Gg: ASbGncuVgzDTjJhXYxbokTBoF1FRXIvFSD8lEw8asynMXrVJ6CEnItsACtvjbl/rZJ9
 018NiUmw4TVo47Lx0uq1Qzi1CR7lV7iK1UrlthIp0goZlnVeyaRR6i/f2rUBLBwV3SlT30sEx4E
 SUdsNi7Mu+/v4CTcXMOqkXRGk8tXRCM9aUJwuqI1VP/n71B7NMHzUyWBV91XUNpaSDJuj7aWH0O
 tMxMW6VdU87aUP3cRkiy+CkHHQ3jit8bu3AMKRbcYEICS+txLDaStNfDE79Zzvx1MIO0CsyT0Pa
 +7fqrd6na0P4TX/djSnIORK1Bj7dWP7afRxrIzZl30Ep1EaUEwgdCZnxeAaZ
X-Google-Smtp-Source: AGHT+IEZNRgyG7avdiIFrrqpYNJ9ma4eAM8WC44WUlJD0d6Eyzriv+5OslGJLlbJ5m5dOBVSOwRTkw==
X-Received: by 2002:a2e:a917:0:b0:302:2097:392f with SMTP id
 38308e7fff4ca-3076c33d8d0mr50387271fa.7.1737986080297; 
 Mon, 27 Jan 2025 05:54:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba6bd1asm14100191fa.11.2025.01.27.05.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:54:38 -0800 (PST)
Date: Mon, 27 Jan 2025 15:54:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Message-ID: <ccs5oxfgtk5zrnw27okvbskddqynurx6hl3e6g4zbmlqcqm4yl@sxghz575bqdo>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
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

On Mon, Jan 27, 2025 at 02:21:05PM +0100, Krzysztof Kozlowski wrote:
> Use the header with clock IDs to bind the interface between driver and
> DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
>  6 files changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
