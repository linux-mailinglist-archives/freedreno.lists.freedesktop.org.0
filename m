Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D024B41C35
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 12:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAACF10E738;
	Wed,  3 Sep 2025 10:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/QqQPoo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107410E738
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 10:51:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AFHUH032203
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=F+ziFaz1rWekejWHwi36zb
 4EESMqmllljwggK91XpZk=; b=K/QqQPoo6L7LM1H6nl8lMTFZWvW6xzWSowgy/m
 NWbxamH9dcdq2ooC1kOE3oS09KoVnmSj/SpvlK7onzrWGGiLnwQ4h85yolOeP1p7
 wy38SLbirlYzY5+UlZaRsjuC9Epc59RncWQQQQi0xZ3ClL43tLqmx8Jsjvf8Yg0T
 oxaLOJksjUkQtdrAD53hawoCKsEYfFgjIAvPpQ9PfWd9Q019mMgYsy4ORy5Mg+oF
 6+IIYchejXUxxGDvbX+RjyR1r63WpWsL8pmWcDFZ/UIex893hMDN087UhGgboaPv
 bGRNooMxwvPLcG+PIr7YF/s492pa36Lb/Q4LPvnMjIeIQ7ZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ua1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 10:51:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3349c2c38so74547631cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 03:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896713; x=1757501513;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+ziFaz1rWekejWHwi36zb4EESMqmllljwggK91XpZk=;
 b=hICOG2OV2Ja2k3kP0Fmivj2lTNGpUf1BYNoMoHOnfZeroBMSdmuUf/P869ag+x7pL3
 OtRLBdqtN5OmsrkzeT2PEnR6t8RpkIQ8MfPU5brz5JK4e2AFcCIkFoDlGCdcNLWbTjqV
 3oa9z8mEQtG2YulaqL5Ct3AH+Pzx2OHAHq17mb52tAaAAgwI4Q4hA55lUPbM2/DzwAAR
 Xfhy4sCsgUm8WIRYYWInGyk9KY3XlYiJqDvQfuMCuzYiIcp/42AssNhobEHhhPaWJX7K
 7RjMBKwIeVXRxdipMCyjGY8XfdiX2pI76Jw2ghKMt223N4ArXnnWd1bT2S1XyS0K2lIO
 9rsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm6Un2F/3x04WD63tiKTpNunjPsiT8t7tqxJBFDCm1yUf1c751qhzzoeTQPLja9ec8evCgGC5o7a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEWPEyh+G1V1bBPWLqIieSZ3csf57Ly7xfQOpF5eJuzCg6BZ6e
 NxuwXUwPnOVgQV7D4N0LqoG4Bhp9+gZyaOh/CFhPrnYX0TD5nOryjCytS3kQ9BkjM38N/q/ywIM
 8AtL+5jN7/cllxDQaIU3UWHC71kai2YIvFQ27VCYIh8N898M/yyvpgIv+501aLfPBeipWU5E=
X-Gm-Gg: ASbGncu5z94e1edspTcILJ6MqOm101RiHJ2yl4zhfmdw1vsdjQVofeutpkoFRwGNp5H
 Hl4ttK0pl592bcgWLAke/Ep14SlHEWYc1H+feW6cIDs9N05se7ZyEazpyDAx1e4/dNPGUp+1X2E
 IyzTFWtuHyPs6R2s8CBsrb2Fllhh+UGcU8iEjl4kHOtJ9EsyzMZlUcOe3uDdEsTSAW+uJVepbcG
 KToLU5zROe5/dfiKnPqbPG1sOvH31wXKrQJPP8VtGAZlVg08ELGmH2Yoav+opTw1aMJf2ngBaBG
 sqKNj66GeLT+ssYjL/AUV6KOh+SZReN+rPvHuqaF5vTr6PMXelg/dm7zqUkTJnf1+/WgT6RqBVK
 9czSZIWICu1/c9Qr7UCyyNBWrIfO0x2JfR01uxRKRykJfuHqYqev+
X-Received: by 2002:ad4:5c64:0:b0:70d:f0ff:342d with SMTP id
 6a1803df08f44-70fac6f6f89mr193125556d6.14.1756896712957; 
 Wed, 03 Sep 2025 03:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oE8bnboYguqZQN5BC61OgK8HvWDhBjVq/4qLeNHb+8IGeU7beHO5wd+DfDZC2hphZGhD1w==
