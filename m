Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF8A3C5C0
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 18:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761810E86A;
	Wed, 19 Feb 2025 17:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h8ftXl/f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D8810E49D
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 17:11:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-546202d633dso51686e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985075; x=1740589875; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
 b=h8ftXl/fibPLV2/VZqEyIWgbR/olcKYcKSthTxnDSYgTfL08dqNeuCmP3rIrOI5Kif
 957PqLuoIlUWNgngCKjDc66VYoGbXYzdkdzRouodGj0ojkboEmafIdfag6fAHePDPfbV
 hAbBL9ZLRLUrCgomZ2fUrZy0KVZgC6bGI3FEuy61GEHxf9eCymGYMrFvgf/MheIc4ge2
 vINwNoU1DXzHtEXaODiTIekOlhemZJRa1qDxUF5GBE6eQPVvYJnJuGXZ8591lMrePw37
 8cjGhh+4hwVovRkyoc+22FbaqJ8xyVp8b+ahgQEubB6xnpM1aUfnC0mJKMCdg/S5Re0F
 DLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985075; x=1740589875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
 b=Nx5mHvwzt3JBCI8arU16nCrlY0A91JnpSXuB4lMkVEhPofChqylHgFf7RMCnvmWde9
 K2BOb40bqLDzFGMyPCFe0LcvgmJhawqgulfaQufLLu6CmJuptyanSmGcystzJSWvbYwp
 bNg5abZIQVw+ETs+Uvi61GCUTxUHpPeh+swMrk8j59jvMFKtLmR6FPd/HrJ5nrwc0BQp
 q2d4mUgFV9lrxvOnwK+843iq7LXhXmjHhf3O5WqZTvQajlbVvc2w5rQpRCQjB1fIwq1a
 QQCwXQJrDeshZZGhU37Z4DNvMHr5pA2vIl12HORrgTx4ATVpelPQraUcYQHirrZ9IsGE
 a7KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrgLbGDbPkBxo4Qms6yMp5xvuaH0ov+JWH7+mD0YNYxhxMuTEFZ2+59w07XiKN7gOkw1Z7LwACOX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBiSBPjpxc0LXMusjeUqUKlgCC96nsbCycJjw2KiQqlgXeXctP
 kfI37js6EBI9Unp1PThzDUpk50NzJCyT3R40T7F+7LpLNE1HnqgNLnNtCYRIrCc=
X-Gm-Gg: ASbGncs77mrHnoZAjGeZts4TtGoCN9PycinnirUeNDfHFW1srbDK6ymmy8XP2fCgCPA
 i5HWkn+FvQr3IzGiyq1WagzX41k+thB+Gej6eDE3qE+cAYfnCXnmC+gKkp6Z3G5XhPr5HHOb82p
 WtunLO9t+/IkAkeBtbtRWmZpYGzuDHCBnPNNOfa6tRCElvyYNayb18KJqCCXBYUEIHSj/Vflafi
 bBhkqxXvOSUbln0eTX6gzol6axPOToXXvwShI7/LDCLvqUeQn30etrzHjfpqq3gZ5H1yVhECpe5
 guqXO8S0nL3h48xKqek+qoOj9OBg+qK7QcyjXDs3oMgV9s0E7NBYOHaktQfBJVysq72Hfwk=
X-Google-Smtp-Source: AGHT+IH7FL01qZOB3XAPbsmFC6KyEv2EmZ1yIsxjB78l1rwLXp5knouU37jT15QdaWHDAkHvPlzRzg==
X-Received: by 2002:a05:6512:b12:b0:545:e7f:cf3d with SMTP id
 2adb3069b0e04-5452fe2e4aemr7300090e87.5.1739985075494; 
 Wed, 19 Feb 2025 09:11:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452f3d38basm1661990e87.222.2025.02.19.09.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:11:14 -0800 (PST)
Date: Wed, 19 Feb 2025 19:11:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <snvornde63yoviyjn6yitmz2vkw424jkyv4434jre7ts65cqe6@tbqgalok5e5n>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
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

On Wed, Feb 19, 2025 at 05:23:33PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. Split part touching pll_7nm_register() to new patch.
> 2. Update commit msg.
> 
> Changes in v4:
> 1. Add mising bitfield.h include
> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
