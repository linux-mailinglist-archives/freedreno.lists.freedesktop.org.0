Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D361C7B1B26
	for <lists+freedreno@lfdr.de>; Thu, 28 Sep 2023 13:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853510E0E3;
	Thu, 28 Sep 2023 11:35:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4764510E0E3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:40 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so212056551fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900938; x=1696505738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAgwmDYSEumxdHOz03qqC77Wc8/BmRIQnaYQ3alh34M=;
 b=c8gdnewpVLhqy0/j6D+LvSRhbkcWl2XaRexJGHT8zB06suEPE/NM2lDxk810y5csrB
 51y5CT014j8yBlGlHUNZ2vTc3DfGC1KsyJUEEJWVxaxUj8xzMHeEIK9mmt5RDCXj2Ine
 FUa+wrPvFUMMjoxADRROpVbca7O/jDJopEGSUw0VJNY3igDyAWQ33IsuJHJsfqfrOhDF
 OHsu5Lfr5PCIJnDRN07DualPU77hbQi8iiVlMOoRZ6AaOXC5W2Fy1pxLCRitpJEMNeu3
 z93hvFxc4GtMSA9oa/RnbiJDP+KFTZKS16zgZDQjhdXQzop8xFfS1GSw4jaR/wWtMmRi
 1UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900938; x=1696505738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAgwmDYSEumxdHOz03qqC77Wc8/BmRIQnaYQ3alh34M=;
 b=nLdnw1Qfq7/Qd8Jhn0dVyWmT3xXqc0yr7ELHC+Hxx0/gZ+qGo+vCnttaoXzL9qApfk
 nYMfLCsUNqqt3Xt6CvLY+gpn77kbbcBJLu5jc50+4pPK0MpnEwIB0IpfRiGy+u49IkzR
 a2Lw772fXnEaROFzsr7eZEfROX/0WWn9zQ33evv2jATGaogGJnhErph54znk5r0sdguj
 VbVtgv1MuYYHKZsIMaNX4Hyt1nJ7zCYEkp75tp4g9XJuIWBhPFbyFzJtMK2eoG/9h+yr
 DZg/6UQirJkaAj+4/9qlFI95uhZS/OiBYahzlHt3bDJ7LGkjQbdORYFjpTADPivVpiLR
 J91Q==
X-Gm-Message-State: AOJu0YxXxCl4XJ48wE45dK0SrinsUkjdZUKPLb40iM3hva/N2SEzIRQX
 /z8flumgLOb+w37im5mCET8BHA==
X-Google-Smtp-Source: AGHT+IFWa4lOq/RH6ekC+d9SDuQzdJV19CgPIBvotr5aSSznaLJHkEocII3osyAz87VI01x0kZ0NDA==
X-Received: by 2002:a05:6512:2521:b0:4f8:6abe:5249 with SMTP id
 be33-20020a056512252100b004f86abe5249mr859962lfb.3.1695900938521; 
 Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 28 Sep 2023 14:35:31 +0300
Message-Id: <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/6] dt-bindings: display/msm: Add reg bus
 and rotator interconnects
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths bindings to allow using them in device trees and in
the driver

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index f69196e4cc76..6b4ce08a60dc 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:
-- 
2.39.2

