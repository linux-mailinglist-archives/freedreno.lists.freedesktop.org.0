Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6AA9A7F8
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DBE10E79E;
	Thu, 24 Apr 2025 09:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaVLz3H9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C610E793
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FoUb007114
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=; b=SaVLz3H9YNZvZQHP
 dxxMBesa2pjVqluPd4V2R8eEjYELRIYPftpyCOxCiBKa149pBlhdYemtu3AXr+7B
 C3YRJoMNaPYngcfXdxRwsxbfF5Az7io+LthliGnQdLfaGN6Nr/St2IYj4J+QA2yO
 wdEU3vBX5D8opv5Vsbir6clATT+3MdTj5I8WmRTxEayOSyhFhC38tmMf0bEjlrSY
 h4k6OtS+w26jNQWTa3HDilvu2iUSDtga7pupp4cn+eUQGGYr8KTjV3YfV5eGCZop
 nj3jrFgXqBM/J0HpfiNRWvGzMjyFbRuTU2mxDeDT+exVADx1vphMulwjXlZ/+xiB
 i7uapQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0507m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so80705885a.0
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487079; x=1746091879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=;
 b=wVMWcFflQPqaYTNFBcxEWVWbzv/5pXZ1nEtx3P59k9YC3EkNgoPEnNN55GkAby2uHc
 44TksDN8VviayMsed57sO8m/+1yB/dk60IwCl52lLbr6wk/zeTyvozOZKOGsPhWbV1Tk
 DmWqd8e9T9a+SrA2N2L2xlgByXYr1akXIzeGtvC8wDVMf2yKcjSwCzfdeDQp4OHP7ro4
 oznk3nemEFsRklrez4XEgddmgVv4OD7rLgN7jbVeTmNeqddklvmEIbb+xAJTFPynnMAx
 2aIvS9BuI5+mbd4EOxcpZXrYsrLjCl/COzxfuuGJp6tSdGVAvx+36A3uNSWUHxlyw3Rn
 y8HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHGVlTwkMVgA7u1J/6PTaiYHKKYrwh128wvKHzatLJWOpJ95VGXyhna3BQjU0jnk1cCqdXZGGd00s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFwwmf2cbBDPsdb9DcF2v8lYat9JPUM4hg4Kck1hcir+Pe0OkD
 G/FLYXLWMy3z2LItPvUqAgww9e49Hy7emcno1+17tsTCEdi7CB0HSgiRoTNRYO/R69Al5BmSBEN
 YsbPQaSE2g0MVUBrQOejT0GdMzxj1jVSYyzBQCKM+YEe5a+nj+IRxr4X/VN+zuWFkcpI=
X-Gm-Gg: ASbGncvQF+90hIpNUTLOIgDkQ3oNyTMcWhrBGBt6I6sxibWJmQob8OtNikbTYH5myu6
 uZfEaPaFyhezMyyb10TLEV+Dtvoxhx3gG6O5SMupwd7IqIPHO+0eYkelW7Cx4M2Z3d+mY//Qa7y
 17eKX36FYOE/bDfwZR+Y+9U5J76j5XY7GKD4fjRDJZ19sGbPxdhFAqD/H12Bd+JhuBnIR4HH1hh
 3BC3DUGvdhmNKGKtLkuy7QpD+otX2TRnah/bq7X/OXE34rr12EJ3JZrcIesRY3lsUWBuUg201wT
 USR1Hfuh1o8+6vMPA5qMpGQURtR1+CSJRFFInyuZQY7VdtHhaCnIw7xQapUM1n4UKeDuZM85QqW
 v/eHGquFLmW91/U6+pM7Je8kN
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id
 af79cd13be357-7c956e7db71mr265477985a.11.1745487079452; 
 Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8sHYulZcantfqMVMskWIoIphoholS9WfHpqT1Qyz8n0LX/T8AiyVMCBqc1zdHp5HweR7KQ==
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id
 af79cd13be357-7c956e7db71mr265474285a.11.1745487079073; 
 Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:33 +0300
Subject: [PATCH v3 29/33] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-29-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSw1nFfmM68OEYBTdCxJ48gqfCba+CQGJERe
 /OMrX4eE3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1QLQB/sFaBLqJ+zpLBU3UkfkDppxLIHVuMH7MRE1x9FVYciK570/QBvg+qkCHb5d8MQ5rBkvz9T
 NGEkbP/z75m75O30kd251apwYzRvSGC4lRmvstIkd7NXUueWRyoEtATP5cD4spbU2D8azGVV3sg
 YbRb1MwgW/n5tJ9gnbyl8BIYBFnzkQFnkTUmS7XnXUdWIkv7YD0tLbI8Nr2KzUl4jRLwl295K9Z
 FRd4UvPkKhmOozWy0m6ecvUa6RLApgHXBPmT+qLPcOx6/lHiNESr36Sd7tZM5/2jbB+e9EvQU3y
 S2Yvq8oTs4fl2WbD9d7gyPMXyr6Iv8sj01NBkAdHwIcPaKr4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXxVmyL5kx54N6
 qRNKwb/2VikRa900GeRPgjzO7foojgrIIz2axhh5I5n9eIzagUA3adQmFu4vtSO3wkLiQLxHSoD
 Jd1j9yjP7fsvU3sEDOWs/4JUauDb+whXiyjNBUu7qAZFiEhro77bMmG1LnfmIXD2iL7UGDMkK4J
 P5Xa2ERxIHfE9Fwje63N0GbmhiFhCkB+s5Pi7/HmUzAGTzCbMfw5FKDE9odj4FZ2EqVzVHOnPcl
 LaQL6BOpH3yBBua1ApM3RFcWisrrOQYD0hRh8ZtVm+vf7ez4vcA1OBmJCWQmKZ4W9ofVg8ilc6p
 t6X08+84NRZv1qEKQDiXiVQKniNGgJ+/ojkcTsVS5zTJHzIH+dLVz5GWclDdbrCdltryr/RD0Nz
 6PEEQj2i/XeXJ6FLgvBHi6cnkCm1nVA0mY84vEwhWlhEDStjiiETxucs6+2EKcl+9Uf5297s
X-Proofpoint-GUID: sU6zeu5WpccCYNsHcgmmwOnVbhU3O_99
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sU6zeu5WpccCYNsHcgmmwOnVbhU3O_99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=937 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

