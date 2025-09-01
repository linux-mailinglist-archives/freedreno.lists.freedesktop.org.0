Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60434B3DF3F
	for <lists+freedreno@lfdr.de>; Mon,  1 Sep 2025 11:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC0410E3FB;
	Mon,  1 Sep 2025 09:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQS/xVmv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7402B10E321
 for <freedreno@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eWZw024052
 for <freedreno@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=lQS/xVmvG6A+GYPB
 iOPwO35lO+3st8M1q3ObbX8yFPXMvvWu6Y6KJChPWmEC/1ICyfJDxbhY2K3CibQE
 zng83HD8CZrgwQdt80DM3VHNjtR6m/rBjPJWgJsBujrmqn/Zj6kPbjIONIj1AuSQ
 5kM0tpCuaDyqqabWyBIhvoN69ca0yDwfN+/T9SWkjOMuKSYRXErMpuU4OsHgr4K3
 4PtCpBg2kadVsc5Sn0iyyb4lW/M/hwWMRw48cJIzvbO6jJZu1bdQF4t3aIRFjXzB
 Nu0eTON0Kyg2KkLQ5kHUmrAWI11a7Ut97G2S8/FizAe7l3Sepy3Ogr2WtZgmA3uw
 CP143w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2v9ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7725b77b795so837053b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720723; x=1757325523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=HHbSzh9VpaUfiDHaq6O+7De45VPVFlgmHhK6nX4cYPQgKFK3crWBceRjlz3R2ByI15
 D6oZ1Jp5z5XUsaWDylpJvr70mrafAUpqafeMVeIyEym7i4CtjIjVgq0P1daEHBesWr/U
 6OhUB5M6qF414fWlKtWr4+1RapI8riuq61MCGth2kgLV725/pA570gS9BIaIBA3t4pXW
 nVhjEdkMXjowo8PTiD/ekTiKTJxGZRJbgl9jjEZ038GaspzzE8x7iTaqyMhrH49KLBIL
 06v5Mo4wLMumLGUyxn36jgJWKRgZ9LSLzlMSxA2F93xJYOrsA/vzalujTdjGRAm7GPQG
 02wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK2cQNAdA4ls1R/5WRZ7UzFwjLZzvmeowe+cuOvuC+15IKxzIqGaQ1H81u326zoxR+OojP2SDz+do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxzPQ1qNNUzEmvzEkv8xszygx2t2m7IFaGU/lTP4uh3ogsW+J4
 koNaDazudjnVlbLm9Ys9GRZfSvZMy3Ppy0H2Et3riGZ4c07zaud5c03IKKYn1L4FZUQzcAqAfoe
 UJYpOu0EV5vjB8x2hm7XIsm0IPsjIeMHNHzHWWLe95q81xzKSJCfBPhl4YwQkFNF99VgM30A=
X-Gm-Gg: ASbGncvN4s59hL/22dWA3GAij90h1HHabM9tZhULgx/gCN5NFd6Z1ChcmCUc9lvJ94b
 YTO9y+BJsXcd4b8EgGFuSEFCKvKoRrJgDRtbwFZOSI69vCunrsDfJ/tk/W0C1U/rC3HyhmQJ/+J
 Bl8tT8K26b60CRlI/B4eP11K45nBcnm/w1X0apD/T1BQfnq5EUhUoG2btDo7ARwrBnLYC/dsZIH
 7SBGoQizI8jh507Waprf1yeBzpubElnvS5F5HNVX2PdIllnoA8OTVwN1HncnZ8T8Jdv4uqXpU3a
 wDWjAXT162pe9LQ8g4tZEjhOzuLwV1Dm+W6XU+zILvfC0/n6Wdw4hpw+qLkXyHtLC5CnZC4=
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id
 adf61e73a8af0-243d6f7e021mr10260503637.54.1756720723164; 
 Mon, 01 Sep 2025 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcT6Sy3B9OTw9HVUyb8xsdhYrAB9UJyNu8eiRPjBXTTgcVrCt/D/vmbND6zyw2UIQqSmNAag==
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id
 adf61e73a8af0-243d6f7e021mr10260470637.54.1756720722682; 
 Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:34 +0800
Subject: [PATCH v10 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-6-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720668; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=f9d+cJvkz4X1o3ygAyE4yDQLdFavOoV2A1iTB2IP2/9bGSNAus9L+k4CJMzrFYJlYnWv5JD2C
 6XtJKflv/acCfCPt93e5e8IU+9EdYW6yJHxMMWdV5lAkSkxssNGg5TB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX8DSLeTgj3Fv3
 NSh57pzQntzudzh2PH7/HYhnm91zmSaqLiUOEn80fIZ8nQ34tg2igi52GMRGgevsba277AekH2D
 CbdRHYUQUqzRWTYh35Fcb2V45VrcNJ+iHKLZdX1vVufFTOeOT5AHUcdBfqix6muMv0kGEBrG9he
 YSb+ZTvAhdSNR6jxIOD9WlNSPJRvCIj382ZlFXzFUcviFfi3RpP5x1eNlug4NEv1kZUYRfTk/so
 7cCZqMDENHHxCZUpWjKL2I3OtMhVAEjkFeQIkPjIXBVxWB7ztLcfCG3yj14KUk0kyT5GXasPBX8
 gYwVvSbUKwlKb+PklfDDVYzY47pjLdvYQ2nYvw600Rdla9PuFPh8w8CALvMEfAh6lLtoXcq3ccH
 SaV+HCuT
X-Proofpoint-ORIG-GUID: PiN_2ABKA7DfvvIFDFRLkybO-akcLBvR
X-Proofpoint-GUID: PiN_2ABKA7DfvvIFDFRLkybO-akcLBvR
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b56e54 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

