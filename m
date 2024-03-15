Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E317887C71E
	for <lists+freedreno@lfdr.de>; Fri, 15 Mar 2024 02:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2496A10FD44;
	Fri, 15 Mar 2024 01:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pfkwg93t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E0610FF1C
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 01:22:44 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so22404041fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 18:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710465762; x=1711070562; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
 b=pfkwg93tPzKn+ok3ktoyDLAbrKz6xrV/ZUmcrqpA8sgdx1jIxgfns0f7TkHGXgCLX5
 ZEndwcyz3ZVqOrNAnccmnbl1hddSi0bQPbBCws5whrHexZCseY0VJUEeLUaQJTxlwJuG
 8t2AW56uQ0S2sdGLIIN/3zeZNh57CIXaNt8NuR5d29dHpQgbWP7vKCzP5GR/kYHiXAAN
 lMX2W57FqP+7P7jJnWBsgdBHkZv9F3PO2wWtZrKnLX2zRtBQwLM8/G8ZWdmykfNA4cap
 maL2rcgJmvXVIHdikJuhiyvUht1q/d0PPA54Xc66SmWnJXSon1fYpqHPZ/+brj5li6fA
 VvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710465762; x=1711070562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
 b=CPl9izNeJ6f8XODvMphaVYBT3fSaFNOnmmNuY9PNqGX6HkUyISoqdXX1DDA5BbIbya
 H+NrhVr041Luze3U2A/LFlcZOJPt1Q9iSqT/83RVNe6zaIN+2E2wjmh11PnCS4YChCj/
 o0DcqLZKCNJPbzJfynYx/p0UALjQFKkDuFZ/HX0ZGoPi7M5UkzYu1E3ww1ez6gxgqmZj
 IE/2RRDnxPJZFJ458jCcHy5uWZCEML3wiOpB1gMJnYt+tf9a39tXCek0qPYoWw4npkbk
 rP8+EO26d3STmjtlsvWMc/R259aWce0PkTG0vnQu61YuQ/FLfIPNzkkITS//PIUxmLGI
 s0Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu5KonK4evIVQlw4LSvHXCyPyNvELjOlMOWabm0MqgFx85h+VkQ0zWqY3PYXYfHoLnMBzwiPh6iMfTB9mrknBGzLe4XDVGF5AgTb2HSrNu
X-Gm-Message-State: AOJu0Yx3ThCBxda03HL+vTpEq/BI8txVLxBEGZom4Qesa1gjS+E+Kh/j
 FKq26I0SQbIhxjOcrPIUsPDurKRWEgMZi7O2iWsjOxYjvcjVhjGdzAskZ9TZ/Lk=
X-Google-Smtp-Source: AGHT+IHtrzYxKTdhEJiCsYVbj5qQawMiDGqWZ9T4uQxxTyj3bC8QoP064yJq0ObTbOilGp1xTUnQaA==
X-Received: by 2002:a19:ca5b:0:b0:513:c1ab:89f0 with SMTP id
 h27-20020a19ca5b000000b00513c1ab89f0mr1252098lfj.22.1710465761862; 
 Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:36 +0200
Subject: [PATCH RFC v2 3/7] drm/msm/dsi: drop mmss_cc.xml.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-3-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7249;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lb6zx6vy+03xuQFsRV+cttJ8xY2+xiRmY7J
 voPRemwaoCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1Up2CACgVvghB81j+9m7KRSYd6if0xCkEUBZUKuiH+eBnTOi3+a01b8PKLWLXdwp7qkE7bDN1YF
 WqndDxVyU/ZDHkwaiIQzcCili+7U49Wwh2vM+4Ulqj/GdY7T7jnVOAxRXhicLDIX9t2EnzTtDyD
 N5EvxINvgubzo+AqrR1of28ti9FKy6ZEKLCNA8Cq8PNDbkZpU/r1XcaGku1q3F5Ep2kDWp0FEGL
 +QOYILlaIrJ3RKaPfYvzXpvBbMqJvxJL+eJ0LvOsrpjZPmxHjKh9TvqCUgduHUBNPpM56q6pfQG
 FZ3/AKa5cd1E8deWeCC90TQWHZJAZ5bUxpXjvpLc1gk/CchZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The mmss_cc.xml.h file describes bits of the MMSS clock controller on
