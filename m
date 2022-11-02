Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65CE617193
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF90F10E552;
	Wed,  2 Nov 2022 23:13:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB3010E53A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:14 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u11so214286ljk.6
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V99md7rLtpNqzsDzhmBdbw6JcMGG4OCEBg8fYBcn1Kk=;
 b=ozkbiwshk7uZ/S7wP5Qerle/gYtFRrnLifxjIaxVrsh2YJ9z6yTy9NJGjk+bYXP9MC
 8M64a4PMRYiDUbW3f7pp+7SMLJeWzaiRTlZ6Kk3112UxNV/UAEelGeBe20P/hLBwhb2N
 64qTz9cR+QT2qt9ixGayXWLdZAmFesApco9GsoMQG3ymd5SHqF2EM061HrsrzTOXRLP0
 x1AeP6LaMdzoI11g4stgG6B+5qX2jmHnfI2xNMvKfLAGpCdzhGSblu5/vjhAJrvO/NpQ
 2s0P3TjA1N6zzwxgFU36LLOR3J1HXDDT4zzrKbN1a6cPJPPpf9GiITKqlW0MN71My+JW
 ycFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V99md7rLtpNqzsDzhmBdbw6JcMGG4OCEBg8fYBcn1Kk=;
 b=p9SPF/UMZ+16q3MRYMX+6dV55CJtEgEE/A8X5Iq2cBw9u+JF+iEUd9Z8QpWAMBsBDb
 n9e17biYBm5EgyM5KTR4ceva1Uj3fg4rEOM1u1JaS8meidH+2c61wX+W1/W5g6rGhR+0
 JY/rY/I19PJRl8TcicqUYukD4iJVsKTIzqUmIGDTAfAWLLuwZNHBf5to1I994oRHqgxS
 J3jHp10CqPr2YE0tCbAi3BML7QuHd6YOttA6VhIPpyrUTEeNf0PJAbZaTEcSWugMxJN0
 kRzQ3SUUDmBQcroNlVPrFftv0/+6Mt58VCjpzGJEeHf8pTyVDY+FLtBME0Fx1jJ5dG/8
 XTYA==
X-Gm-Message-State: ACrzQf3UhH1r8a8jgspuCQHI8EbJbNCrcBOVc/glVfCNLccq81ua4v06
 AXCZtFbL0pKUI35V+wSuZ3QSTA==
X-Google-Smtp-Source: AMsMyM79ZwE9Kn2WHfgZ0XRTpIxaxrCh50+4YuBR56AUy//VpPQBI/VtDpNMjGhcJSYwUpZ69RQgyQ==
X-Received: by 2002:a05:651c:22d:b0:277:22ec:8dd8 with SMTP id
 z13-20020a05651c022d00b0027722ec8dd8mr9744878ljn.101.1667430791974; 
 Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 02:13:02 +0300
Message-Id: <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/8] dt-bindings:
 display/msm/dsi-controller-main: allow defining opp-table
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Allow defining DSI OPP table inside the DSI controller node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 3b609c19e0bc..c37dd9503da0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -80,6 +80,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: "/schemas/graph.yaml#/properties/ports"
     description: |
-- 
2.35.1

