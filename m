Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C1893728
	for <lists+freedreno@lfdr.de>; Mon,  1 Apr 2024 04:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0102310EDF3;
	Mon,  1 Apr 2024 02:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kNqhUeeI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F810EDDE
 for <freedreno@lists.freedesktop.org>; Mon,  1 Apr 2024 02:42:52 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-513e6777af4so5951518e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 31 Mar 2024 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711939370; x=1712544170; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XBU1j1Bb4M23bRKxe6DgOc9+rJgsvuLmaHrhx7ObqYg=;
 b=kNqhUeeIrF0JhOS9vQa+13UR5NcLFwhriPtHA5t7ko7rXPMrLVVFoFo8Fk1TV/5SNx
 r15GAHhJe49hmCS/LRufDIo+CihZPPd+bl9k+2DMF988bD9ZLuiLZQd5aF8HuBnABHBa
 3g6BVW0rt5BvsXpHy0Tpg/LWABYucaX/B1HPHmPg1u76sgF4ch0ifwilYh0YGstJomXd
 dvG0gZatvASj3kRPRIGS1IRpxPOvkIjaEj9veoPfX60O9MZolqq4ow5LqYNfkDti51JZ
 kylscjC+XkmR8F3kRwBe88jmFFdCRR9iAzG4ScFADWBe8+qRPlKJYeyQrTVYOGcuxQku
 bKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711939370; x=1712544170;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBU1j1Bb4M23bRKxe6DgOc9+rJgsvuLmaHrhx7ObqYg=;
 b=ayO8Lyu3HAUtIMxTZuKG7AOPmP9yLcx7KG15i4dU6/K0Dwy9rPFK/4cwu4YNU//WHz
 haWJCGInJ3tmdmWIcQLTXCQw4Y+ZDdQdOrtpQHWtbmgQ6ZSQgjJA7LdVDsQi+Qj2/WH5
 rdhf1c1x/VmUYSgQ463Hzkxp9P2e1exCFIOMgvNtmulN1bClK6uAMOHIzBhP6ktlr0y6
 ghkx26ceZoBkC+TdRmGBAxwuMBL0FFiq25ZkXKp5IbAOL9itPDEFNF5O9x3YZWESmyjc
 n+fmnosrOdaGcQZyaVKqNhtZueUXjyAt+6MMtuuCPM1axXiJ5HaXeBJFhgXbFphAskfW
 fNSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxmxJxCp6uJO3D92FE/BjvcynQwh24sKVAbhB8ata2uPOK2cQWuwmbmFSnbDKoScoWY0JdxoOPoyjIgVCWvHjjdBRQheA23EVJREJS9QsZ
X-Gm-Message-State: AOJu0Yw19yBrkul/pIQiDSSu04XgRfkBI3ZH4L8cX0Kxj/wSd+Llpsbf
 T5fIFFh0H8MsQCZPqbFVAwxBt3ZiDSmVXXbkOUZK4OszkF3Q27Bv/rtiz/k7uF8=
X-Google-Smtp-Source: AGHT+IH/8AVhlLomm3MMMNCdXOZsqPVm0PsZk5TUxtvBae63rJyFgGSLR1du+v1+ZmOqGl915XZa9g==
X-Received: by 2002:ac2:5476:0:b0:516:a1eb:e6a8 with SMTP id
 e22-20020ac25476000000b00516a1ebe6a8mr2890660lfn.39.1711939370331; 
 Sun, 31 Mar 2024 19:42:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:32 +0300
Subject: [PATCH v5 02/18] drm/msm/hdmi: drop qfprom.xml.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-2-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4767;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aup8f5gzkTQtLIAA/X40J7dMV/BjnJJiZcjwWpgwE1M=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxqXvMqr3nNCC9xzmiy33cz2Xv9A4KNTB9+VI0ma1fm2O
 drVHo6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI5bscDDOPT832ZDBp3mjF
 Hzi/lk/KqT2dOyGxcKakTvoKe2Gvv8ndRitXOP3smvv9zWTt9q2zy9o0DldYqcwwCuOfEiuScDP
 I+wbPwYc/V//Zc6ki/dhs92mqvLtWR8Qs/1bzLovdct4NqbNcJRFXmtPPn1qeqv2Qf67x/1VXuv
 MznkcwsE4x7vFUctzZc27PHHPLPyxLssRcr8nkbspfPmfngVhBK9Me+fJZc2PU9QttrldyhSqau
 uq2dpxwlNp702jH4gvv/y+X/HrfVlur/uwLv5vnopZvCD3f7ZzIp9/f/nTyTu5jlVUnn3G3TG6W
 N+JaoCt/cI1QlOKJ8hkSdw3tWNL5J+ZXMz2xYLd+qVkPAA==
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

