Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEABA38250
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 12:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E310E43E;
	Mon, 17 Feb 2025 11:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="apiG7E7V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622CF10E439
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:53:30 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43989d2afe1so325675e9.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 03:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793209; x=1740398009; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjG3Ku4LdCaIMwepghOAchlIqKd0EIigG675oG9WLrc=;
 b=apiG7E7VtlyvlKlFaXKCtSU9b9MY/pTIyc+XdyruMknrBXAwEeNXbfXlFKGChpitSq
 pGlfwyzU6mhRRT/plD7ArFjVAftcICOoftwKa3AUJagWVu6y9hQeCiBviNuopRHisP+h
 odjPH37EkmTFOEfefMhsdVV+7p176CrFCp8+SU3H6mTjzwM8581O1zcZmVCSRtLIKUGs
 WY1B48mPUgFonNDgDOQGf3fsl8UBKK25ASCmKjSvBDXg+W8/CyP8G9w5YdI+dxePFXdI
 EUzmEaQdaAXqdL/9gEoSlf2+elBmH+obpJ0wOUqnuuJprkAGCs6EvwEdy8CpDSkU35pa
 3gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793209; x=1740398009;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjG3Ku4LdCaIMwepghOAchlIqKd0EIigG675oG9WLrc=;
 b=llSPpJsuybN3AgVyzYAmbbVho0pIGAEnnNpF7R0+Ms45kijiRuGo3Sc4iBbCHL+uir
 YTRXcbWgCru/tYOmI7nLyz3Phv9wsPSHim/+inHVsW7BM82ArnkMajGDrwndnsVmPxeC
 iteiiiVdz30LT11dTTJYfkuFsqH5+8zyEQywQCWJ80FX3h+WNMALFqlGzCY2XppEl0jp
 TMj9+5b5hZJGOZ5JJsnjx/tptjwH5wCIGITPwsAsiPveMFGtfBta60VwKjYN5AnKnQX/
 2Qcnm/vOlQb7Xoff/4YyXK5J35Sb24dioQpyMo9Ju1LVD6C99JUdBddmTPHBBnqV1KhL
 eoNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVj5w2rqn9wHdBcFjXuEcHOZml+q6RsXMrbYD3dqeh5t7x+OQbhU6tn2vOipR9k80zQFviz4ooimc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm+/yPCjt1rMsj4fI8+/6Gi1IAIw2iIBpCTuLadPy6H+fbAnsD
 b8wvmlOSeHvIR9l3RL/4HJBQ4UIHvZWhSr3aesljq1fLuSSXEezGD7/kUuSpXjg=
X-Gm-Gg: ASbGncuZRQK7KkA5hHyAljkoo4xDUPeS+kH58hU9FnHi77bi0ClGLvUQ2wdvLQRUAc7
 OJM4RPqMk5ke1mCrDrzxHhO59Of4D3pt9fxIaQmY7fMeP+lVS+zG+pCZg0/QgNu0lDUmBjbPJoe
 KPmEHKxVpHQn0o4uflZ08MmfN26DSE2IDHSLwJT9n3Rqci3LumoP3grMoosd2CCc5QeRU7nL+BF
 R+QrcpKeQp2oVKV9+diWvXsnwD9YQkAH03uuzAqXq+Zp7qTbYBQreA52ws6zJveT/eEQw1ioDHM
 sbisdG+t1yy3p36GSPJTgaM+eXrQz70=
X-Google-Smtp-Source: AGHT+IGCd23PgjMv6+NwPn2SnlycPmlxTO7A7R1Yt8hyOG8pqhgRXI6SsHsJrv0uj9+65L4ln5dvmA==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6aee with SMTP id
 5b1f17b1804b1-4398c806c54mr3587435e9.4.1739793208873; 
 Mon, 17 Feb 2025 03:53:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:53:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:16 +0100
Subject: [PATCH v4 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-3-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cMgwWGUQiMQhE6DDyTTBwdxL692z4kYW1HPAGgpjM8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMwmW8N/wWnJUe63RdHqlkXLabaoe3us7+9F
 W18wvNn3WiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjMAAKCRDBN2bmhouD
 11VZD/9TfKW1EzYYS82ibwofKiQ/x2ymfpqm54bQmJkcevXw1P8/nnlYtgGxgMlrkpHePMQ8nur
 gSOaafs1WOQHkXEy1r7cyhg7SZoZfN2+le13cheLS9XvhGH4CiYyDQSemvoFK40j36DKOIw8AwZ
 vzK8kYynKIrSWUae6CAFNZYC0BQCo7gZSwC69En9lD393lR9ebR0DeMMjpXkS9FFigA8AvjF9TN
 6DdhNHQ8B8C9ronXrt5RsxHsiP3hp8h6tfkUCUAKWZaVHU6q4exvLoBir9jc+wUW+6OlWFO11wX
 UDH7mopLEK9gkZ+iih8TGSQ+/XMHNbViO7/NX7GvGPVr/sWhTLLUWTMss+zfd3qdZ70M2T9UGFG
 FkNva0yKB0aOXAr6ixhvXCcMKMBdcriy5eC5LkwFmv8fYnNORxJt+lF1QqT+APbH1KIo6EJH1R9
 seTfXKJkEORbvLPzXsvqzT2xT1OWXn1ldNVfW+M2uuKXSNsIyhIwa17OlfmRG2SL1VD4WRXRjpM
 SzOu2EZ79y1qP2wYcRecljM8FoLdqyKYHtltrE34l7T/lsqXSJOPTR/k4vdD34iDAiQ8h9iCS2W
 L3fyHIjhEO0b21XrDXXHE+2woTggARx2to0P7OMTPNzp4RL4CqMMYuCTvNOPzQqiqMNu+UijqIA
 sDvEMK9O5ulFqmw==
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

While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Define bitfields (move here parts from patch #4)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 4 ++--
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 388017db45d802c4ef1299296f932c4182512aae..798168180c1ab6c96ec2384f854302720cb27932 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -617,7 +617,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -636,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
+				    DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL(data));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index cfaf78c028b1325682889a5c2d8fffd0268122cf..35f7f40e405b7dd9687725eae754522a7136725e 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -16,6 +16,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00014" name="CLK_CFG1">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0

