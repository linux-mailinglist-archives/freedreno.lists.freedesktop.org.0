Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA80A9A7FB
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9696610E7AE;
	Thu, 24 Apr 2025 09:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU1fROQD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE85110E7A4
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9rX011359
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=; b=lU1fROQD7IA0YtY/
 PVDZZzpgrSfPXrqoOmJjOkMNPX+2GY2ZmoSFjgXQOJFQccsA+BmgvevLw6CXBBjY
 gXmjkhU8yzf+wjBGwBPYz4l+HwbiYmy+5XX3YxLCU1DPX0C+HLkR+dl3LnLR7NZ4
 plxlDKkECNxT02/qaU9Uyx6GR2EebEv1Hneo6Fw+JjGAiYDJ4kN31BBB7GyA3X97
 qMdDCLdF2nDUy+POGik2xnSzrrtMGt40K9MviT/ZmdzC3KBBrHl9YRAkhA+lygo6
 0nyIJzVhVIEe3UUD98inH6VbViEue9nV22GaJoru1lyoMd5bpxtSv13lNx75gQ06
 /5J2yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh250hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f2c9e1f207so13907146d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487077; x=1746091877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=;
 b=ipoe1JDz/JiwIMMvj2a/m6aWAdDuModJr33OHRUbUpEIb14b+JSOKWm/0ZzayZaRwj
 JX0BmTH83yWQcUcfu+SD8muZCCMmrhxVXzYK5N6S/0txHjL/PTTIAbSMaMrsxViBgG6w
 4mI3gBSeDq6LJTNb82ZvcVMUEMrX5GU8mVlrL1yx8VRMqgeRZTjJH6ngQtMtUj88757+
 SKykRm9+EoNaodGNH1czWANjpKP8DK8QjKJ2aYE6Fo4TzVGY6Z7RXY5VNTUM+SzPNeUN
 WUfbQyPiaLfFSL8XypOD4ihdXXBZeT/ra8xhbvKOtqZlnpJRWv5T9+fd06f+sXMloD6R
 AbQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJIjiR1Zmz/TWqC5uwHFwTM8W+jOrpeuVUICI9IFk4XULsO0QnrCNhLeYMs2cx6STdjJjpctr9K/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRVFne0ttZk6uY44bEaTVYL8PiDSe9bUnj0KD4ziudAEqkh9RD
 n1ZWrLW3hPRtivTci9OBeg5VI4qrArsgKKMZIrHgLrxQm0KeG8V9GlK4Y71rlcLnc/VPKo3dFE4
 MFBEr2MhygPlFhDeLiU64anRkEWL24b8aUSuHvqiM1REEimXPxKceNkkfDWfakPiyrnY=
X-Gm-Gg: ASbGncsVuxIlmoEfqiZMU1P/U1+pTwugWZ8WfgdC26ZO/E/lL/fwogfKc4acZewxaBw
 1jzLCGsgSFJRoaBrtzhtr84RNqICrlS1CfjUYhnwY071fMoLp0nFlbwOY9K5ZnpvUkzRYPZA2Ed
 90mxljPbICgkBhJeBa5Mlyh8HcpLfJWeNicN2+L0Bz69JlH+IQ0X4dRv+h5vunVSwdyDpnloZOX
 i77ndRqioapMiIeNKUcEzUIgXHJMURVYsfLmByDOX0aSrhzN+yWJxAzSsc4rbSRct/ivJMOBO5Y
 xCcz9vRBubnE8h1skgv9vO65Uml6AZgIvsAc2BKpwQCwg0tjLr/vDTboFcQukqgQZEi02uBx0cj
 ScfHPlpJFLeWcFMhb7R9jtTs4
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id
 6a1803df08f44-6f4bfbcff8cmr27765586d6.13.1745487076952; 
 Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1W5a+5gc6B7AlIvLZnfYHMfxB9iNdzMWs0zrgULP7xrYOYblEfMRe+GXwsC4GjPCz78vlVQ==
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id
 6a1803df08f44-6f4bfbcff8cmr27765316d6.13.1745487076645; 
 Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:31 +0300
Subject: [PATCH v3 27/33] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-27-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwjwuCAQPtAtKCggMXBPwUBGbkT7v7GHf+a
 Z9r2u+vdYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1YWgCACFeezcUqdWJOjr5b9efrq41SoCRN+Gl3gbB3ibrA7vRHOKAhyutBCN0y/vk2IOE2GRDzC
 qkud11KikADnf22r+/abp0uHrRWrLvISbb9aHl3QLsy79fH2HgN1kxYqhLpvx/udJTnqARkyAmW
 sJXnmAKArZllViW/LmxbDDJFHNy3GwT4PXvanCV5a05EQDmPu8ArtgpagqAauykLpJbhnKTtt3m
 3AsKQj6T5dpauSOMmC03gTNpc2gXuzi2r02mPVECpfz9hnsvbGvpf8yOJkIBqJlbR/BNRoeEsgf
 SohlW13/BA3b04T0rthak5t+q76AbJ6J0jhPZCcKytBiuQHE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a04e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bgIfw265xin5Y8CjucJoqKEy-_3taNQ1
X-Proofpoint-ORIG-GUID: bgIfw265xin5Y8CjucJoqKEy-_3taNQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXwHIHLanUoEX2
 prc1tqYkgb2nV8YmIDMpLg0Z6sdrXqCl8NPDagtNtMIWFEj7ts45/BZXbhdDuoO+1z86yUPSHuJ
 IqGgddP34xXY4mXE2w4ZMpAPuG4sA+bWcFA2ETFvAmNTCGULydbJkYbn5fAWBSHipMNYnI/4cpL
 +Jw8ihu/j+UqyFXZTPuiRap53Vr/aA608/vZg/KT+sTt4PK00lMnOpzCkpyky1itCfi2Rn5KQXA
 iEyyQ4nkPlY5Duel472h26SrxgG6slZZrmZzezVMJlOx+j0gcSjnhy0sNtuL2274GC+ujdo2/IK
 8m09Kv/i7cDWgPBmWrmDxNCOpzUFp8JwDEj6YSNmQKe1B5v/75QmRlfW+5vGorPg1C0g2xRkOvP
 0qdF5a65ZG4TavVbPMBrEfwsHf4pMPjBvJfMiEHnQsFaJSs3b4yd6BByl8rhPzmMX6OTkLxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=743
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01763e0bf1359527b0c441ca36b27264dad636c0..4b6af58429361c49b71f6067dce8ca1daa6493fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

