Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B88667E1
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 03:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1E10E5C0;
	Mon, 26 Feb 2024 02:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jgRM9YBM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAC10E5C3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512ed314881so2207491e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913510; x=1709518310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
 b=jgRM9YBMZLWFpKKRpEAmeeUlev7bZJn/2t8P2GUHPpEBO2hHSEQbQ86g+qMzWwFwYA
 pQWLymt2j0WyugIC1nVPJxYgmo2FHpFIh9lp7J8hwb8p+QciE0HZqZf8/BuN5Sz6SJBA
 HmyJMKhpUeoBRqCrWv2kKvShTo3Nfa/lQxMl+2Tql7yO9jWrnQzlErVrdsfNwIhOrDxO
 QlKVFcu5EKkQUqSHRI/sbfDS1rPE3n0nR/EH+2lXGbO/s5kdXz8zWnvveS93lA2wk47q
 GkiEqyZ1cDmM4ilw6Zlr81Zlz5+HSID0LqSUxWr/z5fRW7ZFpl9xAr4R7dYJxw9wjjaZ
 tAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913510; x=1709518310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
 b=GWsHkUzZstWZ8F5Zj1pdwzhI+HA7SpQUNInp1pmNxTpThfCyMiw5dQy4ivFQAWiPOG
 FzOxnmnb/O5xcD3RgoQFUGhNx2AHJ6rwqiNKw90xqKKFjH7Le7bzUqtDtGdOwp6DzgC1
 /5girTC45WwrG+ZbmgMlKNiQeEnyveJM7/l/RLhw5D4lYc4SoI8ImTqDFcfxtHI2UPxQ
 ZFSFjdluQ1Kgx4CVtHlLmctTr3HYx5Lhg3sEvFrXGDBO+17yq73eNDZ6SHCnmshopSja
 sb3phHiK9mSNVdZ1CN1Wu3+MRrJXRCFH7/pxJ6TFZacKHxoW03zgx8loFe4C4XCq7bgr
 8yqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9du/1P8r8SRsuEaM5qPHXxfDORfwOuAKANoTpdm+Rd549jXEvtU/r+KXdBnIEIPOax7mpBkrJzA3CHSadoSgtNAbXSNToRuUgj0+53VpI
X-Gm-Message-State: AOJu0Yw8rjbb2k6pHoCaY/tXiT86+VBvM0TB/zsnqgwpIXk46DhGgcf7
 07Y/LbjdozA5C1cUgR7Unr8wkXF1X+DNME4/++ydxVVX1S/412ZO81iaG7xb/pg=
X-Google-Smtp-Source: AGHT+IGY4gzmXsE9Jy4EjXBhsqpj7Vs6TDkLR5AhhddiGoCDdzrxQEMLv0q8q6w5zsVTlzfWfmua6A==
X-Received: by 2002:a19:5e19:0:b0:512:b27c:18b5 with SMTP id
 s25-20020a195e19000000b00512b27c18b5mr3280872lfb.30.1708913509984; 
 Sun, 25 Feb 2024 18:11:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:39 +0200
Subject: [PATCH RFC 03/12] drm/msm/hdmi: drop qfprom.xml.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-3-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgDVAiYFY+rVPhG374kNIOZMpIfGmIPD+KZ
 m2xSKCJUA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1eSWB/9rUdYOzJ6SCw09S6S+UkN+7JsPcFZ7Gu6TxtaafR7OH17XE91bJ3ge0wpAc3oJZ57VDsI
 POjy6aEIDWHkitOlLphzzCGeYumnPQXltPcrXfSWBiLfYNS6fBnfdvjUydNLwyLIVT5UBv75LTK
 XJ4QxWLdUm7gLie2JtRuv4p2nCd+r8cEJq8Oji6/5MBB42qxz49FgXaTV3mfHzg6hlrP/qN+R6W
 3Ii3dUInB0VmLJKJ5qT4HLYq9HsxGRL6MlTeyhI3rt0k1PLUdLS0xsd8KIWr2XLLCQXoWonpxAL
 SH004jrThzbPaOTke85niR6eiVfhZNgpBnDpaRCvVb0iIIE0
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

The qfprom.xml.h contains definitions for the nvmem code. They are not
used in the existing code. Also if we were to use them later, we should
have used nvmem cell API instead of using these defs. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h | 61 -----------------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h b/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
deleted file mode 100644
index 498801526695..000000000000
--- a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
+++ /dev/null
@@ -1,61 +0,0 @@
-#ifndef QFPROM_XML
-#define QFPROM_XML
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
-#define REG_QFPROM_CONFIG_ROW0_LSB				0x00000238
-#define QFPROM_CONFIG_ROW0_LSB_HDMI_DISABLE			0x00200000
-#define QFPROM_CONFIG_ROW0_LSB_HDCP_DISABLE			0x00400000
-
-
-#endif /* QFPROM_XML */

-- 
2.39.2

