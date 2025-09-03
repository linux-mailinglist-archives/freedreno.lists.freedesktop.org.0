Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21580B41C3A
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 12:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4B510E748;
	Wed,  3 Sep 2025 10:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaIZcbKX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C514E10E748
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 10:51:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AHCXe010164
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=; b=CaIZcbKXWECiS5OQ
 MmeFWv6gFsrU3AVys1QT7S+kvuEomX4yJ5AjI+Tc3p+bVFpcNL4T4JA2zcHeNF/E
 kNorE3Y+kWGNSnDqtq9ena4quKt552GrN5VsM9CJJeBHG2FFJIpHu54dL452NvDh
 LiCh6jBFbCkcNlOa/sDUo35jRwS+TkMT0Wy5vnlsBMM2IMoP3EKtvHJc6MS1uesB
 zXF3YTf7U16yKnRjCAO+Xbczldu1IeA4MxALD9PxEpuXUSTu5h3/YDI/nktyJObt
 MpcvicV7Us+hajupksmw7FhOEcfc/KlKbVoFcWUNBlYpGd29vgDvdCeG+daHJ067
 dmEqaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekfua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 10:51:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7224cb09e84so15629046d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896717; x=1757501517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=;
 b=SCta89Su8EXl1DxRuzwihMYAohYzQY9oEyY/VsfiiQIzIhK2KTjfCP36pcytO/8TVE
 VRJSFvQzPs6RTJuWQaXfkdQjDsqqIucgGRBPuK7ZRYrLBW16ynm/SUMkrTIaMdyDcGiz
 IUbHSc9o0PeFooeRN1NITSGK9n1KCzS/xTDmsTiEtZ1ZXFi073eKDeYMRp+pjXe8hEpV
 KrXKMZuzaXkJtoB3T4C+A5VNayY9aWQABjOaMAvpkHy54X4ANhK9XXBaq6+VKEKPf8hg
 gzYWf5k9oQIDqkGbL/h2hNWaKPcRjmV2IYw+ZDpwYayzxHarBDKZy8zxMVdU5JOYwgAm
 EqHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGz23AO1RgbZ2qzFk/k8Xz55uPChiFBi7ojGI8xyM/ezL3VERO0EyRnl8qiLyeQjyVI8/m41iUeng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVjAUYgvpvkJ6QJ08S9npm4LYN1qy9j4nPwsMWCKq3bs6kzDe7
 sjcNuh0kFicTJJvxtdKxgJgLF7CU+oo9Hz7DjnYlWsY3JUq1t8yijJHLrERv6xvjDac+ocQa6rP
 vCcIpO9v1vzllPv7GucxX1AChYScXZ+HX9euqd6wo4bTMR88JCc8h19F5mMwSp94qVS9/7B8=
X-Gm-Gg: ASbGnctjb29hBl9ogLXjel9PGIuYfh31ndFxOMNxYeYYQ5XO3m3KuMQLhV4aRStOrzL
 uITtOcFGIeq1OlBUwO+mr9pWU4NRTVW5CdAX6VFcxFVcbAsEljvANj49UgiSPy4L3ZFlGRdnqdn
 Jx7JVb4jH2yWT1LcB47stblthbUJLxx9kJ6SROp2ggHbV5P4sIaLyy23jScSCVSc/dRq4UFHQC0
 hpMZLqPAVTIAGHMgxfBehJGoDCYMYFxixgiwq7lXWQq5M9N2S2Rsc2meZmehs0/eT8pDjVl1b0S
 HCHAVXHgAst+VAX5I2y7Bl3L2sjz70cW3AmIN56Pj9OyEE8k6JMN0wgi5pfZF596DOGf3qqQBFh
 ZX9efYCBXqMVet0HFeGs/07j1HuBRLerrtPVfBF+z5ahb6lGsBFl1
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id
 6a1803df08f44-72193da141amr56362726d6.34.1756896716986; 
 Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExVl9GBAf8uXT9a8bpVa29NuOzWFwU6sdfVsGQld/IevSNRhQnIWf4CLWyosX6NvmXF0Tlaw==
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id
 6a1803df08f44-72193da141amr56362476d6.34.1756896716456; 
 Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:50 +0300
Subject: [PATCH v2 2/4] drm/msm: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-2-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VVcVNBxTp77RP3lwxz41p40biwqdBr8Vq4owPjMXldU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GdCx4xIfhZaEHEPNvhz+Nhq0FHAFd+JqVM
 hN82WJGwZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1QDjB/4zbCpsE9Fapn0XIU3XUXuutlBGlGPfODt0yYr1IF7hO8FNc+gXhAPhbcemMkO4je6iUqb
 aYGyplYUcCTYuPaGRX3ot14Yksn6QNBF9ljJkoSmhHR9/GGcacndWC7L05c2vqgSE+SRJRfFG2W
 Zn+JG44gcPcJ7Wh0bCL5tXMjCttXjwY5VR/DN1QesdUuAx8ZMlvqdB/INnQc22yZ+0rJ+usDuIK
 tu5/Xivh7lZpD6vLk3G5ojERUsV3k8V0Wr4XWfsZrtG2GKtWa7OoG7j1cQ1ZWxSkMfWTgPPot+p
 GcLUTZOAMGTKDJLemyZzj4bxZC+N37L/0pVsp2wlLN5xVUEe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: miwGU1F62uDH7cs6HI-laS70ALLFGtQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX9/UTEMo/HL/M
 NYbP9dAt8gV3RqXnHQvHte/zFqP6gCXfkglV/kcXpZJMR/MuFhUZl0xTwAiU4w9nmnHNMrcQHOk
 iUMVKFat+/N26/xPeHWNFt9l2lxEMBhyZvk7rgosTsT0Dp1XyMNrXAFH0oTK1NIk2Y2hqj/PSAF
 DB8NBB7edyA0kxy0AODykB4fMCjZ4/EgUHzeMnOBhZxMNGU+500nYbclHilMqypyszRyP5OuyjM
 EnDyl7t0yrKLBfmv/e/TJ8abx0K5Ahj4G7ar42+Eo8sfBhi/oWXF3kR6n2/t/d5dFoXDjgW7rB8
 bCNKK+sRtwP/eA58SfouJQgiUcVq59JBnJzXtF6Z9Vi8HGdyEK0lDf4tbupjTvlKvClahapUPkx
 AkOSvQMI
X-Proofpoint-ORIG-GUID: miwGU1F62uDH7cs6HI-laS70ALLFGtQt
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b81dce cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Y8FF1qk0yU6lqu3lwJcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 56828d218e88a5fa597755c8ea20da781929386c..4c4dcb095c4df97de42d0673aa2842010a249dca 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -195,14 +195,13 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
-
 	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU, bailing out\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.47.2

