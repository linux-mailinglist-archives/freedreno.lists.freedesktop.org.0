Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F81AC13E0
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296C10E7E6;
	Thu, 22 May 2025 19:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qbu80mvU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9EA10E807
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEZodg020559
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=; b=Qbu80mvUioc4fmN7
 UNATFhvrLnAQflx8F5+aZWsWGXYLV+fRJp6hQ/XNz50V1uvClGLyLRaCMpDyoPQ/
 vbFpu05XVIJnp4YWRSj6x1sO0hBX9V8mo6KyttbVsuU1P6m65L/i6CBHa+StCfUz
 fwf7buYsIxa5GepOdVwhtU6saBm1Ii/JofAmgpDZtc5cczaNdchj4+3zMg/c70S3
 z+8Tr4aHA+T34j4ZV+fo+PjcO25xdUqN+Be1EPX0Sx/nH9sdeaSKNOd8gO5QzODY
 Ax2dPnY+V+JLGe8i3qFaTG3QLuxcrxJ4Ud4vgQY56Wc73xOPU7LfIpLC6FeUuoRC
 jltO5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so255784685a.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940620; x=1748545420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=;
 b=B5ByUsX7GJ29twUejAwxjeqv2hScXpKxeKkaZ/up2pj9qx84sZoi9vO0zdP9WCoWL2
 r7lPMTLtlcR3CkI3ns0PcwkwajmbLHKShU+Q2yk4YxddGGlk8z/TOuBu+wXWU1AB9iXK
 CzlF2eJDY4nXyxq+wxbHgJAvCHc1+mLGd+ciUcOGNYodF90gH4XpohltrCiJeObEX0bL
 V8nXSV2dzCU7UPZxGhUlPOJvmRDdynZqh721kBwsSoy9zO8fvht8NxffUcZadpBBmL/9
 gqO/SrTNqajFD0lFZ/rkbYmTE0wAeYEOMn6tugTw4jKN36QrNbmNHGiP17rhcxdntdiC
 SkWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpPgAXGtiGYPMOEDQJ2+T3tK+hUvWC9cv0fm6sx8ie2HZ5xmQqWsBSPf2r8fD8SjJqvr6aeoCZ6sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM7GT8VXuExwm8OtMQ9pts5e3vW8m/s5wt7XrxhrsVpvxKhNAr
 jmOyjc1nQC2p1Klu3khZhFfhyvJMheIJQcugS7sVi+9+W8uGC4T5IYIUYFkDs+NAKjh3RMuSzo9
 oHcZ13oAcKw7ZZPBVH048YVT2ygqC4xtrKW1bwDuplqs6eSQuJ79bW3FtwlMu7DN2chNALiA=
X-Gm-Gg: ASbGnctBtl5vauD6bijz5RgfMZMheZV5D2jqSWzETW7bAg6CLgQf/5O0eLwVpTHUhDf
 hJkL8wCGPF0HNmBeKGZbYWJ94okyI2OrWb+JtOvijbbXFhWNZy4LxzM3LzvBRuxWGmRzu3YeTxS
 QgguV/FPC7zZ6NKDG1ztQBtdNS6IRpI9ovGgvHKWSSbD7tifxyCLberkoDY/FfzfCqpGfNypIRH
 HaPw5wrOMfQI7iHrDvOY/SHaXGsvbDqxS2gL1BwD55iCUYyYJ9Qzo+STyehIvkfMo9Lucv5Kruz
 XUNJYwlxhqm+mZlu2mP+/z7Ga0wyZ42Eb2nQhXIlUtBoaiiIb1Ujkm0Ojg8NIMhadzmp04pbnRr
 FULgrk45gC4yACWxOllfCybnn
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd47f1dbe5mr3834188785a.18.1747940619839; 
 Thu, 22 May 2025 12:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWhtLxfwnjOCeFjmQwfRQz8WK84FyU9B8tUZnS1CJObKXZJplV3E2lQi6/zI5UpsVwRyzxQ==
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd47f1dbe5mr3834183385a.18.1747940619425; 
 Thu, 22 May 2025 12:03:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:23 +0300
Subject: [PATCH v5 04/30] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-4-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V1gYZpITbFHVwsL98bgMq1gW9yj3xDgdHDTSQqGTqRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8U24JiUoIwCb2cb4lL90avZ25jIcPH9tnQ
 pm8S/lgNBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1acvB/4yq2iMOwDZTbHU9A2g9u3rON7AJ+oqYKcsLzdrCpqTzvxHncYO/qMgQbv0QsJMwTSYxC5
 qMp4hIq+t2Vma1YyiZMXgae2tnodTMiA5QGfy3R4MejvdoPf2vWROyIJHaZ5q9+6jjwwT0vG1cw
 ujnxqFy6WnJ1DNSCDIp89Hk7XE0gDbL0iy27BeJ2c3606zZZ8LAy3Lktjcv5X6D4fDieCXVyShS
 i9aVgAfUUMGFrqfCKFIfzc/uKRWVh/zAL+dkAb/SN31YSaxd6MVJyIUcN1eE96bAGdwW33Ij1md
 FePu1u2uE8S3WXEciqH3O5qHHTxWbaGoPhQTRudDI7CJX+jk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vhA_fWA-mY2rbBYvmVlLzqXnofFSIpD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX/87EeNzRZLam
 alWD0Jhm/boHcINNfaVNDcXknkINt4qcsXZ6sRhZci+rH/NmwwId8iLqYywgmATPVXjPgAAV4Hu
 8aeZtFThtsdKzuBpWdJzSkWgAijAw5zEjUPT7aCXc9Zp7k8K+exuM24JFlvaKX3+jzDJb8Pfwu9
 VYMsOYOzBTnvJSS+EqBXietOuQ8bw8n2l1A+uvwG8VLd3Kx8a7MdH+aN4r5iKksWGu/N5l/JYwX
 11xyG164A7I7cdnkiFw4meHu9K2fb2mYxU4Akj4x/sy/QPZ9OXTmzRSLoIZvWJyqIjWIidvUL8F
 ChmNsoX63CjVEMQV6WfNXyol5mHThkg1uU1Bl6GbxCfIvsI0JLyenvTRr82ei3sZI618HJ704K1
 fKbAz+6C5ENg3VcpeMjQb/V3xM6wSF5kssvISjMNFD8IhaCX2/xtbR8OR4ny7B92lH5Imk+6
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f750c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vhA_fWA-mY2rbBYvmVlLzqXnofFSIpD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

