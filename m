Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE61AD3A4C
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78910E57D;
	Tue, 10 Jun 2025 14:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ErSiYJuH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD33310E57C
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45306976410so630665e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564382; x=1750169182; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c08nNQiRjpMuZiP/f1jVDn68latr5bwhdLQgcHIbV2Q=;
 b=ErSiYJuHCONjKrrQk2NqgJdTru3VAtozSiUEZd3M1k5e54B6upk8tlnbK2p/Wxwmkc
 XGDhG78hyEoZOopYBs0HWQ3/hLnwCWuIvUETwu9JevrRPLIIdzmD7XToCiACA3HIh7UG
 Obpj1M7DIDi9NIJFrtKbLahIVc+p1d8oLANZotHTwhma7u1bPispOtHaBTNLYZ5hedRn
 QhumD7NsCz88tHCSNiiJiUKAU6XVQAeVX2auA3CNDE4t45OB/Mzqj95zn8jaPiY87+pa
 t8TGx4/zpNAbpOOku5+ChsaNO2nBKNPFxiOHmJL+UQUAcRwKhQC8DOK9FzenCl/Ud+ir
 hy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564382; x=1750169182;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c08nNQiRjpMuZiP/f1jVDn68latr5bwhdLQgcHIbV2Q=;
 b=igttdt+6I5uv51c51opNqW5YoCLX7JiiRIfkJsdD8A/SkXyAZJ4IAqLpFkvtBeboec
 VHSCZOK4f3kKeEC3pEL3rQoiWNR3k06S5YHJLswoDPY8jTJmbhFnMzeBPJVOByyUygZK
 kIWbcAZd/sXD9WLR5Avip4bu30JUmfblgq5LJPq/Mi/EGs5aXqsMWJTh+ZrzuDwcMWVQ
 Eu5jzdqfIh1z8NnpVtxiWmU4MXJI1oJicsiZ2wSvnQ4BcypI3vrKmwv+e/G8tgB7nRC2
 DRouqy8F43B8f/RKQ+W31G2ypE/pcFW+qB6mjDDanv3Fjhpgh9onKnK5ONuatO6Fs+tc
 Yzfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8BnsFs3Dn/dvnYeXZaIE0W2nXrU5wwqq6YGDVoleV00WMxlUPrMLu89tfSIpkveIjtxdJael7JsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJ6zLgZtn0ZEA6IcQHf2eg5coxc3zmDlQUsYMc3doVcleojrG
 q7qgfw7SPYAoyUGUDyjX9aeYDhSC9wOrc7gzRq7MdEMF2yS9mMnweQs4WId0Sc09+OY=
X-Gm-Gg: ASbGncv2hIjh550lbekmwElj6yh9tbzf2OvBXGKxHsCeYlCN6B/slzfEe6LDJ3EE10N
 Qi8j6X7PB4SS1bU38rPjzYzbgb0p5dkHUxG4x0VZTYBckMJ/dwITDcLhcP5VF9O5sThEmH/ndMb
 fSqqrbgwMPc6NAZFL8nsRu1cBUIUP/vJ+9r+juu5fmHb1GyvB/g49ws5PGvuw/kFutkj/Djq0NL
 xfPZsM+7Bz+G6Q7Y2Mv7NdSLSR9B1lUgAafkJrC+iNRptxXP+Wu+OddfSr2+n2VzCfyRDSQpuZ3
 YZ8Q0/iun9S+WYQ204AdSdePmFxZmEX+aIZ3xpBq6OYY7t/A06lgtjtHNFzsfuwccPiPp+XQ6i5
 Te/N3vQ==
X-Google-Smtp-Source: AGHT+IHDxukPheSrxBOvxKpZYaa8h9T+95Gg5jKYThUcUHQbgCqlc/EbIO/Sp6kjBnRf7HNWZ6eJEQ==
X-Received: by 2002:a05:600c:c04b:20b0:441:c5ee:cdb4 with SMTP id
 5b1f17b1804b1-452a470122cmr33063215e9.4.1749564381956; 
 Tue, 10 Jun 2025 07:06:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:44 +0200
Subject: [PATCH v6 06/17] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-6-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hOZPlM1KyWeQGK+fAet9Nxs5Wt17jNDUM1Ff6e36WS0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvEFaGVfcvc7I+WsKnLa00SN5QPTkSzfiWGJ
 PahrGboSN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xAAKCRDBN2bmhouD
 1/FCD/996DPQkeSTgHdKYXZwdFyt3uizbqcoRQhLkEEg860tSjn7Kte3DUkvlR7EWtxQc1vwNij
 h6zflWghpo2l50dYyFTsw/N7CR6NRHryv3B7+nv+2r33l7WcaoFYkGM4FsAkCJKMPl6bGpRNQvA
 9jYFY0BIHeuFg8AXYSEvLhDdZ8R+Zdx37F7ax1PugZeMApDCjDLkq9ba2ok7D7AoApGrHVyuZce
 kRFTFCEytra1l3KwEc4Mn+XdmielljNWWsKSC6JX9ReyWvrwewEpGU7twwfCxB7LwVqmnbhzP/Y
 OpmQ2JKetVRFnfrvaNuaTttsyTjub1lLnKUP5t23B8qKg2BrTwdsdVbvD8j6L0ykRwn9BMAaOAu
 z9dNv2P7/vnLpPNE1JmD8TbtHsmK15kV34zypREhkFVycSF8QAeMOA1Mr2SY5MXginxjTNRkS3H
 DHBBUWus08o+ao5tXURP0ryJuFyaWOJ+omsvAmjClWK2RIWoZLvhOAoPHumWwrZ7c/FLW3Fm3XN
 7CIJpoOxTfq/cRbfsadOyaALh7+jFh5l6qhA5aFXQionaHY2c+4Nxh680d/6/sTx/hEyXCmoXD6
 wl5tCEHIljBGjnYYUs2fMNCaFMtpUQeNbctmXaAWguGng2Fehbc2OAm4mwDti2rpffedGvjZJix
 lW03btC9avV5Gvg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

According to Hardware Programming Guide for DSI PHY, the retime buffer
resync should be done after PLL clock users (byte_clk and intf_byte_clk)
are enabled.  Downstream also does it as part of configuring the PLL.

Driver was only turning off the resync FIFO buffer, but never bringing it
on again.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. Fix typo in commit msg

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c19890358b7479c85c793aa7470904127c2d0206..f0ff6c9fbc2e6d28c96c08114c0f417708d70b10 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -467,6 +467,10 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	if (pll_7nm->slave)
 		dsi_pll_enable_global_clk(pll_7nm->slave);
 
+	writel(0x1, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+	if (pll_7nm->slave)
+		writel(0x1, pll_7nm->slave->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+
 error:
 	return rc;
 }

-- 
2.45.2

