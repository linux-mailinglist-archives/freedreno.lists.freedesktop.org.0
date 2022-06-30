Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636C561EFC
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9504210F5D6;
	Thu, 30 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26EA11A292
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so26973691wra.9
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
 b=G9TYezs2BVyMSI5iP3ydVLzqZPN+MSs41E34dkS34YlbLY40cOmhgEeszCj+i5s/Vv
 Ct3MMeNKPasAn5Q6ohG3pIuybDlJn5utEkwzrqTLmU08HhfZ2wTpPpWPyuSsVMba6OLS
 WAMIO6Q2Nm/Yun1Rt5iwRbty5Z6oulBqYrii6CaFkl1WkiKDOF0TNrSAEhn9pVRLJWWn
 52WXp6meDdmUsvdu59zaQ/SMt3utJO1eneNe28RhGjCVfynxF9pcCCYQ86PkPrwviUcd
 j1/16OPK5QVMa6NV8z3f2gk7WAETInVw+QsGhjeN0PCcWmcM3iOoxb1zA/szPy8sfThU
 YSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
 b=PJG57uANHLgUvH/UcfAYvQ3tDDS9NqZi8arimbxDdsPrKLUXNwi/jydASj8MeZsh9K
 JqWY+7Tnk1mcFbQl2AkoX0MHHZHScFcEpcO4otK11jppbB6oNcSfnajer9emaFwlTXid
 BTSvg0XoL8L17DPDEfEtl5wCZpQj7U2PBno7Ky/pAqhP1lVidTjJe6tJ2DsEDHWFF2WN
 2IFObJChsPPVVjxpgxo2jC2IvPUrahUv0b9P13ceLX1rFMEyUCJdO/aoibokC1suBcF3
 slIxZ7GL7Qk3cLB1ghZHukPWITyk7Bb7Nzzg/Z4mrFW+JRqrprLzv2nsrUs2H5P4crV9
 TcuA==
X-Gm-Message-State: AJIora/BO85A+LTWs2vpho8OBZgnEFkiL6dBWxQSqLPSRsXJwaKMbXNs
 Ys39V28pXIYN9QZX4o3mtAqKrQ==
X-Google-Smtp-Source: AGRyM1upi8GqB4nIHDZxM1ikxXWYSY3gR29H2HW91/JD1Zxt6I1SnElAyoNb+x7ew2YWHXIKEGFiqA==
X-Received: by 2002:adf:f112:0:b0:21b:c01f:e6c8 with SMTP id
 r18-20020adff112000000b0021bc01fe6c8mr7784705wro.681.1656590929313; 
 Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:39 +0100
Message-Id: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The driver doesn't care about the name of the phy in DTS. msm8916 has since
2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".

There's no reason to have a constraint on the name here, simply to have a
name. Remove the redundant const in favour of maxItems: 1.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 880bfe930830c..717a5d255ffe4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,7 +49,7 @@ properties:
     maxItems: 1
 
   phy-names:
-    const: dsi
+    maxItems: 1
 
   "#address-cells": true
 
-- 
2.36.1

