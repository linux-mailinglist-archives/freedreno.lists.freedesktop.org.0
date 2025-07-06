Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1AAFA493
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 12:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E28A10E27E;
	Sun,  6 Jul 2025 10:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9HJKwee";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A593C10E38D
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5665KKid025935
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=; b=Z9HJKwee5TLv50Zw
 jjBRKSb+twj3ZK0Kls/ivOxeaVRfH3rRcJT59qXJXEvXLfoqGKhRGYEuHZumMNqt
 diUZwR3TASXONH00f5XJ8l1LvHs+jiAJvJ/h1U/hNbriShmnWHo0WF/Zkc7nWrh+
 cpnGOHZT1SkVzYLnmq21We2O6Uo35xeulz0PbAeqj4x+DPZedtyEovdNT8B4Nv6P
 XIjcUnu0qKcXJUr8CYzHNQXQhCIkFUBv8dLvF1e0MZQ7+xgbyTfow9aF5+DSFRVW
 08+LEt6o7lSF3EXVGbJn3Kpey/9iAtYwWb8wxnjbpbaWtfR4QIRqEZTInWBCIoBL
 tqq+Sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv973f3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d444d21b24so369873585a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799048; x=1752403848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=;
 b=cDxsqkZYLMSZwGntVGTnZJG77w3SaBnK9RJnGhg30Vi3xBD6VHjuS2y1oSPZYZImgX
 O778j/PvBbaZru1Lrr1IVjoSW2r0JPJWmSb6+l4jIL4TMYBSKENxMwrpvmV8fEzNh5+8
 +nKISFUUf8r586HvfNegMxiJoipAqJ70iU29/+IK1OJqV31VQrcSWNP7x0lRvW/k5Sir
 qc8nH/LFNtWGIk5P0GoubVXpxDxoQjV3l74jcqi0c7E7VVcqwLBxvUBOGuB3Sv9l8Ejy
 S2kZUItvukAjGL1QW59FPXQv5zowXKjavt8j1LhDOiXmJbRoYPGJxO8rmq01IOsDHIvT
 JEOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt7n+7T7Xfi/QxYBbRgYilb0RwyGZEaGf/G5ibDRp31caSfNVE3ysrOjAFpdCv/J278QUhax2t3wk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzml2KXpBFzR+vEvech6x0lDyA4alDaqPmStQFetuSUJIerLLr3
 as0WgCdjDaqxM0d12LZgY4+lOZb5vfmDaVkq/cQXloGQsNMY59AiTSx838KG3F4k0itfK4qRyf6
 ghUAY4C+Bfb68SX/o42M23ZRnvdB4E5v0ZzShJY9Bj1AK73qYx7hGb9z4Y0jMeUfcTH/btp8=
X-Gm-Gg: ASbGnct2PPZEJXEE/M2XGv6lFFnIhCVLM+j32nfeTiaUhR5l0uScXQq54ob4I3Tzu7C
 xLA9TSzihk6oqATUNwMkvu10ehqIwfF0KhhaPeNx/Mu8+bkYPTWTqynEFJd4Z3hIljo4tPz2rR7
 RPaYcfb3vjcUGawmn3Udx29+vOoGpYx6vmOrGSUfsogGs5Sp5K00w9YhZGre3T2MYctjcTHi4v5
 6+OrNKfarEsaM3n7btD7Av5/IRWNpIwzvoZ+fUoIu0HtU0sHbF/HeDJjggYo6f5dIJfFAjDtEt1
 ys5IyvoMRHtjXoLWJ31mXCE6bBRRrtfOPOPrJLrSmpff8WI9Tm++XHqLygO2Rfp0lO7T9sJu4N3
 0r8lL6jISZxwT5dxaSqyH1LDfG2JL/niYIUk=
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id
 af79cd13be357-7d5f10fa22fmr697621885a.36.1751799047538; 
 Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyZ9ucK7jsORVaYGW7av0WIAu76YoLf2T3keQ5iRHn3mdAtAO4h06LyQ2I0lncFhsncDHXw==
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id
 af79cd13be357-7d5f10fa22fmr697620385a.36.1751799047134; 
 Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:37 +0300
Subject: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CVAxMJ583rYEGC1+K/sUzP+WPoNKZGaqzP5oZqg2sAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB1+xuuKCza8FRxLDaIpuk4/9nNPUhbOJSM
 jVRNJAo8N6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1UkMB/9kTumwrySnCjd4VSt41UeB4BUW/u21VLeSik9PtHt1VuBLn6bQIhc2174IcmTnc1lQ0PQ
 SP8DPvssNDhjdb25NISWlpA22w5hYNeZnoBcwZ1hspvX01vSaHDyavJXQWSsfQAruHog8hEMsjY
 K+USDp5d+IN6DrP0nM3EJ6/beHJ6aDOyRiM3l9A5IXL7B3Xhe1LS20yXeokJ4aICVQf1vyfzSyC
 cvagS7NZpMysbO+OeFMjwPvp+N1nXsYGzKCR4R7UKBWs9QeyB/5afJLgsMOCBq9wNURns5Pz2od
 UJXe5YkdA+va3Df2WP+dyqGhfFsDNpcvDBspBEq4LKD/SDGD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a5509 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bqLZAy-zUTJ7f3hpqcwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX4dZmoG9qu4Yg
 rd/dXlPgQJKo0pcoSCNVCLogpohRiR4wBWu4WsJqVGxOnyvq9foOWoiRJJz6D0sSL4gyCB89mZS
 D8lNQd/4RlSokJUyV6XJdqc/Agkul+yJduv6zJWnIS5TJ9/Z2NBWiP21Gc3h2j8/2Oh9IfuLoeM
 inqpKi99rb5Q/OCj4MZjOKGFyts12C9cSD1aK9ZFeqERZM5pd6SJZAe3G3tGJgQ2fDsYotXso+U
 ZIMzghH4HOROcHw+i3J+XyKpquy6gCzEDsufqcWT03r+qrqOoT/shVfSPzpyuBbezyHYbQ2hi6F
 ZK89Cw2bt0O0jZNoeY2M9rStpULf/hZQsb/+JxNuXFv0R6iSqKfY6v2pcaA8YnHgSKlc1egNOPO
 Dim1zfUeA9eKJ1EmQoOlRRLPrgg1AqVONWVch04GSjt9XpnCd2MQVP28xH9A5UiBreAYwx7i
X-Proofpoint-GUID: 429iTUb1yyn4yW8kFaM7MTeMcwL1_Mj2
X-Proofpoint-ORIG-GUID: 429iTUb1yyn4yW8kFaM7MTeMcwL1_Mj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067
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
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU configuration is no longer supported\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.39.5

