Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B091B34350
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313310E4D2;
	Mon, 25 Aug 2025 14:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bhue0yg5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765B910E4D4
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8I79D021749
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CF1VNUZFWAoTkwVdcq3ZpR3SjUV1mxisKlAEosuGRMI=; b=Bhue0yg5FDRIXFC1
 wPqcZv/YSp/WB76gmJD0u2KYBaIlqhvsXdxjnokaAoRN+xYOLpsmgjypizHBSEZn
 J0d3TBoBPuqncIaHrdxoMts0M7c1/TfUS2PvJrCVMB3YshDS5iocP3h0qjEQnhQD
 BsISUmT5nDv4G8tRcMEyONWeKjdyjfDc0KWQfxsCrhFRR8jiqV3k10FDv+EHkUvD
 UI4JzMDn6H6gL+A+sSreOtiPt2R70EcDuYvTYIa/IWHhmyTnmVhsU6YT4GZcPw5R
 HbO4qXx61xDrtLb6QR457FDDQHde/qlX+abpuPSpzdQaU9TGXnsmJrjR/hgquUWA
 Ji001w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47630f9aa7so3549881a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131580; x=1756736380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CF1VNUZFWAoTkwVdcq3ZpR3SjUV1mxisKlAEosuGRMI=;
 b=KTWD2D12xqg+Q+lGw8IKrnlxOpi5/GFq3Y7o6Z3sRsHaKb3SVMR9rey8bADoJ021kE
 XcPcs/Hrx1fhiKLT/OI2jhNbu/g8itx/GA5A2tbIb54V/3LaHR2xkpsnk3AH22BdYdba
 LkwEj1B/ZUvqK76BXtICUvpXl9SWONfEz8tKEYmXKDL4KjZYh6x/VdGVs/P0JOPsupJl
 WNSha30sOU32MyMXiIShKoU0p1FFcck2kmDa4jw7OVxvOvgywkikj+AvRQgdA/E9zWE7
 CfZDphnYpsZmcuckzZZnh3VQCvPWJIo32SmEvjmI53EmqVkEQ8BGhTC+ZH1ybSXUwgCh
 EFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3qHnY91+MIFK56xtYSLl7jDFSqBf9A9HP00FqYbtgnzZEkmCoAo58GdNH5/K1j0yZm9HsEtajQyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN2B75WSafs4jeZ6m0GcvF++7mnEpbhJaVAQ5OIidCqlbo4g8H
 iol+Q3PZ80rz/4yZsghPXa5q02iiGNPmBCfD4Ahve8W9G9zN1LSYliMC5LSeIkbaM06xcIAlEoP
 UjC+ssmZgWziv3Vmws2/BEIycqXA22pXVl5OvE8DfIKMG+ET12rnwr4lhcSFguGWSppp9xwg=
X-Gm-Gg: ASbGncttm+XGAamrOv2FCjsvPqWv8Px0P52IoVXI7v6Agpccw6aq0uRwxMZAs6H7EP5
 FnjruSZirv61Ud/VoVgrfdDlAzPnzlTQb6f8hG1U+nCIM5ozLhWG6KJv7v2XwjNtJXggkXxKS5D
 JcuJMYQgRGwi6zfSCzCnY773sdi4oI4Dma1bncVmN7u3UcurIhVRAiICYjhxEguwTZNSVtD7x1z
 zkbIXkQQ7ywj3UzZZ1O/Ytrzxyxjq0oB5K/j5B0609r5Y08esB/Cp8jmvJ2ixuSMQFTcsli5d0S
 CJGviXTp4v+kkUgvfLAxTVWm3S7VuqntsEwzmcwAgq+kTk1FNUBfUE2G/uCS7uM/zPbKDrw=
X-Received: by 2002:a05:6a20:a10e:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-24340dc88cemr18191245637.45.1756131580019; 
 Mon, 25 Aug 2025 07:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPAmA6KgMGWrk9NgRt8J2RIgsVMiMidd+39K0LNZbVzR37+jqMhfxfP0sgzD6hGlVlZlnp7g==
