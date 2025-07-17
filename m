Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EAB09045
	for <lists+freedreno@lfdr.de>; Thu, 17 Jul 2025 17:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AF10E83F;
	Thu, 17 Jul 2025 15:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8AscNDs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628EB10E242
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCcrLP021792
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ012
 2DRYZs8s=; b=G8AscNDsDktygSubSOSuuClEkViZ1voMSYdMFDhtdunPUR0EhvL
 v6b7c56Wiz2NOApId5/ok6ytPHNU392+vJ2g1mK9liSAvtsGTWHRrE9KL7DzDb2t
 /y08LE+AWiaJ/4HgY6+EjIRlfoBOSoO32iT403u9egb807ythASsuylRFeX3XNRv
 AmYy8llaKMTWLMnFEMsmwyxRyykTbtdARDkcmryxwZfYnevrkYkhzSZOiUWDsAb5
 G9gCoi0VuZ+DFb5VSMi/I5cwvZlmN4POT9bdcIkuoubQhCyx+VV4J1EEhERhUojz
 G+Okan//1h0laG764Evx4GavBX4xhqIwFEw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8g0jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748e6457567so1416545b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 08:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752765127; x=1753369927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ0122DRYZs8s=;
 b=oriEfxVfcWi8zBF+QQKoiQl6i2JkUgnYnlJC4HmsRF/DGEj92aoPM/bEPwtfqYXhdl
 2d/ojMHw6tCpF/3IVXar5jRz6AepFtSburmmeZjISKnsRXWBTJjgTCWU8kjBmPEUQSYW
 ku4sr1XL+XKkbz28q8b+Z9/Vlv658VAe1jRhBZMNIyFHsmXxGEVMGmzUSfpF08MfVEkP
 38eRJZRGlcXnt1CX1kPreO+vpE+rNOzOdMcYffCqfw1I45AMCg60SOduPwzOAIen8RqS
 RGaV2B0j+JKzGpKM/okG6kC8diqKDpMGHuo5x3t5clAOabArvPXDypMgXV5RgXOAVwxE
 pM6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLTvViOombFl3hdDAFrUv2g823+JTt4qbDBSlI8/dXfPgJ2KyKbzLuXOC/pqS3rZnjIFl5jArFXMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIwBAZxCzgTHQfT3XSMitEu5y5p1i1rs5pqs5wQF35p0wjCb34
 rwVQ9VfuSbDw5eGB4pjUVllkFebHpIVcM6hpXhM//Er/IgLHGqTNfIuneCzcaXPU4nn8LDYjBka
 fKtO6DwtUX2MFblo55OI1aZin7M6GR2M1rpSuy+oyqRrKdUMehu+63csxhIwZns9oITiWOxw=
X-Gm-Gg: ASbGncuZKPKuNQ5iLzjospH5VH99MwRAjN35hdoHHRUHypIfpi1Xx6FHnR3+UXCXbXi
 /Xz2Fe7KgMqJreIWT38KrVfrPBSH3jJ2rR895ci8/Y0ECoNAHeY7hoW458o1bju2vZ/thAXwYHS
 MVTHCDbi7NVyrV+hqQGTP2uhRMkqikkZb6w3UbNNSLXrmVv8WpL+02bbSvPCxIwifs69hjE6G9P
 /BHCFwHjX2VYzL6rANoUBaoMZq14dy2GVXDcz+gUuM7V4pBPZJHt6a6+uqdd1ZL2rWoJURepYYq
 TD3aQZPzWJRIXeKqeG4K8USGVmsUBH8EN6ItsrQvXjZCmtKDpW4=
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id
 adf61e73a8af0-2390c744e99mr5905547637.1.1752765127007; 
 Thu, 17 Jul 2025 08:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTO8+Xo0qyZNjecPdyEQ1E7S+g3tlFLsy6r4ztKGL0EU33rzpzcW1a1wjSpktmiADaNdA2KQ==
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id
 adf61e73a8af0-2390c744e99mr5905493637.1.1752765126508; 
 Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5d3esm16293073b3a.4.2025.07.17.08.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Drop unneeded NULL check
Date: Thu, 17 Jul 2025 08:12:01 -0700
Message-ID: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzMyBTYWx0ZWRfX+KZ9K6RPx3W2
 RzVvj/BN3oNEO7/CYOYfHCiwLU56FtvnA0iG83Cs3w1z3jSpadV/io+S7LZGOIUOm3xnKzTGlq7
 lBJrzRsXy4g8C9Hlj80z1fxmPYAOBM92yLpaA/Pb0xBXuNhZsF39WJOmY3UZ3ZP1g6+cs6bD352
 mRRd0hjVSYHicfjVsLQyrT/sDCMlaJIv500zglIYdcZU5X6OqCSGHr38IZIflMLcbou4+kERHzD
 Xf21xCRlvG9YCkr0yD+JKgDZJ/j4+iUTQu/GZBdgK2Es6xYMtc5NckryqtIhi523XW34QOycALC
 eTKHwyZvDxSz+Cro4oAcuN9vy3ciLC8T8hg4fRuw4xJIag7K+9i6lY+x1TQXEBiF97noMjj0QxC
 gJ/nW4UOFEYqHkMBrmSVUjJXsf/kxRvDMZyDhFR/jWHewIvLxMSBDWEJ7iV03q1ifga6AS2L
X-Proofpoint-ORIG-GUID: yMNHJr3hDmspOHMBzXyg0UrlMNLFLTEY
X-Proofpoint-GUID: yMNHJr3hDmspOHMBzXyg0UrlMNLFLTEY
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687912c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170133
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

This is always set in msm_gpu_init(), and can never be NULL.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 55c29f49b788..cefa50192391 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -768,7 +768,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
-	if (adreno_smmu && adreno_smmu->cookie) {
+	if (adreno_smmu->cookie) {
 		const struct io_pgtable_cfg *cfg =
 			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
 		size_t tblsz = get_tblsz(cfg);
-- 
2.50.1

