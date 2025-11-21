Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B1C7AC4E
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 17:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A8C10E8E2;
	Fri, 21 Nov 2025 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRuZPeDW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH0VZ2LF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F8910E8E1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALBj4Ua2841295
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=afYW2INdmx0JO0YDXbe8P+
 qVkx8T/BiOKX7PKMV+FlU=; b=lRuZPeDWUJ9a2vTkf/f5nypgjyEQdVYyNBWC17
 4JHmrePO/cwm8OeL1/JEKUPEpC2xZhlGxQInj7NF9MxYIsomR5r46wDJqrgqZbC1
 ZiM6wQLik/7KBJW/RKkj50eOqDuKQEAlfJBHAZly5Qxjw/tqoifLK8GnG1QwJ7w3
 LJSuuffYC2zCagdZktIlNhqSYk/fwiuhZj3w4G2urElK8fcx+jo85u/i8uu1komo
 yr1d60ToyaM5q+q0QIKVBPSkehWYq1C+hN3not/br2a3cZrVgW5dLl/IYXZVE+kS
 /uSedRuXXtMw3hMQ08iy+Fbs+B0VqHmEqfCFpxA0+eNVOM3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvj5bf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:13:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-55995c43832so3966010e0c.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741639; x=1764346439;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
 b=TH0VZ2LFxAYfKJ9xQN1iEsVlhy1tW+uBb7Zy9t52/Gq5vxDPmOEimW2mwUcdaQF6dY
 sJSVtIZamwCvRVzNXICdsCSx0dViqGaFx5gFnRyHr2Nttj4JWJNO8H/9ndta7RtV8yRI
 9WQocZuhY4UkVF1jfseIKufuUM+Uv4qdPpq668FSfEvOhp+HOhl+RAUlbFi5hQMsaIn0
 V2qidZ8skGJVQVLR0JIC96sz3pslA6pIdWUfZaj16pISq/1oqo7yw2QziXdrnxBiq7uA
 QDToj0jra4NLHinYWb7feKMLu3gYZaUJu2Ln9NfVp0s3uVOtCJ4AZqQjySPGKQzBhNmZ
 Y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741639; x=1764346439;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
 b=hQQDDbuGtCXgWx7VrO8BGXgzowAJTK6QUqBUVqwvGtEFJwWDILSAwn7vj4qRzMoWVx
 a1h5utrRjkFk5giWnBV0lUGbuJnK/uMSqPDBjfOD/jGlZepoFqdkSy7cazcbYnwcEvSG
 j/KmRlDSWociK9chVBc8y2g4U2sitKT7/QBBqFbt26wKVzLSkJV8lEsNtK/ATQn2HETh
 O8qQsnUzHSwDMqNn57xKMM+SVh0JUwswOfIPtmTARtKPspuiohAqy7/NrL200W5FVOLe
 7w52niUGNUOWpD51yyqK70pw3s1YINuBfVAgBTlwKBXpZ4aerOe7WfO3wiSTq1Ittza7
 MfkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ0ceN9HT2wvh9Xq1zxtYI8fTVeUZBRdoFTTPhRG/rGVXKwJcLa7i/HvNfjdq4p37X2bbaiJoUwGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/kmJoaWx2/Ui0x0eaerCjF18nuaHR1nJ5HZeQzNYKjfbZFjHr
 D+VXHDgNlJQbHvMicGJLfHEFKtajv0IV9bOYvI/ZGC3IMUa9D3CbPb1+Oj0ZBqx7f8t7IwGPUFo
 1b3piWJMro8esanGlwufYpXtyedSkl9K00EraC6b2W/ishY3atC5/ZCbBvLITa2QOG2VaUmw=
