Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21DA36156
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 16:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9855D10ECE5;
	Fri, 14 Feb 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gg8hE+Kk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179110ECE6
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 15:18:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-308dc0878dfso22742091fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546315; x=1740151115; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
 b=gg8hE+KkafiFsMwZJ+3oblJ/U9PRfYI7SvUGiVojrBbzvRJPeu/AMSa8VzTCTJNOfe
 FOF5rzmuUN+IARW1UHabTl5lw9arqen/XXM+xw1hmCobaOMPU5xS0dZ//YE5zu2Rfm1T
 UEdb2Rbr+Sd2iGSzr3jNH8L9RcYLx1HDq3PLhu+yKS9zwHufhH2+aisVLaAGQQcINE8z
 n1ZMkr51TpOX0a10rndfyZfHFZb3T7sSJCsY4QHVy2pz6W8Y9kCTchd+IkGpV5KLfFdc
 80lI1dLxemw98NMXEoQZrfNAa2GcJFifRP38ZOfCFV1jvr58DPkmt7RCmlpThw/TWYaf
 5XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546315; x=1740151115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
 b=W33a16MsEa30WPJu9LDvXNllmBLVUo0c+LjD6wixcUkOH1dqYYTCR965OuHeYyk5oy
 /l122v0ZfBsEQugFNEoftvpe/jErFnSz1ooSNgvKV6S8+jXiMkiZUaxVVexI0QXSoWhm
 yVChlJ79xojGmndldZS1FRa11+8WkKKyPcyt5n91luGBLrbpZq9Kfht5VAxgFqk06a7z
 /uxDu5PvrGmJ0gizAtVgKCu1+cEw/Kk1cPV2iAZJudibpHT13lgL07het9ysBTo7te1l
 lNqwR9LWQZqycCsWd+J6avQ0rmIAac6TAOXMF1dgfp/u+Wuu/Bpk8MEaKarogR4tXIYh
 01jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXOYmI+l1jV1O/nxrbJ45UrUp/GemjN/MEbmK+TRdE2XicyZNQXOrIqgPKBT2qjci98C7eszEEXMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIpVxgdlBhsUnybZY4Rhk4P8vhPN0py+6eYnvLOraOEIPgZ1An
 qZMygHhHULAEAGJwyPETUi5EzcHAaPkS6q3drcSWXHnMUdT95LjOwyU5iEcGddQ=
X-Gm-Gg: ASbGncvC8EkrvziwecEqXMVAZEK1qD2w1HlzfX0RHoDLtRozXQd0C1rCOyrLLWe9LDD
 oUSDRwuma6s9TqzANaZCM21Aw2LL659eu7Rt5zPv524erUVCt9Sf4sLa2YcA6wkM11MT9WPj1u6
 GLdgeNYSHsLv+HofuAvevso+9vxc2qk2tk5dg0CS8P+SgzZLvgJ/H2+Ne/p0ekwAbQyw3e5vV5y
 pVO+ToeqKMdryF0xZcikq1tdIICUY3mCr+TV3LTKQm999brrBpE+UBX13119E5tPgNbWKWx7o8q
 lqThUOqjtrbgd3g5rtZjg8OQrDnQJwkr3vN6JbGUQZQDB7nW7yB0+IPNKAAEZ19qOYqF3RQ=
X-Google-Smtp-Source: AGHT+IEezzYlzsneQzuZxQe4Yo+jf7QLilk9BuU0obW1zoL2W/XDA76D0mSIeKsRAt8vyBqyYw8shw==
X-Received: by 2002:a05:651c:b29:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-30903630202mr37322251fa.1.1739546314624; 
 Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c528asm5887331fa.22.2025.02.14.07.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Date: Fri, 14 Feb 2025 17:18:31 +0200
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
Subject: Re: [PATCH v3 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <g6ddzfh6vsd7zgyopzassfp5ehife2t5mlq5jbjdcas3ewed2t@th37tsj7mmsw>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
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

On Fri, Feb 14, 2025 at 04:08:42PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
