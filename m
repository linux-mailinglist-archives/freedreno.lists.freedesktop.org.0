Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D654BBEB
	for <lists+freedreno@lfdr.de>; Tue, 14 Jun 2022 22:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809EB10E39A;
	Tue, 14 Jun 2022 20:39:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9910E39A
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 20:39:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a2so15764739lfg.5
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 13:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:dkim-signature:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding
 :precedence:list-id;
 bh=DCpSkdrYxtTlUcYLr9LlNuMrg5eu2pPuMSKQ3Q9PBq4=;
 b=J5/qDCIOdFoJiUvYDo0qAXa/2CgAH35/bIeYQP261+Vk5OPbx3cTduuOpu+rygHkHj
 8aYCpaqWMgwrZVqDdWy8+SeAtYzqjtwzjGtuwlwntdqrzX6XQ/DU087XUjVGPEVV6hK0
 ihrEuIo2yZTlUS04qfLgBSPXagF0OxE4/NwH2iSLQIgQrqXmQ20YWVXqO8V1lCx6sTCs
 zfwX2LhRBVy8smvFaKKdb1s4E81+rkG5UkVxY3dCyoNut9kblKDojYyB9Uqlr6z1gqzp
 DlCeop9yBgsbL5tWFXtCijrIsPEH9d84qYMEMah0E0eliT5tT7QqoHESpIElP6QlE2K+
 ihxw==
X-Gm-Message-State: AJIora9aFZoR2dpVZTrsTFZSLN3/nSKady2xEDY8Mys6JT04fnfB5gDh
 U1vlW/nDERp/nV4Gl5ibmV2jDRfOeeyDE9kN
X-Google-Smtp-Source: AGRyM1tFsUvC5eKh2aXrogbkMnS6XuIZU0hNKcZEZRZTCSkKGqGago+xHOAopstcsNTU0o1/IOwYOQ==
X-Received: by 2002:a05:6512:3d2a:b0:47a:4f17:3e5 with SMTP id
 d42-20020a0565123d2a00b0047a4f1703e5mr4138751lfv.135.1655239145464; 
 Tue, 14 Jun 2022 13:39:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a2e7e03000000b00258e01fbcf1sm1471261ljc.96.2022.06.14.13.39.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:39:05 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Tue, 14 Jun 2022 23:38:58 +0300
Resent-Message-ID: <Yqjx4kHrjhRFN9H+@eriador.lumag.spb.ru>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a0c:e047:0:0:0:0:0 with SMTP id y7csp635245qvk;
 Sun, 12 Jun 2022 02:23:09 -0700 (PDT)
X-Received: by 2002:a17:903:2308:b0:167:7030:6847 with SMTP id
 d8-20020a170903230800b0016770306847mr36956039plh.122.1655025789699; 
 Sun, 12 Jun 2022 02:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655025789; cv=none;
 d=google.com; s=arc-20160816;
 b=fqFIyU/IOxKG/LGEsunwy07ugSVnbLA87r2NE+rUJFkuLjzAervXS3o/bQ49KiXC3I
 gdEF1Nx9PNq16SUKF6XZdyvTB8+rifXN7ptIPKpG5JThfQZfFvZlqP10g2hScM06O528
 Vo1kDMrggUsQG1DFMK5jtRTstzf0mAKbWBt36ZRBc55JvKFf12XuOIFF73KBdrVYEin1
 V8RCz60uo4m6/fwoa6u0URUFe5k2C12dsgbsF9ev8QklUr0bWPiuyFXGTFGsF30faJhh
 G1I+gdEV3A5xDhfWZpYLwysELcsoOPlCof4Tf3uzoVsd9H8AHTfoGmL5dM3T/01bjNAt
 EVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature;
 bh=DCpSkdrYxtTlUcYLr9LlNuMrg5eu2pPuMSKQ3Q9PBq4=;
 b=BVXgKzLc2Yn9ogMfemjMR2Ocvzv3PV7mgzq0P1gvzMAJGT62bTjGMGRR+6EB9LdSnE
 qdmaVkhEuZIZr1ekIZFnsfty+RFyuTIfYMtI2H7lXVxa/jq5d7CWpHaEP2SNWPKHGB7q
 ZxxS3VDHxtWx4PxQn9NXxbBioBPkBCX93ANvGdw6c6hEMLPpHhvI+tL0nLPZ0BLr/Ac5
 uSI2wrzm24c9PW2b86kPCfER29/Q1x3HSaC5X1hl0ONHu0FjNlH5f0pt84UdUILn1QfS
 5RxE+YPpAEp73Vw7Zlz0Rsh/uBcKUkHKLAwZ5B2a1010sAQycmatUU4UBBLvHejCdhvn
 MpPA==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=fail header.i=@z3ntu.xyz header.s=z3ntu header.b=Ocj3eHUA;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=z3ntu.xyz
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 lp5-20020a17090b4a8500b001e82bdf4718si6443453pjb.3.2022.06.12.02.23.09; 
 Sun, 12 Jun 2022 02:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S235807AbiFLJXG (ORCPT <rfc822;abel.vesa@linaro.org> + 14 others);
 Sun, 12 Jun 2022 05:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S235656AbiFLJXF (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Sun, 12 Jun 2022 05:23:05 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABEA66AE7;
 Sun, 12 Jun 2022 02:23:03 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 61B71CD3C2;
 Sun, 12 Jun 2022 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1655025752; bh=hxYZ3qBc1wEth5igQ7Xz4ZthZF7g37vNciOqe/COQIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ocj3eHUAcy3VWLDsoyjjwaafialfR/nr6xr6OFuyOcgcGWP/+msSpeS0fVIqO8onj
 S7gmlT2jwT2PghXE3nEZNS7HmFWz14SV6pbnKJ1AFmsHRSQJzs4GObf0h6Y9m7QHkR
 smGwD1b7fAyaoouYbUpsBphmOPx1Y2Pqq4RVvOZA=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Date: Sun, 12 Jun 2022 11:22:13 +0200
Message-Id: <20220612092218.424809-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612092218.424809-1-luca@z3ntu.xyz>
References: <20220612092218.424809-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH v2 1/4] dt-bindings: qcom-iommu: Add Qualcomm
 MSM8953 compatible
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the compatible used for IOMMU on the msm8953 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes from v1:
- new patch

 Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..e6cecfd360eb 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -10,6 +10,7 @@ to non-secure vs secure interrupt line.
 - compatible       : Should be one of:
 
                         "qcom,msm8916-iommu"
+                        "qcom,msm8953-iommu"
 
                      Followed by "qcom,msm-iommu-v1".
 
-- 
2.36.1

