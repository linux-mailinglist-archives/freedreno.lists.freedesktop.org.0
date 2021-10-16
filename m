Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D406843054E
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 00:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A4A6E8FB;
	Sat, 16 Oct 2021 22:17:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD446E8F6
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 22:17:01 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 n15-20020a4ad12f000000b002b6e3e5fd5dso388078oor.1
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
 b=IczW/rI+KCJMj4UJ0xuZXt8fK4/dUd6jCLECu9YvS8izjoIBu2E54TmymUBMFMW3vi
 WcAoFcM/ewacm0E9evClgmk52nGAOX/t8HljhwY4Yuucfp6tXg9KFWeFbWWddo/y4F8K
 nd5uKet4+hVNTszkYWEfis2J1c24NdiI3TzK5kC+p+JMgJdGxrLALklYowjCFj1rrQmi
 VEm3J1/eEUbiaanf5OCaNRrMidNBBgYh6L+8rszeegK1B3ebutu9+F/vFFJun2A+ODoz
 zZF8UMA/jMHSTpnwHgR9Ys6t600eHl2jutiziHBDHwhz5gl+6HDGMJZqPRyIXSjsruN4
 Z35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
 b=ER++lXlxmAqB6mkrlIQealxzaGXUfYjFsqsw6rEKG2xbzbdBNDW+4EgV9x+wjQgQ6J
 Mi48ZdapUzyW3yepMTjqgM0vPXNMP81+chZ2H0bpjJsJHlWds62oaJK+jBHOSW0hve9X
 7oI/nO5G4tVgohRrL6j2CDHmbPHw/FnxdQiCJWmRBtCaMUBzRCcKy8uj9+MKizBRbrlN
 4wD49IuZ09GHYa9bpY7d6fK8Artv8c2oYQhp1tEO8ddBjy8SRnZPnZHV+fyf39O9o7bL
 /a5pOAtCBv3oMQzNjsfD6xfYDccODg7B/ldmiFgxnqLFkN6m0i7q/QZcasq5voLN2gTr
 B0MA==
X-Gm-Message-State: AOAM5337PapMCtb0ifw5lL6fgHMOCIAVWpBV6zD35fEPre/HMZawWTeT
 Q2+kyeWgRcg7A7zuxxEqNv0RDA==
X-Google-Smtp-Source: ABdhPJw9eAziXbPqcUM3c4j08KGbMhhUyk8hEsiILchOvxT7cjtqsS0/2BYQFMDISFiJeGTW/t7Vgg==
X-Received: by 2002:a4a:a847:: with SMTP id p7mr11089393oom.78.1634422620720; 
 Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sat, 16 Oct 2021 15:18:42 -0700
Message-Id: <20211016221843.2167329-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 6/7] dt-bindings: msm/dp: Add SC8180x
 compatibles
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

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6bb424c21340..63e585f48789 100644
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

