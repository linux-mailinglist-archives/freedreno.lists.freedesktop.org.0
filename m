Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E13D4BB0
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA7737FF;
	Sun, 25 Jul 2021 04:26:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559DC737FD
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:29 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id z26so6858330oih.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
 b=TRygaLb1d2m9eOGCp6xYaANeKW0tOnOoZgQUGxgLOoMYwf+qIpEE8Rpp9HKxSQ2lfI
 tWdu7DdwKwVM5s04IZr/iL8VuBBoAjCHxHzHAflBHRPHf3KtBpmDN5JgZeMRC+nkyrff
 FkM+Q0dRk2WI3LnGnTmu4VMb2ug+ib3gcQw44sLHlMn3aqwNt9dFlKB1j+/Y9+bNE42V
 HmfGNgOQvpx+AC06SYnxWW6FqPEi7Ffg8EsoUNKpyMMbga3Pu4TlP/RpE6RQbcVSWGgM
 RRYovJ0OkjLyEtB4VzulN3ZfQsEFvwBTk4jYxS5qDX3NNf/UsBagGyHU0X6m9CAbEyab
 BEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
 b=pfOTBw9LWuqIpKB/CtJ36OBHiBccgS1Ydiq4tK61g/o1dk/DrrmBl+S967qzHuji8N
 wVwJ+1JDxdi0ncfyYf/zBWBPZjytOoMULR+gj7tz1fTb5dhgKlkyIFy1nvqivFVQHyNP
 QyXdJzaktMN9h0pOhbV5L7g4IZYVP7pxXKlrrjro6xTwRwtUYU7sAYbO2Uve1sxpoldr
 AOHnmcZ+i2hwOb4+YBVR8KnMliPHCzLKz5g/JdzfXgd4dcWpksuEd6AhSLtItcfgNeeE
 xDWZTbI4ZeJ2FngXyBKiaFY/H+5yGUxr/TNNSU5+atb8d4G1o2wk4NviafDjnuXy5bN5
 uipQ==
X-Gm-Message-State: AOAM533sQ3rFiiBtv9PovXY3PF2oBHoOmUGcBMx8whJLuDp2dMfpEH2G
 M7MGl8nHu5Gqvk8hi14wzqczxQ==
X-Google-Smtp-Source: ABdhPJxWc6HpCzL5osAC98BzBe6A7qGjaV21OAnlOfljD7bSse+ehjQIL5aw6E0ECmbEg7gTl2MCXQ==
X-Received: by 2002:a05:6808:2089:: with SMTP id
 s9mr7702063oiw.156.1627187188672; 
 Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Date: Sat, 24 Jul 2021 21:24:35 -0700
Message-Id: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a6e41be038fc..c6056e0b0845 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
