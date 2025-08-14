Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBBB25FFA
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276C910E13C;
	Thu, 14 Aug 2025 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGz+aJr3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594310E223
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMM28V020811
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rGGIgrmmsmbimgDt4vADL8
 x+TnC6/clX59aBfoICLGQ=; b=UGz+aJr3XrtRjYKMQREbXjEgg1DI0Nmc0P0vkT
 m9Yf3FFnzBeGb/g437vbmMTJMFs0d4g8NGCkiFxkX5roEnYLhY6VuGwTkjaX8Hph
 sjpiBSr0vwCQ9r5wQIEzM4dlCBktf21na9+Y9tIRm6l7ROZ+Dee8Ihu+CtHSzbST
 Tdcc5BegwboSt+CV5oK66CQLFD1meSSPpzI2rcwGWQXsd0q2x3DfgIOCZavFzdOD
 bSGkndYTdrAM4AhOWeK0jOLwLYReYUTW5wQ32MvOmX8PzzpEvVkJ+bWvwS5/StIQ
 CxgMv5IbzCVxB/YNBTefbr7OPpIZluQwpYufY+o9puMJw9RA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sy9h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:03:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f636685so24096226d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755162236; x=1755767036;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
 b=GhhM7gYCIgMoWwrWBN4EyBXBPmE4rMiDUj7MFOzz1nbO6GJzyoC7foLBqtugKmrNNi
 vsTGLHDLMJ4c4EgVq0RC+o7bTZAJC80ZTeR7pdO91+/TLgenl67KY5c0Q2Z9fozCn2Y0
 0NAyzSqFT98yz4CwS6FwBRuQi2FkTOa3D2cB/m/PZ8KJmAm+Exf1Wi1h8lsfGyEO1Hq2
 ieaIeyxud+wmTMVY282s+R/GyTwjs1Ch587GCN2tM1OzxXvzESDab1Uoi9V8A3w3MlLE
 6Kct+1mHOJBO1kkizvcgPnUare/kPwk5AdRVifbdanWv0nC6vfnV9a9HG1QibG6Mw808
 bvVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxJ8YzT4cDb/17a2Mq3WToWSIuCvoo8vWhr536QwSjiegZfstJkRUDnP61929HmMLa2y+rhWzgw0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBYuUdn2bzp2QfcgmuaHjpSVhTlcUeD+S2bvqO2fFRd3wbag6e
 27RMydrWMHicIFya9U0K87E2NRGjO2kvhKD413/ChZY8KPVDfdelA4CeBzKDAWliKy5Vr0rJNSj
 yc89L7w6biO55TA9r0A2NqRmDbty6OUL19SjzscHnvrPfGH6cY7SE1XHxnBVkkxVwiHcI58s=
X-Gm-Gg: ASbGncvpZsZ48mXMDb3vcui2uRGlQOvVvPLa5kKICd7+YUGV/6O1lpAC6p2xBPa29qS
 h3B8nhLp1FmZPEoajQnh4rRP4m1FQE4FI8okzkShCPJCysNBhfdya8NxAXOEDQFxVU7rULm4LFW
 f+tDrM8fQmj0kGbtOg7Qj2xIXngoiBu+AB5Vr4SzVjShhyZwHByOe4bTZ8OaKdUceaVVNVss7fa
 1+iVSrUJlLbDogBzvcGfl/g+SmSwP5xHXLLlqDz7+u1HQnLJmFqEhZ3Ts9Y8e5bpgmG8wfM8v9z
 plmmsRfU/2oY4HHN+pZJJlfkAwtDu3noYY0XSNg8bcxW22DlibAOjlhZPxFR1nZ+PoXX4mCX8qS
 BFyG08IuUcS5TXg09cE6PmJlXS1igvXXyy4NiguB3rhQzuLuyFMi5
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id
 6a1803df08f44-70ae6d3710emr29798426d6.8.1755162236414; 
 Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1HL/zHxuCTsnkJlePNuWvPNebHmrVkEdAt8etPB1DsMCZbdV+ybwNuWXk1pRpyEqmj4zHw==
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id
 6a1803df08f44-70ae6d3710emr29797866d6.8.1755162235837; 
 Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Thu, 14 Aug 2025 12:03:51 +0300
Message-Id: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHemnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3ZSCUt2i1PL8omzdxJyCjERdAzODtDSzpDRTQwtTJaC2gqLUtMw
 KsJHRsbW1AOj5nThiAAAA
X-Change-ID: 20250814-dpu-rework-alpha-060ff6bf5185
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5pHml9oNbOWl15GmrKptxv7thvICknjHEj
 I5Q/zBSdnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1eYkCACOy0N/ydD63zVefNmO4rL9mm/EAsrC9DOD7tCihUGn5WrYCi1O3wFsMtzA3mlk5ckgJxL
 +vgK8mUH3LyTGJA+O91ZyyBplFNGQwKGSi/KnVC9LLK1fszi11Tw+h36B5nNJQj4FVp7/4AJRdG
 obZxBc0OTGxv+q9fe9tOjdZApd6BKuU9e1YidBSPv9bEhlQurDuqBiBi+aBWS+nAQ6stTkgxcJO
 KVGS6Ry1RlKgEK6+s40NaMtdTbeda1aNmj6yi0x4deum2geO51PLWV04afRFcfAjPK/ZSEI9TDR
 M4EKf/FzT7DcfvcraY8sbz2+eD6kPPGiOZ9Di/3ICMhcHt9r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689da67d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XoDkaeHCiDYGaMSRgogA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0Vw7GxY6_cMbzeu7RwHrLzjOGXNrUaPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX2tl4YK/MyGGO
 r6v0TIapDSr4F1ZjdR5cQkyEUSN/Yusr444L4UT0yy+0/F4xQ17UcR6UC6DtgmBfuzLwHs929N8
 72m8HNf29VAO/a7cAI+KrBsEE5q0hykDKDJCGnc01oNezq81Ap4ZcCmSZY//ZOhiIMAjCoqEnXa
 cCUckzhWmxa9Lay1/prp3yjI3H/QdJrcTqPcnvkg6bd8zzaRf7DopwzRK70z9tvvVGE6XGNDiVs
 +Bu/7CC7/7kj+P357zMvFsewf7wOFAjW+6MGWOT4Kbi8M7B+bBNbCS1xV00oy5STaNUOcMQPJDt
 APVRH7aWyHAtB6HfbY8FhDqIJb309qfC3W/zNBgBEkBkKEYUckqIGeV34i5fHj8aPK2vpj9n6kd
 ixYUWQQt
X-Proofpoint-GUID: 0Vw7GxY6_cMbzeu7RwHrLzjOGXNrUaPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry

