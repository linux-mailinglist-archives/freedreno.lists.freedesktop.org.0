Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04256AD80
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12A11ABCC;
	Thu,  7 Jul 2022 21:32:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D3711A071
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:08 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bx13so23827710ljb.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
 b=D3idN/ahpbAGCpkBL2rzgaEyQ1TIrb1+uPATnXA2dqwS8zUPdqYqe4CPzf1a3Z7AH6
 efTjks/bwKfxavNw8+z2KSteIFR9KodVqjk+zSzps7jbYdJh4OCF9OITA80xsjcYeqn5
 bPm39Et/XN0vGI1kgnFeJlgx4hT0CKt8jQWkIjUL+PFUWzlcJyfc455cdMH46UhZMGir
 cziZp5RhdQaFUHPaei/WbNnP9I3tVbZiZCvRV7Am5HC2ltPDhseamHHO++jyXH++5EDz
 K5Uu/E4rs8cow2D6MT3xTBUj5O/dn6e/4JsAI7V5X0ReuRbLYlAEPbSsynQzPyu1tbqo
 Sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
 b=hUo6vBQslM3COZCHfkrCiKIzE/gKY3YMBBnBWa9sQQ9wFAal1RejdUDtMqL0Y7FIMA
 Yjo2kPjaJAvRqE9HitCKIo5bKap+HIjeL/MEmEudBfVdrfIqEZwhFJ1+NHwgC8y1VHFu
 7TlbaXfB+5PM9seIV7eC0TRSnvfzx1kNiL1bsDo/tFsbxSa4irB3LqVw3vz5JuYa+Vhi
 8PclK3YRTS9ZrnuXAShoAvqhVfRvFP0f+tYx6BU5aR+5oI5orRhlELTaYrTyB9Yw1SLb
 99R7ENs+gNGuC4OCqBVya54Umm/wf8QVS3HEy8VN+t/a7g+Qqm6hrBcWJTkymTPikLPt
 YtLA==
X-Gm-Message-State: AJIora/A9hHygbBcVQ5ZUiebsk28h/gF6SPBmsTI81etesPEjDklOzkz
 kPq/s39LRIDkW/LHm82c8twMLQ==
X-Google-Smtp-Source: AGRyM1sacladqzbG8GlUA/pcU7R2qRjDGR2pawi6m/WmFWatggQdqeMK61Fa9aR5YjMaV1FMKOVW1A==
X-Received: by 2002:a2e:96c1:0:b0:258:e8ec:3889 with SMTP id
 d1-20020a2e96c1000000b00258e8ec3889mr33145ljj.6.1657229526635; 
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:31:56 +0300
Message-Id: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The p1 region was probably added by mistake, none of the DTS files
provides one (and the driver source code also doesn't use one). Drop it
now.

Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..d6bbe58ef9e8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,7 +29,6 @@ properties:
       - description: aux register block
       - description: link register block
       - description: p0 register block
-      - description: p1 register block
 
   interrupts:
     maxItems: 1
-- 
2.35.1

