Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECAAC1421
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBD510E979;
	Thu, 22 May 2025 19:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGHAVrBG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964A210E8C7
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIk4WK028753
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=; b=VGHAVrBGPOx+zKvz
 JaI2Y2wZGDchlKGwG98wgJ5W6cnC9wK7Nj8X7KRznsghjrsCGhQlg1lusGlCF17H
 uF8ND3USEHTcDiVOGDtmvTmmOvQcuwRWHKqP2pELiKqoPhXwAeazB7kMvmMHMlvU
 +AejUkrCKAbVcg7YcZUtBjr80tX0Za4HUArVC/r6DIuvbeEQsNoLBQN5B3tA/ng3
 FcfhEt3WIoZ3RU0gWQGBFwRAHeXkJ30xzdmdJVaCzQn4IF8UzTPnB/iQa9liUm2g
 6YAKHInh83pYtCv5aG6NejpOrGnyco5tDAqOgCw6pLK1bH6QFQ0/1RFHBwCKTnf3
 Hf0Lng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5b9333642so1020499185a.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940692; x=1748545492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=;
 b=CiqpCZBU+2rWDq++4DPBg5P5jriojvJrO45KcRx7uvevKeVdXdlgyxS+kedIityTqk
 l1Hpa8OJRVMx/rox21uOEUkUTDv7ngN1oP8SzA8gCXO0LxR4XY1uuia6bOjbC5a1Rv35
 OVLmSZEe5OrdvE+iUxh1nK98Cb4asKYXu6Ur4gIX2XVVzIjOV/rrAp/K8H/2RFAv1j8p
 WgWjJUoPSG3wOCLIayD5ZlsCvh5LW2gRwk4yNpax+2/19IzG7+3Rar3/WqTKKPeaVVDr
 6PHQulruNihndJ1f0QTH8s6ZJ6Pbvw4fa5diiA6o+vwlJU09TS1Giw4FzfdfNGLyu5zg
 EkDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAvhm3bMH5RlmsBekwm1al/F19FLm+ScbfkYM+aXYAYR+3e2LKg606c+NvoJt7Lkhglkh4PZllZMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFYy4iCAklp+d6BWZlvWVL3KfpB0SSCd5DRAZqmv2poHL1dmtV
 YTiIRDRDrzAdBY8TS8y2WaAFVWbO4Q6P/NmS/WiTn4XHkGdwUkHFlOv8nowXxuzGsZ/C4DLUOHe
 LScc5KmBbhZ+UR+0ubMayliP2nGb4KEErre63N1t6kDl7KFWLLWPkokb2slsCijKBCvuZW5I=
X-Gm-Gg: ASbGncvNHCM1HEO3yl60n3//5n2I4vGghfpM7bB73FX7+Y7zeBCqM7JJJgqtWIFqT9W
 2KfKAbq1ZRX1IPKMpt3xJp0WpcUEDoPiWCGmT+F6URDgbKxlnLW56OSOh8GagA4rmtjKncHu6+q
 DHNjrSERez3vydN9bJ+/b2Fy9yPWKDIf5JNKVE+wNlOxqUUJIr4I1HE4zTGvhfp8uV1XU54zB2r
 DU3x3dcdS6jsN0BZ9utL7MCn8ot3HPbDs8SmUYOPwH4Hn/nfzcMjxzJJoBLX977PJ3HPV1XknLR
 FYeUFhvuS36ws5xdEbqjrGGFD9A5aYWYmsljm5l52vRB6nmUP1Srerz07TtFrMwAJM4ZHoVUH8R
 eIFLOxfuGf4bUh44oE0OL+eon
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id
 af79cd13be357-7cee3280efemr4750485a.58.1747940692398; 
 Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqRioajkuCidRLbLqoNubjYsIdX2Y5J5RM0oBH+NxvXfHz3YVH64rHn5nDHQTEB2YD4x6+tw==
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id
 af79cd13be357-7cee3280efemr4744885a.58.1747940691977; 
 Thu, 22 May 2025 12:04:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:47 +0300
Subject: [PATCH v5 28/30] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-28-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EaiNnpBPJ95aothOcinDztqBiGxffsBsh/dQfmS8ZxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+KcON32+01D/bbm9bdCUvsX5HYu2lR9zTJT7FR+54P
 r8lfW5GJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8p2dg6EpRDa560Z4haNQ
 9AkNi/X600/3malH8m5tK9eQ+LUkYUPn5le9xzwa5y84emjnXk0Ojct68g3WacJOjBsllc8VzPv
 z98nxQy1Pi/zFo3yCzjQfz5+x1LVc+PeqPF+u3d/svs2/s1qp+pd7fcDJqvrjhgH9DF47w+yF9D
 pzX/dJb7uq+z7RkGXZ7JUSm3Itp7v9cdtz9tHU4CnzI5T2p/6az7TPKLarIdGGpVnU53bywb39E
 lt/lk1si7vq4XHxT7Cf8ZHs1j9tS2YzcIo6lbBlasxLtWMt/NkipWfwaRKrjP9xiZPPPMQOtTZU
 /K/TUksJU1j5QtC3YatcKGPuo6j0eKWgq8VLvLX2WBoCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX7HPQol+dgyYX
 1bQUa7NRkSCAT0uEnERH0EllrZNKnMwjbLHYH2t1ByeEtnhYcS5wrMG150XtRJ3T/aJ1AbRYYqn
 h9i+vRrE7VJwC1OBwM/IWKm/0T+ItwX/GE/Ln3ZR0BtdvueKQiJ5+y8+5uDm/CcU6iPQJs0RDhd
 zr8MgGv0HEMoYP9DmTpW+mf4roJsjLh0kNogsSJ+V/TxVLqr5w7oE4ji11XG07K70bZNVMhzcaF
 0G7hHl7XaDZvfpNe9XfjR78KiFt4nb3/b+jI5t1LnpAi/vW3jPA0WHr6ggBEpvaEiSdSF2Gr71+
 DDihOvNJHowKL8hcmy/EpD6i+CIz0CyJhh2NEoeEIjLIpeUjVHx1mCyNGYxCmBEgwxK+D3JEd6D
 Lqe7X6BhYKivVh45wBxDctuwoL+LWssjC+GzPbt8UHigjpf+vzcGJp6L2Eh48P8mU5iXelcZ
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f7555 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d8G5e57Unr5wxlGZlfHdhZ2gNDHQXrxJ
X-Proofpoint-GUID: d8G5e57Unr5wxlGZlfHdhZ2gNDHQXrxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=907 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,18 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_SPLIT = 0x1,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

