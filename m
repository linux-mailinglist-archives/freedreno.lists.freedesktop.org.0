Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F63AB702
	for <lists+freedreno@lfdr.de>; Thu, 17 Jun 2021 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA46E90B;
	Thu, 17 Jun 2021 15:09:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0183A6E907
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 15:09:52 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id ct13so1621536qvb.12
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cEGpwhG6p5ve4HkGton1AY3pWTWRxR5OFRUm+6IG0BM=;
 b=xOFHogCXEUwOHUdEDKDozRhp448e/RJv4gH5fgQt3uM+WNHVNeqW4RXEh0BjTOI9Z1
 /1Ih6xJ5hbonfI5R6h9/cm20h8UAaL1BjYocAjjxlUSiSV03t/D6d0tlUhqqz4R3F/hT
 qAOA3PEBj3JGArvQnGFFwbbmw1n1tNGwbZ5Gf6SsUqRZCm8vTHw6d+YJOucH9nmCmnwG
 0PW1zxFM4D+CfMI4VdX53JrWmDR4DNWkrGEEoz1CSt6Q3+LtQf9k5IppfQledl/Uvcbm
 lngUFfWQ6m/QCRY/rroLBMjXE1APF7TVGC33tAzfTyhVtfYV3gkw/y/KbRaCzTi7iqgQ
 rsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEGpwhG6p5ve4HkGton1AY3pWTWRxR5OFRUm+6IG0BM=;
 b=alw23heOfvCl+ZhybAKephq3S1hHzDTPcaqJWKqzVOLGkP2+I4RVZRi5UM2i0g8HLm
 TgM0lPh0sHNWn07qaXVyaRBYWT4YDgOyAYemEnfYBMua6C2xlIqJTMZPvjokzoaD8RZV
 +2DNVdGQCc3X88wP3EyDMGmlJn/q1pP0DEWi2HCXpboXGKKpxAzjv4LqO6tgHHJS68Ao
 IbA9sRki3CKeZqcgcBgwZ3e0rrxJ+OVRvJetWm1kBwLGiuNef7tJYQgNZKP8GgJMi8BL
 /r6ALxgSfj9gGi20uByrSZUaZPl4fKH6V3n4UqN4uBgjiHHROcZOfyZ26YVehL7CTA9K
 11ow==
X-Gm-Message-State: AOAM531plz7+P2DeAGaeb1ReWUCOmzgx2Hsgko9Nq4dp4HEl+a2+SxlH
 rw7tArWz5sswNLNgKMV+7akVGPwxLB8kBO0w9Hg=
X-Google-Smtp-Source: ABdhPJwkwzkpMneGJhGYpV8v3Sy02fJEBm5RVWSNvS4VXlzOYBId9bl24tw7PJEscZEom7rxwflAWg==
X-Received: by 2002:a0c:e84b:: with SMTP id l11mr390498qvo.36.1623942592025;
 Thu, 17 Jun 2021 08:09:52 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:09:51 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 17 Jun 2021 10:43:34 -0400
Message-Id: <20210617144349.28448-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210617144349.28448-1-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 2/3] dt-bindings: msm: dsi: document phy-type
 property for 7nm dsi phy
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Swapnil Jakhade <sjakhade@cadence.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document a new phy-type property which will be used to determine whether
the phy should operate in D-PHY or C-PHY mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml         | 5 +++++
 include/dt-bindings/phy/phy.h                                | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c0077ca7e9e7..70809d1cac54 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -34,6 +34,11 @@ properties:
     description: |
       Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum: [ 10, 11 ]
+    default: 10
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 887a31b250a8..f48c9acf251e 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -20,5 +20,7 @@
 #define PHY_TYPE_XPCS		7
 #define PHY_TYPE_SGMII		8
 #define PHY_TYPE_QSGMII		9
+#define PHY_TYPE_DPHY		10
+#define PHY_TYPE_CPHY		11
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
