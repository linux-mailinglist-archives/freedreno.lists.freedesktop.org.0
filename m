Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC129A474A3
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DAD10EA2F;
	Thu, 27 Feb 2025 04:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cFXF4Bbl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9E810EA29
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso530826e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631077; x=1741235877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UXkglY36wWDlWtl/BHCk6udvb24Qtv5ABZXv7WU9qc=;
 b=cFXF4BblF0u2tB3R+7vl6zFcWpKyd06EFZSMH8Z2e/gtd3gQLF+TMwt2j4SpZjm4cS
 l9u2xQ9aUHILm35PRpr7uAUfgrj1UQ28XnaFkubGYsvwHeoYZsbIcT81tODI0k3WXruj
 QWLQbV0VW4P8inNOSZc66aR4ZWZw656ZRNWxREdsMPcWgfembeXPn+0bhlkakb8I1jyD
 lAtvCKMXpKr/TbnLnKwflAlIsm4qWgevZZSHh3vwcnJroD9vwaXGYSWkEbZuVo8CrQpd
 yLMArltVRGgmh4MRA1CPiVm5EtAJrevPCCz1EpP8+6qpXcPYgcStuquYzgTVTnMXTp1p
 l1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631077; x=1741235877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UXkglY36wWDlWtl/BHCk6udvb24Qtv5ABZXv7WU9qc=;
 b=HAH2ninlHCK3IMXbmO3ZGsWYMT/NK3UtCgS1OI07nqojb6UPgvLr753HSjlEVsWRUU
 P8s4f4F5ACCCE/2Q/hQuRNKq2m/kAmRfLhRHviPf6Uom0uNFgWXni/EP/Y73i8B78X6L
 VC3FwJz3IF2rV30lD1u7ZOgq4cMV8yDmdEdi4htSOHCA7s0oJavTkB0hd/8TCk1kC/5O
 OUMpTFFAIcD2mAgdODmQHymIr6OaPW/8PijK1FV4PV3le46k6ZY6lsE6ZVumNz8j5iTr
 RWgVFpkZIVlS+cGotYnRl8We322bcaRsab9dt1yZ6dvtGRR2qLsPTTSC9FbtQwjXiW7t
 ezvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAIEHuNV0xje74X6gjKP1Xf/WCo//+qRn9qSoRloXIInc76B4kn523JJ8vnyoeBPPlYNCrKwpZ4CQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1SWXoslPB8HyQHfkr8xV1XGRNuBNkdUCTXUxgOMvAgC2WvuCV
 9O8gqc9lAyak39odjWyW4ydjY11GMEMN2BJAKUE2e6LbWz6hV1AjLyuOfaBDrVY=
X-Gm-Gg: ASbGncu7mZRcMrKzQsP8XQlo+a/syZclZzB9ecqu6KJ4kCp2N1JFiiQAYO9pLY/QB3B
 /RNy1SUyc5Mhqr7hmrh7uLzB4rFv0fY7/6eydsX4fuQ/2nbsOPNOndfMbsJAZLLiiE7FSwZajZ4
 Viql8sCQZwxojFrVJx5Cr4NqebNhtrtP62cUW6kSQ7Ictf8b1BSnWDuWdJB028E3Ahwg4mF70jL
 WYZBuzHhlDViupVMN6oeqGV4JnHWVCzMbym1UEf7MaJWKui4Am9ujfdvT5ryQPMD1hsXndIImh+
 7xWLSZuCBythFGQJpgwrYp0ecngun2quxajd2t/ARw==
X-Google-Smtp-Source: AGHT+IFGmZMN8HiHF0dUQ37JUE6cIWIJ4a/etc3Mst5jjknmhWL9hK7goaPc0rslMBYFrA3hJCn4bg==
X-Received: by 2002:ac2:4c4b:0:b0:545:76e:322 with SMTP id
 2adb3069b0e04-54838ef895emr12381337e87.31.1740631077556; 
 Wed, 26 Feb 2025 20:37:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 0/2] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Thu, 27 Feb 2025 06:37:30 +0200
Message-Id: <174063096227.3733075.7538565845819141467.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
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


On Wed, 19 Feb 2025 17:23:31 +0100, Krzysztof Kozlowski wrote:
> Changes in v5:
> - Drop applied patches 1-3
> - Split part touching pll_7nm_register() from last (#4) patch to new patch
>    - Thus: new patch #1 in new numbering.
> - Link to v4: https://lore.kernel.org/r/20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org
> 
> Changes in v4:
> - Add tags
> - Patch #4: Add mising bitfield.h include
> - One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> - Link to v3: https://lore.kernel.org/r/20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update() when registering PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/de36ea80b303
[2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0699018b41d7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
