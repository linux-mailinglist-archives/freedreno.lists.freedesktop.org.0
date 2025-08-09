Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB1B1F179
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115EE10E21D;
	Sat,  9 Aug 2025 00:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajZ4qw3A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BF010E200
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578Dw9tU011818
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=; b=ajZ4qw3AVALeFnVG
 wAats32HsPCVnTKzz7H+3cKxflvILAgpCk73BXH36NbDo8xY5ASkKU5OQTfFFvLR
 6RX4p0TkPWKIm5YejoixVToByFlcv4rGv47avigjYFcdDfTY/iF2xLlwC5r7yJ9T
 Y7Gz/JL71g/fELB/ZtVuxggsYOJDC/rfXxLOESu+FEa6BwA9ZFbuVpjaps18kSAL
 UiH9IFGBSxUCBZ78BQSGMS5TXNe3dBkjVNgDTRn8YRV8+K+0kIjmFz0TrChSU2Bj
 rkb0TVZY0AnzQiySz/KTjNlVvO8cAz22/QFZO0gv4gmMmGkZ4IJwbKjTNmzlZvZp
 nfyDqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy69ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b42bcfe9c89so2098871a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699737; x=1755304537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=;
 b=Gp6QNdIwUd18GLwIRnhGnpfsqGIXHl16a27qgAvFjsuaDoMg/lXh30IXibJsJjLCRt
 Ljx9pJDEd+he/ABNcRzc9d9wGYLHJ/ICG9EsukFaGQBElTrG+rrbKu8a1IJ+0ZqwlukN
 aSUhttO+CW3HuAzY4mzv4pEsCJihl24ycf96xbNG/cH5W0XWgXxA34MlFuHqy/jeLObT
 stbTrN56H+tAwhEVhPr3TMSQHapGgTZAz8MSvs6FwTQPri8w7UYiu1g8p7fk2uz1YB1m
 QpdfqxXGqIm/SY5pCY+HHJQattTkOcbNj7GEZ70QAsX+lY0hvM5HAV08X9E15gKtlrdf
 UqXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdnPbP+CHovfRPAhH/6/vKJYPn/KizfkhO4zcuelxuaHI09VEkIH4Q5LJqIvWQWKCz+y2DSLh7F1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5pjBCfrfSyiqAXnZfXZJuEgOneUPdkx+TkVcx4qNDRHR7jM2/
 BKI7oC+U8c3pfkHG9p2rHlwS9lo+aPHmNu/gssuotgG4cQA9LlmkKWBbHDP3fIZhGbpVRrm8X7S
 YJHtdSixNnd/kyjzm7+FUENf2DwU+WgCdxOoJPsUK8N+0mtfmlsr0uwMrKqU+vWY3Xb4MwfU=
X-Gm-Gg: ASbGncthMnRetg/lWwJFgxRRlga9eK0HmjAi54w+LjBiNhEe3WwARoTZVWYlpGQnKgO
 mYGHeG1pcT+Vwbnuzxycflpe7e/S1f+j85g3KmbkSF4UjrcWDfaCMuom2H8m91VU+v6V36Ehy4b
 bzjctLMX/5XQdkjWt0USPdMiDE01V5MRrdj6bbgyeIY3frBSH4AZS54JySz9WsD5ujXIXAGnTMJ
 j/fB61rm+TkC6gyBbKiqOMwVHicHksi4D+AHQnG2mmqc2NQDFscCF2xDmWcGmZwLz604DewSEXi
 1V7uL8zs+n+d8fMYC3ZK4TGnZ/VC7D+ZI0cr9ql3cM0m1e/ZD3Bba5GVNSU3GC+Lg8rd8Ixyevf
 EDlceDOhVYq3O8XgQI4jZE4KD
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-242c21fd174mr54617575ad.30.1754699737431; 
 Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKDv8apsZallq/K7ay2tvwcFTR/tP3fr5zCSv6TlMV9b4Q5I+msieWi+8RSFY9p8c2K/WIFg==
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-242c21fd174mr54617295ad.30.1754699737061; 
 Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:36 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:13 -0700
Subject: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1021;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=dlkqBGODh3j3sXW+PUd6RTyGAht6wmJhJ9vt60MBI2Q=;
 b=ijI/+bZvfr7WaBEdK9j7OTWq9Mt0uUE/lrcNkpvprQoAvNK6hxioFg/i7npV3sgZFasfJwhTe
 2rPCFARIkY5DEARh6P00mQa7MQ5/83Lu2BVkZld78HPNmiSTf2FE6Qy
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689697da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jiMY0BZLP9KyD5qzzL8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gQwFEPiIa1dtPMQ7VdMJQCRjrCEiiISM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfXwx6x2WHU2wFW
 cAmDk+sCwup4S+uYmWvFwMqwDCtElrEwxPfz/7mpG0H1gvyNa9+dllfTw3hkKAchGYmclgMNfb3
 WGeV8DRDH9AvmdenT0MZhDA+xFlxNjvU5oCJP9TBfRxJHpvhGm0E9lXWN/GCqb8bcvdehV1vu3e
 Rc8Z/8ohx2eWNFvpQpKmkJZrPEbMdmOUbNou9VIT6NZoOZk5ucxyuS9uy4qc34JdRlHYtxsLa+j
 fX/aVhSk1VkOTtni8g45GuzKa1qA20DyjtxKPvCXOx2Q6hsPZtqWVrEmcesGggc/tKHuLW8KElJ
 LWnMAz41T1QwCciyAjaVjzGfOdWg9Qo4Zl9+CDB631hYcEScwmUru99o1Nu1a2BIZrkKtN5rrZ8
 JKeox2ER
X-Proofpoint-ORIG-GUID: gQwFEPiIa1dtPMQ7VdMJQCRjrCEiiISM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046
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

The HPD state status is the last 3 bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..b851efc132ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -69,7 +69,7 @@
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
 #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.50.1