X-Received: by 2002:ad4:5c64:0:b0:70d:f0ff:342d with SMTP id
 6a1803df08f44-70fac6f6f89mr193125256d6.14.1756896712477; 
 Wed, 03 Sep 2025 03:51:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: drm_gpuvm leftovers
Date: Wed, 03 Sep 2025 13:51:48 +0300
Message-Id: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQduGgC/3WMwQ6CMBBEf4Xs2SVtEaue/A/DodZVNrEtdoVoC
 P9u5e5lkjeTeTMIZSaBYzVDpomFUyxgNhX43sU7IV8Lg1GmVVbtMEjAmJBTCCN63RptnCLrPJT
 LkOnG71V37gr3LK+UP6t90r/2j2jSqPBAe2O3l0b5pjklkfo5uocve10CumVZvkY5GkyvAAAA
X-Change-ID: 20250706-msm-no-iommu-c15212a0e7ac
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MGkvf+l4O5VdeZJFhXd2WuETJysbLK+DKxuiTwq85l0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GGf4Kjd/cIzyu2pmb5W+K/wasDzXjueuus
 0DbJBvZJhiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1Zf9B/4itJZUTUpMWZDvWYi472LehjoEDKy3UneWue7O5f7Zfm7RDZs5oxtf3Wj03s68j8NEQwa
 v9OUPdMfPoYgtAm6xBFequpK8wf2/245nwazaNap52oTK6VzEX+ZnPEw/35X0sxbtGT/NnRPS2L
 gOKsW97YLTzQXR0QfHuf7N3VAu7VZO8rGnrMI25+jl0EUayRrjqHyixPILRKma9KCWIrLXQH/bj
 5Ee8FO0fo7FznKRIhTQvvdV08/PldL8nSl9FMVQYnrq0EOvE7YYJt2GLX99OfHn+HbgpirXkTOL
 TS8CqbH811gqAirhiJz3gS+VL1imXzrRvFXHMpB6X0P71/NF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eaPjPyOof3SXOZHGhJOqll75zmdnhH_R
X-Proofpoint-GUID: eaPjPyOof3SXOZHGhJOqll75zmdnhH_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX48FwxYUZ9Vrw
 +Tj5Wl0ll831trb70xch5LJEOkcMyXxUF59a60iBCBKhqjxHHTMmZr3UJmiNUH04wphZpYp7GoS
 Uiixnnj10grnH8EftManhRmvnXROm9BvHm6aykDxsSrq5prck6SeczXBl/PR78dxTRrS6VadrGP
 dr0ruJaaOo79joe+H5DkHL+S9WfZtHap1rG8hsgc7DX3Dwhalkqt36FixV/QChNmEHZkeAXXL+y
 unSQ1n7WGsgsMYqSJa4wcMKorQLupIMP8FaQqPWlDR6DJMRi4l+vrcS3AzZw8gODDbTv+k/TYrp
 /rfwD9SNRS7rd5LSvnMmzX/QS35OUEOHMQk606eJZSXCNvszeEj0lv5O5lMdTnVo0psg3JWkciI
 dGnRy514
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b81dc9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fyJ_PAsbgmF_WMsuyW8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

After switching to drm_gpuvm, the IOMMU becomes a requirement even for
KMS-only devices (e.g. allocating a buffer for DSI commands now also
requires the IOMMU / GPUVM). Disallow non-IOMMU configurations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Corrected error messages (Konrad)
- Changed msm_kms_init_vm() to take mdss_dev an argument (Rob)
- Made msm_iommu_new() / msm_iommu_disp_new() / msm_iommu_gpu_new() fail
  instead of returning NULL if there is no IOMMU
- Link to v1: https://lore.kernel.org/r/20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm: don't return NULL from msm_iommu_new()
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |  4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h            |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c          |  6 +++---
 drivers/gpu/drm/msm/msm_kms.c            | 14 ++++++--------
 8 files changed, 18 insertions(+), 41 deletions(-)
---
base-commit: 3cf6147f2b51a569761e1ef010efbd891e3a3a15
change-id: 20250706-msm-no-iommu-c15212a0e7ac

Best regards,
-- 
With best wishes
Dmitry

