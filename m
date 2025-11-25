Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D3C83F45
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 09:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988C710E383;
	Tue, 25 Nov 2025 08:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8SXRchO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWKMSxoa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D4310E383
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:22:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gcUH1978793
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YRjpKsqoY99+JF5M3oGMFE
 Bu2vsC0vfO0ibxsB+T3/Q=; b=l8SXRchOnF7TCQ9kqERONX+G5/lFAuL0hV2Zql
 thJufKpP9ueAgi1A7JMVX21KIe7GyPlYdQgAzA81R8wzNk4sks/IYV+3JEu2M+sp
 JVxJfMVEsjQK96f93f5517OmFNr4Uii91jwVhbM+IllVQ5+xaJsITLRnwxZ5hTdY
 iUmu5IQsK7gHXRhBSdHmKs9kDsig5p77z0BRNovGm5Md8MccPyWqk3Wn/wZ+jrJc
 UHTh75Nlnq4z03INALaN37cQVgAlVACKkh/JQt+U7swZi3OAwWT93KD6peaWRDFf
 nzZu/EniSdwOIJ8FpJOYNFV5WwU3zyxUpm4uA5keTNJdrdGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsuaj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:22:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b26bc4984bso2023576385a.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764058944; x=1764663744;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YRjpKsqoY99+JF5M3oGMFEBu2vsC0vfO0ibxsB+T3/Q=;
 b=BWKMSxoayyoJ6AD6pdRKKYvIsoQk6HansGuCaWUDH7PXxk2wZ0VgXsrM9s9Nw1GgtK
 qzGWyrz0yO0g4o9vqQ9HmmczJqJ08Je9+EazQevUbUxEYgs6z5ivExWVxhsMOdaVGbYz
 jgW0SnXtAG6GYLo80mYT5SiXdw0dit/XOzPR3PjOa5Vm+dbbkSs5VvV9QJF3UJYQQ4Mo
 aX88v5WljmsPkXQi5hCxoh73lugHCCFA1Ivf8VHt4a8x7kKhQFLn501vR7aaFYkUxjrk
 ISshj+7+DPcrwsItiuKpscGacD5/HQqcl6Z41Rj+JNtNwBjE41WfsIDPZffVwziPhLE5
 DtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764058944; x=1764663744;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRjpKsqoY99+JF5M3oGMFEBu2vsC0vfO0ibxsB+T3/Q=;
 b=Ap64K3Of7Zj8GSU8xrO8TGpy+LWGxqc/+snRH47d6sBwH1n42keUahalfyq1rdGPL8
 loKpF393EWA8OIxa2o1BWCZMs8fVzAm/KPh6vTYmH+jV7Zr7CsSnyDKtm64Hfd97XsQO
 tiBoBlp1IB59Y5/nExvCwBBE47C5/EIjvUlqJlvBZPRN2zJLRwN9nWicA+zFOfcjxgOF
 TGhb3+/EBJuLu641r74H9IVdT7/ueitZJ0JPvWN/T0iiw0huxbKmCUEW+SaHMsXr7jX9
 9BipoV07tQB0hXIyQkdaeDA6JEiR9Puc6rejkdGanV1mzIW4nc4UEA1cq5XdOEIO26d0
 glAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy2qzp/uVj7MUrutTLZPUrNkGUEYAE0fyRS6nMGK75nY7cUUJkcSdEgJjAw+q9bdp8soqDgh6mkZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxelDlkM/DBzuoUQ033nzu9vE9ovj5VB0xinOP4nJr5f/FcZpDn
 NhiD8EjjcSNcP91jlrdvBks+0YSIrYiS4lviQZ26lSSg3pvTn4gCfJuimHE0GtotXBZOh0jSoXw
 ed6StjLvYIgd8Bm6MZDSbEGp3Rh8Ed8GxMU/LtNoYTEsMvGkJBtuuqjVX+uKFoeTWzVNU4kY=
