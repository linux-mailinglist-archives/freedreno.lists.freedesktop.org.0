Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAFA2616B
	for <lists+freedreno@lfdr.de>; Mon,  3 Feb 2025 18:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8CE10E538;
	Mon,  3 Feb 2025 17:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tngEx3Yv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A006110E535
 for <freedreno@lists.freedesktop.org>; Mon,  3 Feb 2025 17:29:39 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3862a999594so228593f8f.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 09:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603778; x=1739208578; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
 b=tngEx3YvJxcI/mlrho1VqBDwE1C+pM13Rd/l8XmssQ6bB6a4p8lWjy/xqSmdKgm290
 Jac87VodiS1cjkW9LhFGzPfB36Wftb43+E980oJ3ZFyYrWzDvOZF2Go7DoUVeBfqJ9rt
 eQlg9pP4YFXw+Qt+edRbsuSf3HMdkxSt9wq82rtYxbh4GGLSMjsEFcFQy96+Bbl3tHvA
 O36pwu4tigPqEn4mGAETrPtfZuHWEIG4RI9LxiY7Wej7bEkmbIYKKjKMAxw6BkNBMvrj
 VC9cC0mqwOIKhPgdqFKEEJ65Onh7dFA0rLUp3OYoCCV9fm6Rg1BzVvE64qdYgi1KK3OO
 1hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603778; x=1739208578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
 b=nRDZ3bUSm0cnCxcA7tcv1S/UNx8NrGHKjr0w8Ip0VRf5uvMRijIlBUMOmEpuEDShw4
 BjTYNQm0CHfFAS4wpoUvTldIwP24ZoXuDqvenI9Czm7Eol2IRyuaJYQh0ePLlp2MtYOs
 CSEsrdcRTjok4pCVIGpE/38kiInEVV/y8va0q7F93poVzMIPBbpO1JDIIplG63pwenmB
 lEUSRISZ+pbyiQ9MmKGezqaLZAlMBXWALzs4qGv+7s7dGtxo1mCb2nWosM5rgwv8S0Zk
 /MOBMfGwjjsQqlQO4vZjnUo30PT35ufMEE6HQ9e91USypKNBGwSzRr/fJZmvTm/LOaJr
 a7XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8EKqux5WUpW/benn/2Z5m3apnusyZ8gZP/E6Z+BERbJKdLCBOMWOKJttomMz0LVfXZFFYpiGH7BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx04ilP9LWiiLl6ChBfQr3u8fThUkzDJM+SICweZC44KLMhCP05
 1PgS1sRw28XwWfUcfC7HpPgHHTuDWt3nUSGpHsI6p99X3wzgEbeeh9yUPYmwrMY=
X-Gm-Gg: ASbGncuf0gAMXlAkjnzVmNZsbrkOmsp9zSYs9FTr3+hvl/W96k6tnmljh5p4ScJgOVo
 68jnoSgWxjJKswlqHqpU5mgMGx0IvANnDcDZWW2lEo1DBT1wHZfEHMb6XeT95EJnEfi8AJ1d/5n
 9bT43SsFmDoLVrymTmaUNgIX+K967TASH4NqdIic7tYrSSY2s2LgzJ1GqhDfbk2bHTfIVt3687Y
 q5tq5c2aZg09Gn6rhP5b/XPTLI84A5rmWR8JLC0LYuMBjIj6Ns2bLzL/3TTUsrrg0jcezeO+aM5
 OFrDS/lPxwdNd/QFzRHvjCDdyj/+SgA=
X-Google-Smtp-Source: AGHT+IFIj4gRIDP4pX0InpsIa4ZwSNF/sOa8F+6utSwOkoqKvTqGjRdYhd1+BwpOgmBytJ4Gc3rcYQ==
X-Received: by 2002:a05:6000:1acb:b0:38b:f3a4:4e15 with SMTP id
 ffacd0b85a97d-38da4e027c5mr148030f8f.4.1738603778081; 
 Mon, 03 Feb 2025 09:29:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:29:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:20 +0100
Subject: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hyETAALjAp1ZZkmUcX9prHNyliCQYJnSPIVGqiYhRz8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz7wTiytFmItVkhR/QVQhjlyp7a9NNDuCzGS
 viLLXyQdLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+wAKCRDBN2bmhouD
 13ecD/45uNqBQXPujtKXQplCzdZ1S842t1bD975cTQzBpJN1MF75/iexO0wkpEJ6CNa0k7fiP/H
 RE2nQ7Q0HPfls6Secz/pG9DTzy2OSiQmnOHq6eOWExVJSl6cQcjZ7o0+y21srYhpSdXutcpJ6xp
 kGJN7lQyXyOJ5fFGnPWALIeNVf0ozbkylM/Vz4rac4IqDcf1QfFvNA69wX14RhVxuyBsRLhq6z8
 DKj5oBB3OU1ahAlviKu0t/QQjTzGe93CeZVECz1mQYMeP7t0ARY+TWzCwSxfz0ruWi9wOLMsUnL
 tD0C/XZyJWAkMmPQvPdxXpvxi5iygP95ZVkYu7RZJLgbsS3BlkQJaacvP9/SjDzQ/FM7F6/l3nq
 aSGm0kDHrtl9xKUaJYfzGT//rbAYE7+kC65UxR0/duievXHCMFHaCd+kK1EmI9RmTYintf5RMWQ
 wTGUO5QpvM/s1cwyaVRE+BDfVT63Usc4PoQDKMTMDcBI2/hO86rn5zEwiqpAiHQwmj0p8CjsfYc
 z44BJYZt19buIAOLuaMGpVtKb0AmjGXI7m43Ves93B7laSLFisFFqyWirB8cUp8sNbeiSimpZLh
 LINguzbhhSWwMtaI2sxpN6vcKNUsG4zvl5703fAv43h5uvZI1EFLXtSFgw0MOjYo5K0ts2+uxAt
 wzuwFw28fzFFykw==
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

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
 
 	return 0;
 }

-- 
2.43.0

