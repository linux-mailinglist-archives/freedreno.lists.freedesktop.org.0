Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3372B097C0
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 01:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4110E8B4;
	Thu, 17 Jul 2025 23:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9wsBCea";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E99210E8AF
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HHoX9c000647
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ybo7EjvadG+e2xPAFSbem9WLo3NezVcN9Dxj9pnt8I=; b=C9wsBCea/5SUZ+We
 gMDDAN/IrVHf8MOMSvjccfInrfRQbC1WLA+fpoWpySPF4RC+2ogHOupUU/BtVq02
 D8ABSbJfX2344KRXK/syqvq2tjOgYUIXTdRPQ+8lQOn2q8jRRlniW5OULkD5whBO
 T3xe29sFysQEgVdAYrXTMetJzZayJhgav8IGj458mZJ6wQMyBKRdrWa6PKlarhQE
 LnbAtLNa17JRN/dxlt0Tf3rGie2W2n73HsOfUd9Uemw0lhPusSkB+pmGMF+YeGmS
 xOIl5WVlGaieKbm9co4ErR/Ty7ld4b6vbDLOZc8+I5P39UCwnT6H87svQsqAhZo9
 JzNncA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drvhhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235f77f86f6so14527865ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794933; x=1753399733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ybo7EjvadG+e2xPAFSbem9WLo3NezVcN9Dxj9pnt8I=;
 b=P4gA1YKwpIevAsj0BvPkg0iz6XtU1SxXYHCNxwMfhlrckeYFeI5tbXk3R+6kv5WPdN
 GiqaxOjp0BmYHaXeyKCHKj6TBtttlz2zVxZ8LAe8XDklC5UkMl+XFS2TZwNEz4uOV/Yt
 /Fb5UKaDSmpl6oBLv6wQbO7+LTe8O/svGCuBQ0LnziohoRI19PcaFOwTngY7TLU0enFI
 IsY0sbhsEiVv76M0SFIm8fIK0Q1arwAdGeWEIcrEfs6fve+VxoyS9bNslasB+QHnk3p4
 iGDfptKRgPmUYbadKUkN16TfwCh/8QmiiQFAU+VWsCJNG8vEN78ZmtuExLo1HxPcK+ja
 iGBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3AQ/n3seuieu57kK7IfgGnV5u0AT+8KR2V2wG+IGK3zO6gx8gOuHi6OcQtJtyC+PDd4QuLadkioA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw47t5zST4jxskz2n//j+mvhvu4lOMYl+C5Px39FCuzKzj+fbgB
 GgLazlhnHp3Y0a/kbjJH0/RqsrEl8n3vMu9rE1PCmixvEHrQO4mHQbqfuxdffmMcMNSjYkfqv+W
 JMBaeZ/HxmTQpGycGF3B3upWn7ARTOvvl9LTNL1mUmkFKHCETyw0NSpgZsGEdK9N/GdVH6LM=
X-Gm-Gg: ASbGncsgnaXUb7+RhCE1CVL60epCu7zWENyKs75MbrWJmmzIOwrXEdORgkWUAgoWnUe
 pKfcfL27wZCKAPiJ0zNbb48mIYDpYISbAgX3Rikaupc3R7HLVhj4f/e3fOluf5kIJXVDYuEFfdx
 uKrBm1E5TENHrultBCHjdxOBRtOg4LYvwQa6I4lHekHJTd4zqJ32hSpvDVir1vNZLNKhe+rLs6S
 mcpWPZgsJUqMG5gIi1J79m7DhjrXURZCeeOXv2y1cu/1vsZ0SNsLqCZYLduR9mPKyrP0HARON+I
 Caq1WY8WBRonyDQopKBfFO4e0lm3uNMV9LfcCOf4Gd5sNQlGHgvgb6mvD2FDi/FJtwnr2G7eQio
 JVl5o0THkrj6Ot9exOt2OzsUa
X-Received: by 2002:a17:902:c947:b0:23e:1aba:410e with SMTP id
 d9443c01a7336-23e25684a2dmr131959375ad.2.1752794932589; 
 Thu, 17 Jul 2025 16:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOFsGsD60KTJbjRpb7CmKQ6G/KVM9LZO/JS8BWAYceDSZWFciCkRmX/JdxbdEmCVpfQnmDVw==
X-Received: by 2002:a17:902:c947:b0:23e:1aba:410e with SMTP id
 d9443c01a7336-23e25684a2dmr131958845ad.2.1752794932095; 
 Thu, 17 Jul 2025 16:28:52 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:51 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:43 -0700
Subject: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=2566;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=9wdF66K4CeeQceORgBagEdldT12aDYJZI4HWG2A/5Zo=;
 b=JXB49Mx5GPk/Liru+c42GTK0DPlFLUxRjo+Hug76DtT7FgEsdc5XCT7b67DDFF0rkAtfN5RR0
 4BxCu7l3FRlA71wmUkiYi/DBhDEFVlhPdfUpaixEMBP/IBxggCMbO/M
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: CoZDT03NvdhJDR20cDwFKsUBYsnIwIK9
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68798736 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cmjLwvqn_fhjV4Buc7kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CoZDT03NvdhJDR20cDwFKsUBYsnIwIK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX42Gd98KV6xeE
 JmBCS7+KbLuWl2a0bwtt2ejybC55jECOdLMyloQpd/Or/CDx/r+ObFpl6tx4ap7PUBp4ENx549J
 VXBABtjw8wg9Bj1lvg82+PYXmKfOIgf7rUDsZY7V7kYIweL3ahvJWDcutFao2b+BJRVvHWQFixv
 69XvZy2hEVmimUgsVrXx6k/wrcppYLElRj6e9QAgdZZjKnI7UjfJREzuX8tkEQlkq9021+vWIzz
 TPIhPjfW0mWsAftzJI9Y6+0NW1r7h3XUss/VUPeOF4OOY/cvCLIu+R69KAWvpp0JIFZlS5cMHFG
 oBioodI94armGwSUsOJ3fZmBsCOhen5AO7B9ZX5X+KE/asHs6OpjZRPJrffvOYRsJ+PPUBhTstM
 gYsx9US6z5XLDzrHAM5j9T+tlwlr7vUDKSQFD0zcunp+1ZKYURADsRcxw4skc4KyZ+Fb2b1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=751 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add x1e80100 to the dp-controller bindings, fix the
displayport-controller reg bindings, and drop
assigned-clock-parents/assigned-clocks

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323b..4676aa8db2f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e47333..0e699de684c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;
@@ -189,11 +189,6 @@ examples:
                     "ctrl_link_iface",
                     "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
-
             operating-points-v2 = <&mdss_dp0_opp_table>;
 
             power-domains = <&rpmhpd RPMHPD_MMCX>;

-- 
2.50.1

