Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F0A47498
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703BF10EA2C;
	Thu, 27 Feb 2025 04:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ed6PyEAt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54F910EA2C
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:47 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-548430564d9so497258e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631066; x=1741235866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
 b=Ed6PyEAtZRllE9/zC06Gy4dZzsOpk//BbU6aheob4OAQTh7D3s32FDGcFKym4VimTW
 NezlKNOtFsg1diMpsvRPnMRsH2swz98UiL5q3Tz3Q8j72xoCQOFXoMYEacIupTaLUTFZ
 KPNtA6zuqQRva0dLPuSRzubIxNCLM1hX3SLO0EqC0giPBBULgI/zKBhcVh//hNFd09WX
 OBl+baWUFxxGFhyWTtwc6wyy/4uXXh3XHK58oDUaa1gCSc9tMdggiV9vu8hUNtK7ERPm
 sMdgOZxbSlWDWtrjJGfFHArqmT5bSxu35pKa18+yoYiCF57Jr2H23yrsVJWwS+c2xLss
 8lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631066; x=1741235866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
 b=W81F12ostBz/djEw57WbdxlHbFFxiOViZ7lYzBuuLneH8kfClJGKQBZu/icHXi7ywf
 abycm0jmcDTM081uY/DYoqQJIoM/fkelQ4PYSF0ilVvVyzQ9oFbZhOKJ4A1vLUnQPzxy
 GraoPEFMWsYcLQIlLmGp+wCaESyxXsAkh2LG3ClNwf5GjuFy81M6KW1+nGldc4SQywCW
 ihu9Oeyx2W7oX/rNBeKPRyJR+BmH29fCdtGfepIl48SPcYlEu0EMnVjOgMHiRvecB/iP
 d0KTUhYyOgok5e81Yz7DZ/8F9FYp3gOViQm54UM3cKj/A8Wt7EBjwevAalZYQo/1wGwI
 fMGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWegDbxIgy2+0+uVpVNpPDfZgATtkcl3VraM8FDSSgASmevs1uWoLCFEqNvpR4gn+mMIJJl+fpmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvyCDCmgP/TJG8TtFv1H/d6I2kEy8lHyS/N3R1q+NlJm7VNGRk
 X8FYy1fT+mwlbfuibk1C5Z3m+kC1ddSAoTCBXLfkaKyB4EH5AmNPjgGwIt+3wg8=
X-Gm-Gg: ASbGncsR012lxfWrD8YQB8+QEbi4LCLRGHYxn9HOzis/fgT5qvILwtRwfwKcFSH9lWo
 8VYksSifw2dIBjNZA2D96X0m4hMBORbdic10+bjWgu/drIUURggEWjVP1NVk05SPqCkaLDH4iq2
 a3gtehXJqKbyzsDmtlLU9qEfm36UrPDrD3qQVtQ2CoHVout5OtC7OYkR/12zeBUb5RGvZ6O1yJV
 vPDev4ZXS9qtiJiI94nrk4DKm26OjKzFLd2/wcOdvhB8fwiwrKMI9jXV6xdT/hm0tOUJN0+psvO
 qhXvnFY6O6ph9lMVkojpUyUoK438BjxFbO+QbONUCQ==
X-Google-Smtp-Source: AGHT+IGd2rBcbdDnOO9mUn66I/dFLYCzyc1GlDdtB8pQVwoJ0TBIn1SVa4Lymy/rEO+PlXQ6q8GIig==
X-Received: by 2002:a05:6512:3d0b:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-548392717d1mr11821826e87.51.1740631066310; 
 Wed, 26 Feb 2025 20:37:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Date: Thu, 27 Feb 2025 06:37:25 +0200
Message-Id: <174063096233.3733075.8120055678466952428.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 27 Jan 2025 14:21:04 +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d1f28e30a525
[2/2] drm/msm/dsi/phy: Use the header with clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5100ae76b5ab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
