Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D2C0E128
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C26410E4B2;
	Mon, 27 Oct 2025 13:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="etrFSmYz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E74B10E4AB
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBK3Ci2547860
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ErdY8kXLBkkRgO7ggfayGK
 UKWYq0R05r3pV8kdnXxTA=; b=etrFSmYzd3qEMObYGP+YmmdVsUR1EngqecB9bd
 BGWEnI3xtBl9ig7BNdgiujGFhcXW35AyVY23Le9QFfIKUb2iACwwcdM+AbQ+5Rfp
 5t2hjB9dYlKKk6djVqWRa2Lc/lvrBY/WKgZqxIMz1lwBHt8Y5pI+7hDk0yRRNlws
 WmGbefkVXtOpiiIAX6D3AVlFxMp5bE4i5EN1udC3CGcmv5W89hnkc9aLy8RoZPOB
 gzBB5wE/HcyHy43z4uzt+6kFOs61nz1eszbhHMGgK2PoMpSfDeREHrrvcUSQz+Lt
 fVvGH1SaYSL/NYJEqc615NDhxUqiZ6IbCSWD0YkKw2LXUArw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gbq6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so143490461cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761572122; x=1762176922;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErdY8kXLBkkRgO7ggfayGKUKWYq0R05r3pV8kdnXxTA=;
 b=FzFcqeAuUiNTwEhOtIviODa5uDE1X3Jb/iyWUGmORZRraYs9IoVC7oryA1WH/px54g
 K5dS7eFhvs9HsDr7s3LYe2yBcCessQif73Oy8hp51sfoiOzsNeuFSNwuz+eGB4ltEQDc
 pVvtgNo1vCg0pY/Ke31c1AHt4xNqzMVpM/+4+gPUQ047pVZHBu7i4FOte22ZkQpr/E3R
 RIgj4kMb6pAq9hfg9TnEeYJqj/mHULpNAlyRoeeUK2Lw60ij9VptVEqaX/sBmUTgD3FJ
 y6rx6V3GKHwc68h4SjFQdL1MOJxhOWKPgxd4AKkMaKl+uTOsyv75BKYnp0Sx7vZ7N88M
 CyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJIZKSDrPBGLa3P2wP2eCDShXuuPnsGcFHE1Av0VMB5fNpBJrqSKMCj/d1O4IWUK6/XTjrHmHlOkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw43uT7VyBLEfE35Mif0vN8ANHbUG3l6iS1SmsXY6bQQgW5dP2a
 9xh81ItMdNcw03XB6u3kYX7SiJEhfHbhQgK2sKIKzEAsGe7h0/uFcn5oysg6kEwOHltyHCBil+R
 Q7mZuDJpazjj96uBXAa4CYM6KYC6x72F+Uw9AG6v+Z7EsbO/AuRgP0+EJxzrQSQsYuO6yQM4=
X-Gm-Gg: ASbGnct47nyQN0sljf0EHuTLzOZkqd6Pwgi5Gl9yn4boHw2A0dsOy00/FPJkP0BAd4Q
 iC/20Xd+ad+koMjOt79l9Sx4wwkDIYsu02b4zCpYSSW//x4jyK0EVcISrdn9JAVfBJC/gNRSUN4
 BkLR1QiLicZKYizSj+X8sesXMbEW9KKdXU/4CozICgN7KZSCbEdQgdvwPz1k1G97teItvBgWwl6
 5IaIuA/BZmp2dE36WlK1tcNdtoL5+b5+De1JOqj//khdMj5fugkgOqCf34JXBiXbJt0muHt5XwK
 tVkBTv1GEITZ5OFgMCKplzxsSLsvbRhxKhHJqrz69guVJX7Wgkb93DTQBfaNsH7VJSTj6eJb2Br
 UAxk7me3F+XCkJNvXmZEFp9sAF2lz6mU4NCOSYqzicetRJDucpY21FTHmTTB7yRWYsxW/gO999/
 gfD1iAQecClomc
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id
 d75a77b69052e-4eb94836cfemr124817641cf.34.1761572121067; 
 Mon, 27 Oct 2025 06:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL/k6oJDubDmBz9RbFEPxNjPP3Xc56xvSbGxP94oLkFvGUc3VW74FMXxrNUcFhRspD7ZNgBw==
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id
 d75a77b69052e-4eb94836cfemr124816291cf.34.1761572119124; 
 Mon, 27 Oct 2025 06:35:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f864aasm2290602e87.109.2025.10.27.06.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:35:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 15:35:17 +0200