X-Received: by 2002:a05:6a20:a10e:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-24340dc88cemr18191190637.45.1756131579394; 
 Mon, 25 Aug 2025 07:19:39 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:22 +0800
Subject: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3583;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=uY2Iv++yN1m/94AgtNBgb5m01vTsGsicz0WYoBHYze0=;
 b=7yeZmvLqu/95G3RjFS9sZCcTWmjF6qHI1lm/pJRJHhLnmxHSYXpzgCI7P7hY0zP6dSheSEsyL
 HbjSfT6HzE4BwEVbOLkw7S5Iw7pEiOG3mPahNG+AH4mt5E0PZdjA6nW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70fd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=73Fxo_05DylMrM8smIAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1hoaRVndkgx7
 irT2YlFP/KmkUWTjpnFIZJ63Vz+Wnmo9OI5AhMgu2li7chLpxvueDbCT5kgyqWRFl0VDSF1wNPW
 OuaEogc/+WLTv6Y7v07bQMHTjBb/KcvkrdxGNysq1xpdxKV0CIPYAZDnPmghL33vEJTnZoDxgxs
 1/2bvDpkgwS4fXViSy7ulMRCJYQ/YwL3GfzkNGJBujO5EsRKGLFpQaBjzzPA5Jfj/wEuLp3Y/Ht
 RdZAbXACmIQmslLJGd5zZGQujH5GFpgBZCI3vPuKCBFioM1Zg1e9JHm5iy+7JBIPzOhcZHe1mCY
 YdkzJI9PtkdGJ1zw1lTL6KZswcOAw2xaXB2Iq/9bS2epVQ+7cDXFrexgrwsKIBzQLSAOFssRv+k
 V/8SgL1I
X-Proofpoint-GUID: Thpp0VEXIgxhTKwDLDNH86yu8cF5ZC0C
X-Proofpoint-ORIG-GUID: Thpp0VEXIgxhTKwDLDNH86yu8cF5ZC0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
controller as the intf_id is unique for each MST stream of each
DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		enum dpu_intf_type type, int enc_type, u32 id)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
+	int controller_id = id >> 16;
+	int stream_id = id & 0x0F;
 
 	if (type == INTF_WB)
 		return NULL;
 
-	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+	if (enc_type == DRM_MODE_ENCODER_DPMST) {
+		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
+		 * example:
+		 * DPU_8_4_0 - DP Controller intf to stream Mapping
+		 *
+		 * +-------------+----------+----------+----------+----------+
+		 * | stream_id   |    0     |    1     |    2     |    3     |
+		 * +-------------+----------+----------+----------+----------+
+		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
+		 * | DP1         | INTF_4   | INTF_8   |          |          |
+		 * +-------------+----------+----------+----------+----------+
+		 *
+		 * DPU_9_2_0 - DP Controller intf to stream Mapping
+		 *
+		 * +-------------+----------+----------+
+		 * | Controller  |    0     |    1     |
+		 * +-------------+----------+----------+
+		 * | DP0         | INTF_0   | INTF_3   |
+		 * | DP1         | INTF_4   | INTF_8   |
+		 * | DP2         | INTF_6   | INTF_7   |
+		 * +-------------+----------+----------+
+		 */
+		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == INTF_DP
+			&& controller_id == catalog->intf[i].controller_id) {
+				if (cnt == stream_id)
+					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+				cnt++;
+			}
+		}
+	} else {
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == type
+			&& catalog->intf[i].controller_id == controller_id) {
+				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
+			}
 		}
 	}
 
@@ -2670,7 +2705,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
 							   disp_info->intf_type,
-							   controller_id);
+							   dpu_enc->base.encoder_type,
+							   controller_id << 16
+							   | disp_info->stream_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.34.1

