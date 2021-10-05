Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277F423448
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 01:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB796EC9F;
	Tue,  5 Oct 2021 23:11:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72836EC90
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:48 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so970415otj.2
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCnAkB79mR5AIU388UdqiAr4F0EbajvP3UTjYzPVMRg=;
 b=v4yz3RLfL3PsAlLFQWT3nSDM2WuRh8pc8/8ovsW3DrLwQatbzWkmtHeLUZf9130mTV
 QH1RLcP6pbO3a5D1VZ6kWWtqkssfSL/OMjpDo9rWB/42fjKcBpLlUFlJUds18dmfSnoV
 bxC0w2r1T6iOAZWH7pRq1VSgsRkKLKNhmMj/Arvu2dNdenLGzI9kUUhlSwr8cLfQUx1S
 4nzeIpkLy3u0NT2Fv0h65beNwUirlxLfIBRkH0LjeaN63BQBxdIAzbvbA0YSBRYsA6CA
 jx7ulieBRmhpfQA7rkDiUc2bRNCLANdfUwb03gfPgHKmLkO4Yn7atmNCnwpZfIhPTcwI
 f1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCnAkB79mR5AIU388UdqiAr4F0EbajvP3UTjYzPVMRg=;
 b=5/iCMAowADSsOr/pYa6ApDvpaR2WfQsGG8BwtlkJyLRUKW3DT6yu3ho8QABBVpNL04
 k0d68WlSY2EbUEl7Nift2Pel12qnStqVT0l5tdH2kZkWp1AXbKlZVho+ApibM9yxHrB7
 J9rv3bf1m64tSEqg17UxRTMZxk3VJmo/7JpY7vzZcxTZ1n/dCG+/pLF/YR35u6+YhhyS
 3gglRaMRpG71LJwsdQqXoklgBJNwOKxhf5S/ZBUAEIfOFlQBZKCeTgOH+8sTfxB6x7J+
 v7XxLu0BVonmbpw218AHmrD+DLViSUc6Qh6f0CC4Nwuk+oMhnlus51Ka2GmqZF+JDpYL
 A3ng==
X-Gm-Message-State: AOAM532PwXDTSZ6vp5u53/w+s4E22dpoGyK5EDK/HdulphPK9Z2XoVen
 cIjhMQ24nyTrtwpaNumO4Gn7Fw==
X-Google-Smtp-Source: ABdhPJwJ0djzrwEgyE1w+FdTMnmE5IMZWexC0nsKUKi2b/dAc+DsZ4kwaVhiurz4/q6FqF0BZBuZWA==
X-Received: by 2002:a9d:1402:: with SMTP id h2mr16374492oth.3.1633475508065;
 Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:47 -0700 (PDT)
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
Date: Tue,  5 Oct 2021 16:13:22 -0700
Message-Id: <20211005231323.2663520-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 6/7] dt-bindings: msm/dp: Add SC8180x
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

Changes since v3:
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

