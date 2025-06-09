Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D802AD249C
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01610E418;
	Mon,  9 Jun 2025 17:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFmIYHui";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FBD10E3EF
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995v7k026990
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
 M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=DFmIYHuiFIm2j/q4DYDF2lOaPG8
 vjM9yH/w87pXIYloXTsVEv6twpb0jWJTThbJ5MI5E0qF62wKbc9U7Fp0TDtjRWLc
 wCEEtwHQRq6vpOJx6QP1AmbYLKWCnG9k2IvJ4TuLCy8ZhifcLUjKNQxj7pVJwbYP
 4Yegyxruw4YrAtOdmVGWabtnkku3OHKY891DhWSrI44pGjQovrwAIGino3cb8xWB
 DDhYSlIbQB0U9CXFbyd3t0/nctrNrKfXZ5voRuN1SyCpELXsjGJ2PDqh8lu2tJDP
 9X+JdtTE1vu6G8XfCMatQ9gTnWduivB6yBJFxKfvtkLVbqz+joXoCu5Heuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66mdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2349fe994a9so32762185ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488688; x=1750093488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
 b=pf7g5lhRQeBeXpfp/IGjNY57k2VasbW8+MdcSb/zZrHaDEICPUuHKfVoW7I929PAJO
 lerY1AN5x6bDa3Pkf8xsHuIFsGGmWzJMUtYEWWYQ4sdcjjkUVAqSwtYc8crCSShMlUPr
 pu4TB58cjckrRtuwRPpkAHu797B9XtPVSYZK6gE0NelfNkYj1moPwQ+4ba7bzAFCFmBH
 FXXSeD+L+CENapxZl7o3sHaOKxTz92PMSW3Py/FhDzTy6xRqnUiJZEyqEfhkD9bYtzTI
 n32TQlJszXPjCdK61uYW9QWIRqeYlIHyXqW69S3uvViuwzgBGWKPme0ecxebw8qcRx6Y
 HoFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX508CjcSvHVOkE88PUDooH1sGYse60IT9TkYmrrwEZuFmKpUMt+Y/UIp5SOpljbTy6Jkq/SXxk/OU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG5VpERr8u2k4Ox/H624z5udrXhY+dLM2uMMRbwkDRKQL7kSc3
 5+Y0e9kLK+/iNNZKSXe4GxsXl/05P5GshzqoHsr8LveEN+Il1HjpkAoxHdWVKYWjCRqqDpnvqSR
 NBURpXFnpJbxiK6AW22p/85QiNQoX41xm4DqlPXeB07pemKQNN5md97W6nbMbgrpEgvj6kWE=
X-Gm-Gg: ASbGnct0T4eBaZ6IPHVzRIfKWuPGgFwFym+z9RCClctuhcfslFN6C2RnUKm1PV6AsTz
 2fg5Fjh4ZENsSsBKcmM8q+YnbrICzIy9Kk+SsyYTCSKRhoWcD8hBJ8h3r6eyEZg+illZeGscpKG
 1kYHvPSQ32Fhfpebjt5yjPVPZea3TjNIhzzEUgB9O6+BQBXDL5s+tq5OzBq7vNs8tGfEkh+9xzx
 u9E1619+F67QmTW4n24cBRbwv1rOYc50cANLMV767CPxpQkqdKNRUaq4cbVNzbjrU6Qj/h0Hw7m
 FOOeJdWMQuUlYCY3XHUd+m0sNXkLdfqu
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id
 d9443c01a7336-23601dcf348mr200552525ad.48.1749488688245; 
 Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Cia52Pz9TP+vPUc/qxfkyKQnpKKCfw3Z7/NYylirl2PJBjN0RgEB3Shvrl9SsiqWE2h2gg==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id
 d9443c01a7336-23601dcf348mr200552095ad.48.1749488687819; 
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236035069f3sm56821685ad.231.2025.06.09.10.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 10:04:34 -0700
Message-ID: <20250609170438.20793-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX4VCcNIPzZ/aV
 VLhINEE4JevGb3oULjtWDWnDW4/ArpHQeCM2lGzExFpaT9+flYNmfnq1hKccN98+ZGuzyIX0JCM
 k+5eIdIuY6tUnLtRZHa2zT/IJ3sQTvGOIYMd9zat+zLQoOLLlsq1lyj8UFLi6sEfpO4MOqbnlAD
 hXUo80bhzhVr0JUgdDYzOEEImczZ6DR+th1V0Nt/y9PTxEMkyc3ywcuaygQjaI2HcGY75Ir8/Ud
 B9oOLV9ry+cgoYG2tiuktMmDx1npeflZWqM/YR1q0KtjUWn31Qn3REGc4YdIpL5jQeHY3/FpLfu
 cRnxXFLDAmbzLD7uZcnzcdtGyp3FKL8ZLPABXYfYOK+Dr27nI23BFLlwm/nCVGGquYq2ZZEdQgu
 8BGrSUWPm42NdC+jhU/JpNAlZQhwj7svAtdtgr9PWvXzdjMYzmfS9BAas7i3lvwESmUUH3JQ
X-Proofpoint-GUID: fdd19WmePRKaTQXJAWmVisZpitcDpVvG
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68471431 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fdd19WmePRKaTQXJAWmVisZpitcDpVvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128
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

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