X-Gm-Gg: ASbGncvYaLE/eq4hq2uhfvQoKhMN1o+JnCAENrMcny9Q45UM98i4DJ29HpsCuxDvnxE
 QEUwsgZUsZi3eArAeLvArXClSnkvHGeEc2DykXntbz2wjn+GO1swBcOPj4Hd81jAwQYa6KHzqE0
 H7gSOnD1GijHq5+rqkQT6ihRranTI6bN63xCPcbYQVpjFNiT7HDwWztSMgssbYnDtdSJPilwOn8
 3ZvB/E+G7r+Is8WGF7G+f7RnAFam3ACWmZNLpeY2hB4GgMbmKvJa+ur88Tb64/lLcfMo94dTKhM
 ACrV1s03ar2SGZ+byNUxsWUq2h8EAFslL6LcbFFVlrgnCmf8UDTGCExH72DITWiJsOCjgDyD+6n
 6Mdzruj6IfcnPf7JSdZiqsi1qj31KgLGarQFO4mqg5Mkke/wpiEsouS4JVZUS0VmfJW3dMfO3sX
 c=
X-Received: by 2002:a05:620a:44ca:b0:8b2:e4f0:74d2 with SMTP id
 af79cd13be357-8b33d5e0708mr2088683885a.88.1764058944607; 
 Tue, 25 Nov 2025 00:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgbw5+t2RFxd5vwgHS2/xP58ds7tCi3xfgDuWhOL9/5kLj/9xSxrzjaWShPdduWP/LVNaZPg==
X-Received: by 2002:a05:620a:44ca:b0:8b2:e4f0:74d2 with SMTP id
 af79cd13be357-8b33d5e0708mr2088681185a.88.1764058944092; 
 Tue, 25 Nov 2025 00:22:24 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48d6aab4sm103530771cf.15.2025.11.25.00.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 00:22:23 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 16:22:12 +0800
Subject: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADNnJWkC/yXM2QrCMBCF4Vcpc20gmS6JfRUpkmWmBuxiUkUof
 XeDvfwPnG+HTClShr7aIdEn5rjMJZpLBf5h55FEDKUBJbZKYSumkPPd280+l1HUlo027Dr2Dsp
 lTcTx++duw9mJXu+ibucIzmYSfpmmuPVVFzTp4gZZ89UwdoxEMnBA5Zy0sjHSotIGhuP4AQ+Z2
 RuqAAAA
X-Change-ID: 20251125-mdss_catalog-3af878fb6fcb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058938; l=5994;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=T4+veceh43Iz1HC9uB499V8TtofoUBw/GEaYL11J+pk=;
 b=gJUYv20WEI5ukHHHm1d/Hca0uVR3M5CdBme19aSpBo0+vWXjKk2qdxhhWSGVE1YlGSQEUNfa7
 Leti51tE9+XDypwOYKNC0lxZzQfg/JyqJA4B59QQLLKLiFeZRAHXaDz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfX62w3HlKfkYib
 WirafJfT1k1z60IwQxGwV1jq+XuzeQo1/+rKMZCMP7ishUzC5AKeXEmxRUdoygMOj7PppTBmwOj
 ehJXBHi6RXpQJMhqzFY1RyK2xtIaMnb3LIdjFHl5x2GObuqd+OgzI+96Sfu/5DE53rwZdgqoTSn
 q/iMXChyf0yKD+N07LJ7NgDgA5HMQNAhW81w1CwK7ZANlxOu2J1tJi/IBcJMaSX278GfIwNFFQb
 BGv+yNtP9AsR2cE5dN6iEGJOyHX/QIAzWyqSTw7R5xFVwXgf4IwqGDzL/YYRt9aTcS0dLI13W4m
 iHLmd8bWXxvdL5Zwz3MshQZ4QMnTNpXMlgvY/N6CcFSJy55op96f8uxr6I2k3n4atPA0mXu+eHe
 Sr8Vb/NKozJGIC9RD9igqkX4nlvc9A==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69256741 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=3SrrOXIG8BVLCHsxiMcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 83gXiM-r3Roxz1pE9Wg1gA1oZk2NeZGK
X-Proofpoint-GUID: 83gXiM-r3Roxz1pE9Wg1gA1oZk2NeZGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068
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

Interface type of MST interfaces is currently INTF_NONE. Update this to
INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
dpu_8_4_sa8775p.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This patch was split out from the MST V3 patch series:
https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
---
Changes in v4:
- Splite chagne out from the MST V3 series.
- Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/

Changes in v3:
- Fix through the whole catalog
- Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/

Changes in v2:
- Change the patch order in the series.
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..ea2329f0b5e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -351,7 +351,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..00fd0c8cc115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..826f65adb18b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +367,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251125-mdss_catalog-3af878fb6fcb

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