APQ8064 / MSM8960 platforms. They are not used by the driver and do not
belong to the DRM MSM driver. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h | 131 ----------------------------------
 1 file changed, 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h b/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
deleted file mode 100644
index 7062f7164216..000000000000
--- a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
+++ /dev/null
@@ -1,131 +0,0 @@
-#ifndef MMSS_CC_XML
-#define MMSS_CC_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-enum mmss_cc_clk {
-	CLK = 0,
-	PCLK = 1,
-};
-
-#define REG_MMSS_CC_AHB						0x00000008
-
-static inline uint32_t __offset_CLK(enum mmss_cc_clk idx)
-{
-	switch (idx) {
-		case CLK: return 0x0000004c;
-		case PCLK: return 0x00000130;
-		default: return INVALID_IDX(idx);
-	}
-}
-static inline uint32_t REG_MMSS_CC_CLK(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-
-static inline uint32_t REG_MMSS_CC_CLK_CC(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_CC_CLK_EN					0x00000001
-#define MMSS_CC_CLK_CC_ROOT_EN					0x00000004
-#define MMSS_CC_CLK_CC_MND_EN					0x00000020
-#define MMSS_CC_CLK_CC_MND_MODE__MASK				0x000000c0
-#define MMSS_CC_CLK_CC_MND_MODE__SHIFT				6
-static inline uint32_t MMSS_CC_CLK_CC_MND_MODE(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_MND_MODE__SHIFT) & MMSS_CC_CLK_CC_MND_MODE__MASK;
-}
-#define MMSS_CC_CLK_CC_PMXO_SEL__MASK				0x00000300
-#define MMSS_CC_CLK_CC_PMXO_SEL__SHIFT				8
-static inline uint32_t MMSS_CC_CLK_CC_PMXO_SEL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_PMXO_SEL__SHIFT) & MMSS_CC_CLK_CC_PMXO_SEL__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_MD(enum mmss_cc_clk i0) { return 0x00000004 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_MD_D__MASK					0x000000ff
-#define MMSS_CC_CLK_MD_D__SHIFT					0
-static inline uint32_t MMSS_CC_CLK_MD_D(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_D__SHIFT) & MMSS_CC_CLK_MD_D__MASK;
-}
-#define MMSS_CC_CLK_MD_M__MASK					0x0000ff00
-#define MMSS_CC_CLK_MD_M__SHIFT					8
-static inline uint32_t MMSS_CC_CLK_MD_M(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_M__SHIFT) & MMSS_CC_CLK_MD_M__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_NS(enum mmss_cc_clk i0) { return 0x00000008 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_NS_SRC__MASK				0x0000000f
-#define MMSS_CC_CLK_NS_SRC__SHIFT				0
-static inline uint32_t MMSS_CC_CLK_NS_SRC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_SRC__SHIFT) & MMSS_CC_CLK_NS_SRC__MASK;
-}
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK			0x00fff000
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT			12
-static inline uint32_t MMSS_CC_CLK_NS_PRE_DIV_FUNC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT) & MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK;
-}
-#define MMSS_CC_CLK_NS_VAL__MASK				0xff000000
-#define MMSS_CC_CLK_NS_VAL__SHIFT				24
-static inline uint32_t MMSS_CC_CLK_NS_VAL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_VAL__SHIFT) & MMSS_CC_CLK_NS_VAL__MASK;
-}
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC				0x00000094
-
-#define REG_MMSS_CC_DSI2_PIXEL_NS				0x000000e4
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC2				0x00000264
-
-
-#endif /* MMSS_CC_XML */

-- 
2.39.2

