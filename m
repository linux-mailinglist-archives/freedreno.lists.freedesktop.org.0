Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A5247996
	for <lists+freedreno@lfdr.de>; Tue, 18 Aug 2020 00:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAAA6E0DC;
	Mon, 17 Aug 2020 22:02:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4FF6E0DC;
 Mon, 17 Aug 2020 22:02:59 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id j21so8757135pgi.9;
 Mon, 17 Aug 2020 15:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
 b=VAMqIWBU3E4H7weX9792RxhLwClzSja5Owo67Nir+n0DGErszZ85LILA8By5JjWhiq
 pcpm3+G+LpRNVPPV7cxjVU/fGJYoWIhs26Mon4PQlXpZvrGvoIdy4PDNm9NQGR3eawWg
 HCoe8VNzumSPyjn/aDXRmJIqqBPvnKaGmhs3h1Pbrq6xZAy5G7T0181+qv78O8LcN01v
 ndtCFs5Y2cHk7rw9Kcshjp/R+oBiEEbyZZS5h78/o8S1/SuZE1ru05Bwnuzt4LwKtgbY
 NUsPwV8l5p24osze87hLN0fWuICNpDdLPzSFaGqyBudeTIsD6ZTx2sSqK8QvxTpYrwnw
 4Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
 b=RKCEEYSZ4kmnRBsGL2YfCLRnHN6S4dypaiX9WlNrg6lpRZhNDjV2HYwy2l6m23tHtB
 9xt396iDmAvUmseUaOueZFV9OBMr2jeZ8ZrOhKqJQWVBNIYkW3jNxAA1Zx1cZzoIZ00g
 6gFkNI2kfiOLYqWGM9BWlWQzOIC9fhAd9pSjTmGKCwO918khWlTdxreXmHaAjBVngKrO
 b1nEo705yqvgQ6AU7LYBAO/2Aqg/80GfQjghFmI+fKKKftcgc0rby5gWhIg3Gh9jwZq7
 pnjNnlfDbSYP6RnXCQ9PJQUz2eDuvKAtPtsA7r4TMT1vlIFQua060q0Fqkt+BnlqXNma
 fYFA==
X-Gm-Message-State: AOAM533HA0Zmmdt4BeRu0Ww3HA0yGGUO9Nz687MZnZLse25fGl0Q+Avi
 m1xBsxvH2mzYiDmgtmX0kXTqMI9TZFWiMp/j
X-Google-Smtp-Source: ABdhPJwRqI1VC8tNrq9d6HBXBZWWdKGzpiYCGqPx76mvvjUpcZ4iuBnTpueYAH+n+ifu5gdkS6wnNA==
X-Received: by 2002:a63:1b12:: with SMTP id b18mr11343563pgb.21.1597701778691; 
 Mon, 17 Aug 2020 15:02:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x13sm18066264pga.30.2020.08.17.15.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:02:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Date: Mon, 17 Aug 2020 15:01:35 -0700
Message-Id: <20200817220238.603465-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 10/20] dt-bindings: arm-smmu: Add compatible
 string for Adreno GPU SMMU
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..5ec5d0d691f6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -40,6 +40,10 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.26.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
