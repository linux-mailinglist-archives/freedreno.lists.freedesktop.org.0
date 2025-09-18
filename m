Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B4B82CDE
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 05:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA41510E32A;
	Thu, 18 Sep 2025 03:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqnvnRXl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3110E32A
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGTeIh010735
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=; b=VqnvnRXlP6KvEO+S
 vWs5UjO9/qWSjXicrJPqWCIaTDXvc0wkf0cTG3PrHUVU8XjAb+9GYh8BSHI0QXZp
 8Tc1387V3r+kexpJvziCkqxIC3TfUwSKEgmPBYdhzvWHhdJpbffRpsJfdrm+gdFO
 6aheDDAJK4WdKZisnjsnhMe3034vxDTeGj7f0khE/cZwV5v6hGene++vu4Ikp7U/
 fSmjgm5PuJVX5Yt/kmgA7oq8u3sa07abNGfPSUv7b6bY4fj/YuXqnzUdL+V7B2n/
 hf61GQ1UxdjTyi5WqbEdZvvU2bE4+bzYkG/kKapICujal32/Wte/xT9+7n6yLYlj
 ZFG2jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxvsw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso8554036d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167478; x=1758772278;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=;
 b=fq40rPkzmDwB+8nSKungwdV5YX941zuPycGXfo0eEh1qatm+gdP/vo7QpsObeR84xe
 V9VI/9dlQNUVvk9Dl5Rt2DVdRjCbVQddkV9UsbmCZbkno+aONZo4EXznnbeTlJiGfGzq
 sXBvSJT9gyd5aZRWVrF4iNWoL5k3Otv19r1rHFiONl49Y8VI1eQLuJiO6QhwhT55HINS
 HKuLkX2YDfsfm8t/5s6pEwGfflm0q6MbhnDID8IC9bTgNEpJVtcZ8+NJAjQdRuWkcRT3
 Kk8JhRm45TcPCfutpPgjwCOrYuwvfBYRpbwB17Z+/mrXnNt3Rsf+PfyxvUKhMdkqt8je
 +gaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1RQP2nPk1gAAOoK+eRNY4PMNTYKeQ4jnfUvafw1v2cmqvivv4WWeO3Ft/HDu3DMJNCaTA89JEZTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtg8PoXfXPeL4XwThYezuSkSQ7PCZ9+0G4F9ti9vOpCHTBMraV
 s6F5YbdGq3HL0H/z7pvbN+0tHuPJfSC5tSd+7FUJnYL/6sxJT3Euy99Fqhfawd9+Lxh1HJTVgTK
 +JgFAkfiynPsE8ZPgsipis48+gj0j2mPrdTJbeNmhpNYUieHItBwkPsYItyFvsQpORv5fmSI=
X-Gm-Gg: ASbGnctftC0a6/3PqkaH6YgnfjqUR8byQmItL908cXlfPVvxRSOY4pmVlnJN2eF9jNL
 0JgQNPWxEz9MxooREzO8PyXw3aE9zMWPS0m958n7DxRgjVyMWM6ioIM4n15tvc0OiH0hTayDYxn
 qit6WssKSZgFfrIeIU4cn8K0sctC7jdaMbeCAwBsfH3jnWnppPpV4/Iw1R3W5I7pd552AAq4agt
 Jcml1vYfR6QmKkt3aBDIFl29GHoogdu0jUtGXbxMl9vUvRlk3Lc+KWX8Kz4IP4j4hL3YwzFjtdg
 6oFxnAFbUfozXxv69dvEFaIAJu/4Gxs4jUlkboR+85nu0ICpWpe78+X43msn2Xx7AkQueuMC1lk
 FeSld6V4Qmvcz+CPannrN7iGEZCapLhIpo559ZG/d4Yy5E2+LHuUz
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id
 6a1803df08f44-78ecef1ae02mr47255016d6.48.1758167478148; 
 Wed, 17 Sep 2025 20:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSx6ImXWka4qzu25nsGIPKG3jxYLOXD5VmYgqTlB6n69eBvtJTy4miHF7fghHQwXJ6uEWe3g==
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id
 6a1803df08f44-78ecef1ae02mr47254786d6.48.1758167477633; 
 Wed, 17 Sep 2025 20:51:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:22 +0300
Subject: [PATCH v5 1/5] drm/msm: correct separate_gpu_kms description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-1-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4Gth5pDDKZjVIenXb81Ygke05JopoBwjyJK1
 zEuck0IZpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1WQkB/4lg9tvQI4us/U5LqqNXJTGG36WkG5XJKtFnQcWFkKRzDRqk1ZNk4h9Mb3mPueYFIhsp8V
 BbzTyeamtCaqZ04D1qJMYL5eJwlgY4uL1spsdfLVR6Gi0qlqlEMDNidNoU4Dag9RWFOKia0N/Js
 Gr9EHf6lYOvHRjIiG1Hv8bT5u51c+GuTWMq9/QvZeSdizjJTeUSf87xvUG1VXyuLJALiOctg4RO
 okIthfyiGYNZm2Zl7TuRexJqoWjBn42AfFrtxnWDa4axY7m4DH+OLxrGjfVcNH6YSRarKwHvcKd
 ulw8+OVYkJs/GR3EXnuymyTQIpbFggCf3XuZO67duHMS3ilD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9uKcEGJRtsfk
 0e1UYCNF0OyTF/tmvf3kRBqaB8MxL/5Wg6EBCPsoARbrSDEKhmNTH9H3igPeugrD/Q3pblTBoox
 GRmDSaVlmm46nsoAhoqqzEnBk+8DbtNmWKQkQKLRagVvZ0V1TU0xJD6uLPWMb5E7ByUxp+lHYNR
 1dwZnfb62Can0kR0eahfOqTvFxYQvOqBgY91o3j3mzIG4vKxPweamiJB0szWQmXyrk+d0cnCZtj
 HXeldXrWM1vyadj4Ksj5Rm3ykx/oRqv1G/7HkPmejEX5BdKeYtqX/h44gk2eskPJR+0oKUkHEdu
 OuzAgz9pCLJsV/35OlfdgUS6yhPyo6c8ro4VafxRKMvlWZjnYrO9Af+KN/+xylhP29T5gAFarPO
 ak+XiTJY
X-Proofpoint-ORIG-GUID: IPSdZoLEDb0ypigtXu0UG4Y3kZLo9iUo
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cb81b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NR_zzOBYvoclL3rq_QoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IPSdZoLEDb0ypigtXu0UG4Y3kZLo9iUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

While applying commit 217ed15bd399 ("drm/msm: enable separate binding of
GPU and display devices") the module param was renamed from
separate_gpu_drm to separate_gpu_kms. However param name inside
MODULE_PARAM_DESC wasn't updated to reflect the new name.

Update MODULE_PARAM_DESC to use current name for the module param.

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100792394dccf59097a01c2b2556608..06ab78e1a2c583352c08a62e6cf250bacde9b75b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disab
 module_param(modeset, bool, 0600);
 
 static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);

-- 
2.47.3

