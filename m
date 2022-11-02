Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42EC61718F
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F2B10E54C;
	Wed,  2 Nov 2022 23:13:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBECD10E51A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g7so183310lfv.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
 b=ZLES/zqOOoOa8Dw6KTS5MQwPc03kZOBxLJ2USXc89gQ3DfiRBT5FHWqFfvLSzxb96t
 VdnVXmlV35/UIEVpVOfbpaFb+mfg/sY248Ec5ZmPrmrgfpiCMNi+WaovfCP3rVeoXVp4
 fwc/NwVIAnryEPwQR0ebpBUKPziDETs9D2pgpasOoQKZtdfGZWV395DaQ8iJr5ne6uh9
 YMkI6XK0LYVqqybLz0CRbKeTw7JA0wT2hKbqRMS/pOX3440BUO1XngVowSqDBe+uAJmM
 R4X+oX0MaXogPD4Vg8BzvwTgESpJBYTsWB7S69KXvqxGYO646F77rRIUr8WjhqT8lrPl
 p1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
 b=zeA+9i0OYBKqY9BbpfIxEZYXIITxDKmL1FdLA6ScNPZdPElHE1oyVAZY619dSTrDfe
 GHw+qDsCfvNT6dhpWhjp786qrJkHl/Pq03pzytMtzHjDXtYpeuAvqPHBdi87GD7SZZ/G
 hMUYRhEfRIgAtk+hkV2NnSo8kFcABeqz3dzLEuRoHvPo2kGTKFiUMsc/IfqSD722AlWr
 kVz6aqtIGjA691ZkG4BhzcyMkDD1yrRm7adDQhFO0dKLwGGd8P2j4KTn2C9HABcxYnzZ
 svvrw6KtAQ1v83VeVC4Y2sUSXBluffu6quhFU+5M+bQXGObsfxQgkHFbqPWGm5PC3UAW
 LBOA==
X-Gm-Message-State: ACrzQf1QsUG3uC8GBycPshDReX5AaUJ7K27UgyfSmlmYtHpOUMWLhH48
 rZlGF7PFaTBKb5rzukbZIjEWMg==
X-Google-Smtp-Source: AMsMyM7BCht8X6bxZLVdcbcIZzH8YRsjw+PzdKJq7+vHqi2BCOS/2yVSg93iup4XOoSyvzzo6AAVPQ==
X-Received: by 2002:a05:6512:3241:b0:4a2:4f95:c02e with SMTP id
 c1-20020a056512324100b004a24f95c02emr9621126lfr.23.1667430792917; 
 Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 02:13:03 +0300
Message-Id: <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/8] dt-bindings: display/msm: add sm8350 and
 sm8450 DSI PHYs
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

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

