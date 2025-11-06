Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13B1C3D680
	for <lists+freedreno@lfdr.de>; Thu, 06 Nov 2025 21:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3FA10E9D2;
	Thu,  6 Nov 2025 20:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMojgMSI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNmBiCY7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A8A10E9CA
 for <freedreno@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6HVsfI528491
 for <freedreno@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=; b=lMojgMSIYhwCkbag
 bkpiqXrCiXqAAy2V3QKzyPug2H27bqhMWag5eJxEOfJ+HN5oPcx8Vt6vu6m5dEYd
 Hkp+DFLucHwzjGmGB6BXHvfn4yLpOYJFmIe69oRw/NBr5fVZycdIye7fh7eVSzDJ
 UUvdMfoxpBrUlOhSsPmRMQ+5GDLmYHs5uhrPzvq6N/Po8IHtlgg7+t5uXGfWpBeo
 lGIZCJDINU2Nwn3gBf0cYQCjKKinZhsdPwbc4NuZsfdvGIwc4ApVNH62Exw3adj4
 SaS3ZuIiIRugxZrVUDgnLrUhe3ZNrscHXi/IXdNz3H4b7c9Jfq9aFEXHW8nj9SuE
 wwIY0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905hrj43-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29555415c09so745965ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462246; x=1763067046;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
 b=YNmBiCY76ctyixjBo9ylea9khrSGR0zNOZjU2JTXBCf/fbNyjJiAXW+VvyPfE+nd8r
 S0MIYcmpz427IvSt7lH0lSGCeU6zOLlD132PyY76uJsjErGbNqeeLe16Hc7B/W2/l5w5
 B84KDVnWSH+XMGZ85H6nA2+5r24DGHFrhqGoqz1i2SyNUoRt0gRoChlwimC10JGYWS4O
 DYM4EXSGoplP3TvtVj3LSPdzeIj4cykpUlrSyVw/Cen2ySvfdAQsVvySWLcwmf3Rr5kO
 EQdmsxcUjDVkbgcJ2KtIYLYweW7twRhpgNlVs+EQ949r681ZzdXCzfca2Byo2m8TeS45
 8tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462246; x=1763067046;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
 b=iiW3O8DGrOs5hEj96FDp+h5s49wv6bSPk5j4zmPK+Ks0NNOD/RxWIMJP41T8j5liUX
 kBsEh7SYwLqdwHuaEMFjvLAX60FZ9Hh+n8+evu/xj7KFEnN1D+MdAvsr2IosV+3N4Ug/
 CrQUr45Bvir58q2fJHzsr33DgzD9FLePgkKCeGlG1k2tsCCjN9uHGrC7dIEn6jNsHGhT
 rOvCY15oYpgF/w7QzS0XqjT0B0zHeZGY11gDqNLmaFfCFVrA6eehzl4RdggIVBnvWDE5
 RHg3UdMJkPdNyvTS96xHM+7gTcfw/wZAn0v3Me9hf7H1fqZg4jn3FmveuSbTf49ynTo+
 IPNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnb1/EX5huYKSojMxTXgdgX8iQPIIfsS8+w/+ojJkUmBsZSj97F/XrafYnnLOqJy4SKG9QHT4a9HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziAhZRON98Lf7vOMSkSL6JzdGHbO8AQokRvg2GNNJMMri3b2rz
 cNWQVC49l5VlINqywJ+NKgxWGN5d4E4JO9cCZSP5e2+B2rq86Ev5Qm/cGvk5Fhky6bgXWVsQz0e
 DwNyzJ1vnRswAK3WaMGmTG6aeDuVy4NwRKlcnNg8Ot8qkeyqdAzEwx3ep8pe4smH0sv2vtHo=