X-Gm-Gg: ASbGnctW41/n4Rn2zeJR7t989ejceq0kMsG9Ecmc4ndRSvJX8uIOus3iXCEjv19iQCo
 +ibtsGjuaTRasB8bEFY5UfodYkDsmCejtKMriLY2ysvyG8JPhuXawqr1ISVp9ZhnR5UaJ3Soyw2
 qelCe+iWds4N2p/FpwCmAAvEp7EODMjbTEIbmeYJ0JM05sILa60NBDdorONL4TBU5F3Y7CLVNvm
 ckqhSjr4z/LqWo5JRhNjvZTBDQ6vL89TBJRALHNo4K3MtcCxQiLAHgtXq+2eL9ex8d3a4D0Zwkn
 Hu5+aHHPDsmF1sltquMaE4s5OqzKXieB/PCbTtFPkYKHgSolmgG09IUwJoF0+pTy8rCEb/g3T2D
 k0BuNx+bQuZKWdURATQJEdZOJ6tFl07wqsn57FSrb/52KCEPHtiYavSnYl07SMxdozPLH7dNcJt
 H8Xr3/360q3kswi1Ill1Qkp9k=
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id
 71dfb90a1353d-55b8d778213mr1011005e0c.11.1763741639401; 
 Fri, 21 Nov 2025 08:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOgQYgFCe0VTPrWrOvY7YoNuHe7aWXw+hMMWvQWaJGu2ivgw5iptTZurs7oQHBUhuuPUJHCg==
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id
 71dfb90a1353d-55b8d778213mr1010992e0c.11.1763741638981; 
 Fri, 21 Nov 2025 08:13:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:13:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
Date: Fri, 21 Nov 2025 18:13:02 +0200
Message-Id: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6PIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3UQjI1NdQ0szAyODVFMzo2QjJaDSgqLUtMwKsDHRsbW1ALCrRy9
 WAAAA
X-Change-ID: 20251121-a225-196020e562c2
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/xT8Ov+PsfKN/aMoRfE7m/iFLH+BeOD3az/2eEWxojg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DBDeEhn/1rqubM/o28dUkUWKP++pZgF6en
 M110JsyFpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1YZWB/9GxSpE+Ah2/9n4UCa0U6MA4eakXfIrjPqMUe4/V/y1dJLbmcc3KPe6vwbVBq1gmY1dhmX
 GLW5Qsh1sJbJI7wrKzLJoOlVGRKLjzEfCuYoKBQtVyqrUMqcgJkpBnUxTonUr9MjvDaTkHbMBjb
 ktg3AJ2cZ0+QorM/XIhtDrvdG8Wtr7+AN93123LAm1RPT5mJsxKYOvgbJyA6ksmIgBP7Wdv8C54
 cmWFLsKTOJYahp5jLc3N7cqojW8MgX604bdwzSV3+DtWTqh6GK/T/EOZEQwUa5tBunesVqyxe+O
 5l90x5HzWPztgaILGrs9wTqVKEV+JMQSxf9MVYCaY0wIpQFX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: y05hKpMjGk7OjJC3U6e8aDxJY_1VjYXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfXxNcPUFd64qI8
 zFDnb4AXVe67IzkG5XyOsbV4/HmwDwTiiM/jz90bOSiR6K5/ENNAWWWR7yAz8VB6RMjgjR691wq
 KsScqpAIp+PYBRkFYdYqCNXJJUmTcX4AszP4BvCM4LwIhgoFVK+58h7ZXRnW4RivqupiksJ7FXd
 7gxBJsdtnQvicOcMYm8pGzl4mTzojLzltWq61IHeNxIn9VFXFylsyWbSTml/yaRwb28Y6yfTuhX
 XypuxHcZM8BfZESEb5vk+YyhCMOHkCoPu3NhscH7m4y+0d4Pcs2vfT1XmcieDCWzl/9nZnwumoO
 LA8HsuOlK1B4INZYxUCfeMiyYsmyRRtssmjtBVFNmp9gaqteBrJNI8/ClzBGCZwcB6pqNmYYv18
 veKiWxjwiASokY3z9NOVGG/7FiqORw==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69208fc8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AiwHhODu2twfVB833LQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: y05hKpMjGk7OjJC3U6e8aDxJY_1VjYXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

Add two remaining bits necessary to enable Adreno A225 support.
Note, this wasn't tested on the actual hardware and is purely based on
the old KGSL driver from msm-3.0. For example, running on MSM8960 might
require adjusting PM_OVERRIDE[12] registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog

 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251121-a225-196020e562c2

Best regards,
-- 
With best wishes
Dmitry

