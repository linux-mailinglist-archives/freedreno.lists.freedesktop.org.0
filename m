Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F9A9D23C
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26610E9BB;
	Fri, 25 Apr 2025 19:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6HDHb//";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E1310E9BF
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrWH004665
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=; b=p6HDHb//EDvbSBVq
 I/hqYpHGoi4XV16zcHF0dkOf8oBmrCR8aY4cuFu2lLzAxlTEwhR6JxKDmafxmyuU
 EhamlzLPBOxGa6/jVkUL3bTFUtL33R9CeeaEHF+jvw/uHLh2xkLoUEZiukONUNtx
 Vh4LOyPtY7mVIYaKCUZ2wEliV++DrgKRqcM10EJOAmdNvLtm20S57x4YtePIFAcq
 e9+/FzOhPMRuHZoSqvImQIgRo27qf7mMqTlDkoG5rrYes0X7AFv553+Ll/FqeGN5
 2rCLWjoe4UZ15QDsFKMy20Q16cFjAlw2+f/iMwQE3916qHWTMSgCAGkTcWLPtPgZ
 WSS6RA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a5uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e91d8a7165so46859636d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610559; x=1746215359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=;
 b=SH0sjGxt5nBn/Aj6T2/bR+8ZNxec/U3BpTnFqVh2DBKXDHrbWZJTUu4w5lZfBuPcM/
 d8tQNqqjlYTzIcXtSHXjbDDgu1ULCFzBMNj0jYcceNOFj66tLD74yMBBKpLoZHUQQ1ac
 X4cQfCsua1cGOy7Pohj3jWVjscOHy+NebAbg+d64WpnnwgnQfeHIL6Pnp5GcWCmQZphU
 1btekFwoL4TLwXH7fPekZ+0QlTv/xA9zD+N0TPYRN9XHj7FwMP3cq3cCJTgbSnQ+8Ie6
 ABp7INe+Tu+C9M11RvBSKqy0FXRMr5zMoAO1SR+fgLvoJzyZjmCc9ThODi01+HEYHByH
 MvMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViyLOdWECKfLAhVywA/Ug41cDJVuDMGscpMwR5+IZN8pjHYas1s0EV2xkh8U4qZMPDxJ6H8nf+djY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxduckqKwBBeo2CcfylN1yiHrA4VjpIi8DaDmMoPLlu8oaUOGpw
 pvO+e5iG8bYAH0TMCKSgjhCASs/Uy/iMiTkBXJuCnP7bEhpN8ewJ7VFuLEQsHJ8nF3WWgHLiU6M
 IOeqmUKdpFbMMS72pJ2rSUZCwEv8N7IePH7vKDfiIw8cmG+POyBimhFkqW03Qq4YRFnU=
X-Gm-Gg: ASbGncvpiXcPip7mVk1qAvJ9g3TvCREGwszHXLCngWvRRNnzafVL7FsgJ1NZkPyQJCa
 75bPyrNRZAjgvqaCOs1KTszRGAa9Wag4kLID5qWUgOUjOpRxvTdj0wruaxJ54njb5Cmeq+GShkR
 rB/ChPGFvQzlpHli11vg/vXY9R4aQ8NQvSh2SD5IFqoHT7HOCZC0/VlXu1Cl/rMUWDqtjCPtUdi
 En7ZRtb7TXaVwf53jqFY2/WhQffwRS4CgNjdRVKvSEtd7lLb+0wl0aykarDYoIE5f+WgrrnyPyX
 kWYFjMB4IQpFDlqbLoketboMzzXhEYHFfH7xBOZAPQqQM2oza5KuppW246OR9i37+EtmeLwOTov
 3zrT/mDCN3Hba3bevpQSOu0Xz
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id
 6a1803df08f44-6f4cba51be4mr69387686d6.35.1745610559111; 
 Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqo8lIulG0dOvKsgER6OtZ+TgO9vrJCPId0DQSeGksp2OqiP+WfRkkD63nepXAm0dyxJWWzQ==
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id
 6a1803df08f44-6f4cba51be4mr69387276d6.35.1745610558751; 
 Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:11 +0300
Subject: [PATCH v2 4/5] drm/msm/dpu: enable SmartDMA on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-4-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNmRnyT3eow0gzV4hp6sl5gj/DZ/zTj42D8dGvvjRGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2Hv1ovnVDqdxrC5BedSPh5Ro8hHW5+EDoF
 6IEpQ/48xqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1fJLB/9hTRaveuHQ+zTcJi8Ao6BwDCfle6A5QscWvAbkGLF/ddC9p3z0TCVyo6Y0IebU3Arkw5Y
 r+nBzqOPYjEsUzy4k17EESJhUKzSzv/cIStLZbD7NYtR8K/DJJ6DmMWql+aFY4mx6UWGtAYNHik
 rjojGqOrdI047199IGbvXrUBTwO8/jYq5+Nzk+f3rYcTD5S8mM7OojGoL7H1gDjBKY28/yZD7XH
 D7pf7G9/KyALtVxQ9uCNAiNlW5yJ7eJbR167DseFYlYuu+mzZFeYjiegdLRgqq8Xzd/s9GA0r1J
 u7EU7QPzjbch3uZocnb94uXstPIiWfhvs9h6hg6Aj1OCfETp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX3izCVQ/mlRD2
 fdREJvJB9uXFIfHH5DKyaxThPpu29ubcai3fYfI4hTmyHmOfwuQUKd23qZxdAXhN5PVVr8jMktb
 kM/E/nQoE0O+1txijBcmz0ytj/nWgUJiZLrHuCVukdfqLpOP0MG5R43RXnJxHWeFxbyvll13V6A
 zrao2vLIXV+kNjg6cnnpOo5ShthtAvYWa+AYlS92EyQdXbM7m0HoBGprTk9z4oV9D1rMlEZZHI5
 s9m5syJVH1pjDDhc47BpI+oLmrmJ5tIl/4JJu3SWbwi+G87Odxk5byY10jQsjY3Vyd6huguMYJq
 x4g5HWyGeh4kfcKzOtAcffqBEdw49neddn5CRg7frPqrELk740JWNbIJKN4RqkOcFAs+gOL43yb
 OVA8oQxunryrxb18tqHYQvri8YOLDjWm/hZgHjtwaRFUa7Dsjb7hvyf7/CiKYbdrDGvTYSSR
X-Proofpoint-GUID: qP2utNoKzoOH1_sAt2NsPnC1HupSmSQF
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be73f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kVj8X6nmCGut3nRlWRwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qP2utNoKzoOH1_sAt2NsPnC1HupSmSQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=837 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

In order to support more versatile configuration of the display pipes on
SM8550, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6ba8e3d3d2691534f0981f222fa27..1a156d2b714ffa6c16b2ae331704c1274dc0bbfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -66,70 +66,70 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

