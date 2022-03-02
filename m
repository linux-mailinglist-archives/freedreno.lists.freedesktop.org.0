Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C36D4C99BE
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 01:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E489E59;
	Wed,  2 Mar 2022 00:14:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18189E59
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 00:14:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g39so29605417lfv.10
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 16:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6j1RnvliKlo06NEbsXMz1JE3sTo5nc2f1FocUULplg=;
 b=lYKRJMToGKwmhHNEU9Dj4fWJY81n58e98eZkT5KbJf0ah4zkCFYjSJMhk2RMLR2YVx
 05tleAzmq9y79oH46pmnqhNWly2msX29NWR0gN2jKOdQS1Ib3J1d1Z08X0YSD+wdhdKM
 XpsaXyfdV4/KLU+MARc5ZH8hTL6PamJSMFi2HGgiKVw3yfPFvtK0dOO+sY/IDbNMwmWT
 nV3pO9dWZ3ioLblxd5zQDUN+1Zq1KvBr2K+2I98RJQ5ovA8rOA8Ille/1KDBtoyaV/zN
 0lNHB07igQW7fPkfUS0R7fIsekEINc92bdREYIoz3zRcJ7JckJGXs0ApkXMydbBIj6ot
 PiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6j1RnvliKlo06NEbsXMz1JE3sTo5nc2f1FocUULplg=;
 b=inynTlvkeZLj8Wk02iKisd/erW0IrDZVDor+8Q3aPXBVUYQq4Mhro99ENKU/MGXlWO
 rBw2e+BUXd/BmWg//V4T6Xclz5/Rer/95oOZAMnvpWxF0AvuAz5m+ruEaYFEVKrCpkAq
 VeQVzMfDJgwS5Uxe196RTnCfHa4wGPqnHUP3VtMgWXXPUAHxBVvZtpOlLPkcCbej+rTW
 nPciR5Vmdq1hg4g9KLQRIjfeDyOhpy5hoc91kyXmaZgUCupXDni8/ROGefSxkhEKu5g5
 alSU6TpAg8dGNLts7afnL3y6ux3ollmxaBCTIGwWvro/DR6cjcK1V4EgG4ptRAP0JD9s
 0iKw==
X-Gm-Message-State: AOAM531BtWTl3eMWa3fdK3PoTiwKHLp4+2SR4euzDshUrvssJaNADBp3
 7DPy9QxoonP2CkALhXtaVQImcA==
X-Google-Smtp-Source: ABdhPJzFFxxw80VkIGyBqID0M6qtQ02PtYQg3lVjdMGD0xBhjRsRppC656mY1y9Ek4dz+PiTMnv+Bg==
X-Received: by 2002:ac2:5fc8:0:b0:445:a43e:3526 with SMTP id
 q8-20020ac25fc8000000b00445a43e3526mr6021693lfg.39.1646180052211; 
 Tue, 01 Mar 2022 16:14:12 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a19a405000000b0042b6082b10fsm1734307lfc.262.2022.03.01.16.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed,  2 Mar 2022 03:14:10 +0300
Message-Id: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH] dt-bindings: display/msm: add missing
 brace in dpu-qcm2290.yaml
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
indentation for another brace, so it matches the corresponding line.

Reported-by: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Didn't include freedreno@ in the first email, so resending.
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..b1b4652077db 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -209,6 +209,7 @@ examples:
                                         remote-endpoint = <&dsi0_in>;
                                 };
                         };
-                 };
+                };
          };
+    };
 ...
-- 
2.34.1