Subject: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABR1/2gC/x3MMQ6DMAxA0asgz1gikSiEqyCGgF3wQiIbqiLE3
 Rt1fMP/NxirsMFQ3aD8EZO0F7i6gmWL+8ooVAy+8a1rfIeUTyRNGckWJLZD04XR+Vcbw9xTCFD
 SrPyW7387Ts/zA96xHQRmAAAA
X-Change-ID: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbnJXiQX68kkbm/D1iLlZF0GumHyj/1MlksgTx0Y+yQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/3UVn1nXqSc2ywmsIG7i7wkAE5ERKMYibym4+
 Os87bouN7eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP91FQAKCRCLPIo+Aiko
 1RpbB/9MsRHR+86Nxly0FzfgipVdlEGVe7l+h/K+TFN2Aumo33Zh4sKMYONm2WeQfWvNw7kF45k
 gGMevuD2li7T4CCn32odF2VxRIZDY+hfj5g8b1ElsR6aLJbodSNKxJ//U+gZncGOGIHX8I+PQKB
 BaaYYJzxFCAM6usI2PM/sOiZ0BT+uZnk1KR15EOe/pbkrj2FMjuMdNF3vqKOQSpZQYE2ExZNVU7
 SggI/ub8qWjmEoRuKbIeG82hUPzEWCoYFS3GWHKjBC7oe9AXenLemI9B15RjQBmpCijRdpAYOxE
 kVPwUY62EFaZEgiE1F7x+LzfgsMK/QpdzoHhffzuahsn5J/2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CkfGJlVNESt0X0Q-DHQhmcIfGhORl97r
X-Proofpoint-GUID: CkfGJlVNESt0X0Q-DHQhmcIfGhORl97r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNiBTYWx0ZWRfX+QN6f8z4OmO0
 vjlwNSgJr7J0t7HUr/Mv0Rr2jjrwSonoo8vP+HFw2tGkZg2mNy7VWidGqntPUMVU+p/XzQ/EEmI
 bfT9gP7Xl0mb+ihTrTDXBFkVcVViBGss/0aaN7jf98Zhs3Yt8v/FWmBE6EuR6IqMVeWArZDHSYD
 7Bvz/hZU33gLXjeBKFXttNPf8w7lpWsFSuFmIfbBUl4mJHlBI9AbT5HeIOVCvYpfKzhEOQG6Pdy
 IgaC6lg1nS2/supu5Vq3gv61n84z80a6XDh4KCxhk+hXh2eJB0e86cac2kBh7FZ0RzieI9vm5Ux
 u+WykAcXq06Pa8F4v9ZOkrvxEVMkIRK+zCBTE0LJjjpCBp+OSJgNUlrqn1JRqn6t1rgJRfPi9km
 5PQ7vl6D0F8OMoF/JtwBTUVcEOMpKg==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff751a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s4j7PIB9qVrboWrP3l8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270126
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

The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
the header.

Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index b7013c9822d23238eb5411a5e284bb072ecc3395..cc7cc6f6f7cda639b30bad7632c6e73aacedfcb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -71,12 +71,6 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
 
-/**
- * dpu_hw_dsc_destroy - destroys dsc driver context
- * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
- */
-void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
-
 static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
 {
 	return container_of(hw, struct dpu_hw_dsc, base);

---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99

Best regards,
-- 
With best wishes
Dmitry