X-Gm-Gg: ASbGncvNuYYYxdJdhUKRpcgo9kfkEKsBNXWQtDpdHgGsln2sXE6p0aT6ZHsX3JRXelh
 Y3RGjRSdvJweCrcWS1YM0YeOSY1TfYvxVsynci0QSdRAyIXf8FixySWWFO2coU+ZLIyamhyBLUm
 c+3Rb9/Gk2m56OYseosYS2u833W2SJvTvCR2eJnqMawmabDXoKb2dK+D5zXPpTwcULhiaTqxDSm
 w41kdU/v3/5Lr5gKdFjmJmyCm5Wd2ir3RNaNqznwtik3aamrtlR667u2ggdW2FbLgazcT3kkcZg
 7DaGXshBv+f8n4hhSSn7516aw/EV/+UyTlAsHCjSz1iXPjKjfQ8DUaQnMWOw43ZAaaeHU+ZVFrp
 2FX2zdjWAj+i85FuNmPaLsOE=
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id
 d9443c01a7336-297c0464c66mr11018145ad.49.1762462246162; 
 Thu, 06 Nov 2025 12:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFubHR3w/yTqZCuf0JtG12YJeLfTf4xJsZoeb7KhSgpPBRkU+4WeMkGH76/FL8a4LRS9tl3ig==
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id
 d9443c01a7336-297c0464c66mr11017735ad.49.1762462245600; 
 Thu, 06 Nov 2025 12:50:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:08 +0530
Subject: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=5000;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ciBeeGMfjWiHGzfaxmV6OYY2C96eUNUrGxpBOVfvQWI=;
 b=7umI2JFcr4UFcqzwuX/k/CjT3oVEfYmWA0rzoO4MrN7FcQ+DVggGGUff2nWNC75JHzeP6/uDx
 rhKEprxp0qFDVZ7CTAT6TnX2Mz8Ga0VP9hRFa4H+nrKPan8lOVnck+J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX/rOll4q/1GRU
 27fTkehgFLs8bHfnFXPVNuZsa+9V1BvEK1ZagPV5OZi2fRFk5/2FG1oqVQDcmm05ELaszgoRM6q
 tB2DF/hhjNMfJBF7kqxH2SQB1YvF0Yna6QdKo+fjFXgiN96EJWpKLNjGlrj4u9PCXda7G+QGb9g
 SrBu0mCKUTxdCae/mcRSQw6/o3ScsFnlM8U/GbCHRL4QAuZycB0f2nRpCPdSx2e+BOrhwZsfFso
 FIn3EdImUleheO+LGpOWoWE5mG2Y7iRlSw1+IN0M2DY6JfMwGlOKrXXNf7Mr7WQhbISEiLv/igK
 wjoh0KFj11Wy8lJrzXC1yOjc/rpGxG0YrZt4SKi/kNF63E7E6pa3aBkICDKSaRnl5sBVkn0BSUK
 vYdUWmFg1R+KdfZdu4XwVr4mQ99UpQ==
X-Proofpoint-GUID: ivdfrdKRk5M-ga_1ioll_ycLnPQciMKc
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690d0a27 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ivdfrdKRk5M-ga_1ioll_ycLnPQciMKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC (Inter Frame Power Collapse)
support. Compared to GMU, it doesn't manage GPU clock, voltage
scaling, bw voting or any other functionalities. All it does is detect
an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
it doesn't require iommu.

So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
schema.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
new file mode 100644
index 000000000000..7621556477d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robin.clark@oss.qualcomm.com>
+
+description: |
+  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
+  belong to Adreno A6xx family. It is a small state machine that helps to
+  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
+  power.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,adreno-rgmu-612.0
+      - const: qcom,adreno-rgmu
+
+  reg:
+    items:
+      - description: Core RGMU registers
+
+  reg-names:
+    items:
+      - const: gmu
+
+  clocks:
+    items:
+      - description: GMU clock
+      - description: GPU CX clock
+      - description: GPU AXI clock
+      - description: GPU MEMNOC clock
+      - description: GPU SMMU vote clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+      - const: smmu_vote
+
+  power-domains:
+    items:
+      - description: CX GDSC power domain
+      - description: GX GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: gx
+
+  interrupts:
+    items:
+      - description: GMU OOB interrupt
+      - description: GMU interrupt
+
+  interrupt-names:
+    items:
+      - const: oob
+      - const: gmu
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - interrupts
+  - interrupt-names
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    rgmu: rgmu@506a000 {
+        compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+
+        reg = <0x05000000 0x90000>;
+        reg-names = "gmu";
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+        clock-names = "gmu",
+                      "cxo",
+                      "axi",
+                      "memnoc",
+                      "smmu_vote";
+
+        power-domains = <&gpucc CX_GDSC>,
+                        <&gpucc GX_GDSC>;
+        power-domain-names = "cx",
+                           "gx";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "oob",
+                          "gmu";
+
+        operating-points-v2 = <&rgmu_opp_table>;
+
+        rgmu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea854fa44b20..c75911e70c82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7895,6 +7895,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0

