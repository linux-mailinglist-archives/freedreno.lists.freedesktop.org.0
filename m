Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2EB2D87E
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 11:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233A410E6D6;
	Wed, 20 Aug 2025 09:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY+ninO3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8A310E6D4
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p12c009507
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uegs61kuvy/Ef2awv7oKRsWNlD6GJZeqQNqXJ5q3U3M=; b=LY+ninO3vDfwnTNS
 iZjusYM8bZZqcMtUChWT6lnXtWwt6+iBwVD9G89Aji+m6/uLUHLgsOtg/jxnpnts
 60AikWkmIWnpIZ70WP/2V6Und2ObG+r/DHOXhC9zyvNZvWCcdqqmzeCm15FFxVFn
 16PmSrZt5/iniYvy//bz0FtufRjQAryPirXPtRqNE3zxdLe07bR2ynP2R9QCEmet
 E5PLwoDQpGtwF5JHX6Z4tF37+zbdPaPH+v9uvj+i3Xu++UHJ0gZaJatW/VGzFiRb
 FuS51o3taH9RRzuKwjElP0iOhY7mRd5Moo+cijOOSgH6bauAlb0jlWb1xzEpqRiX
 F7rUqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a17ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-324e4dd1237so102185a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682639; x=1756287439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uegs61kuvy/Ef2awv7oKRsWNlD6GJZeqQNqXJ5q3U3M=;
 b=cfc0K0cCC9rBmRv1BgwiYA/t2Rj7FuF7tu3HFyRysRyZxv9gmIYXkfF3ENg4hPpFkh
 +ogIaL1qizdPd71fq5AZvUAL20h+JTGP8T3MM8DcOcjd0m5vn6BxYtd6I4Nx/b5h3pU9
 9alj/Tw3sK/39+iS8FAmWZ6jXvGHm4XEhJ4uRoZNrB83XeBP2EMOdf0U+eFCzebAPCAv
 0gSyxg4oXMhPiiTzuPEEPRNbas76WGRgWy23o/AiMZT1ZEdSebwI72iT0TKtnLEP66Do
 Yc6B2yXVuWtaOu+HhnMjBd3fME9LofI6QRav5IE5MYkTDRKkWw6jovsVEBgxBwxbtxRU
 IWnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2LEsjf+QWGLE9tFr06FwgTCot29X6ZYNtWUCWY9n7FTGmI74XdDP7TwhtNJ2sy9n9/RWRQsbAQaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkGg7TW4jdzNoFigyB1k+RFZuocQN/gq9QSPQBwYvEsuOYNf6X
 efbaunLugCHgqqsC/72iT9ZZBtNKaYWOC2d+vYxQs7P2l8vXtlssm5Cn9V4Jv/vkeVRMhPgNw3u
 bVmHzHXwVZ0qa7wQ5QqB9Ad7bhZJ4TFHPvtocpVV5Pg5kuN7EoBI+zGCmklpdFnOc1zu8aoY=
X-Gm-Gg: ASbGncuhI99Y4/6QGSQ3SeYPvxjKOhP5jjAsX25DHShLVd0bt8/7RSKj9QQpnlPkBFR
 xBWdHPJpo2C+PfptbeDMkqsg4Stzu/SL0kZcmu/EBoXlx1804yL2XavywsGyC3zvSPiU+0PTPck
 FBdWY3UllxQC8PCcxUYPA091FUIlHkUMB7/vIJ40JKXAt01twAxF1SXeJcG9ibJSfhyRICbP3ZJ
 C8sq0hhedkeK1Q24EMtnhtMp8cSIHTXdS0OVHdVsgoEK1Ro8cg9UZxWin7F1RmyNRNzEwAz6fo8
 UMKCoTMRrmJekXOJpBEBgQ8QM0exALwB3njl+ZH2t/7EZbeQL6GtUHschwz/hoZyRjBealHueQj
 A5lIKHGNyy0lmKdMmDpZzMWR6V7G2JZj/sbNWFO9nUJqnB1rZw3SlABV2
X-Received: by 2002:a17:902:ce83:b0:240:4cf6:b07b with SMTP id
 d9443c01a7336-245ef27aae4mr14851565ad.9.1755682639092; 
 Wed, 20 Aug 2025 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhfCvj2U0FsjX6+7/r+e6YXxU+CPkEer/Hg5wGnIICikJE5F8McukYclnXK8JpsF9sBJac1g==
X-Received: by 2002:a17:902:ce83:b0:240:4cf6:b07b with SMTP id
 d9443c01a7336-245ef27aae4mr14851125ad.9.1755682638604; 
 Wed, 20 Aug 2025 02:37:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:37:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:55 +0800
Subject: [PATCH v3 13/14] drm/msm/dp: Add DisplayPort support for sm6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-13-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=1316;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=CUfovqe+BoyUTI1U5egPOGaqwOCo/lDF47XuEnGpvAs=;
 b=ekFdgiw2VFgvGPY0u++RuMC/OoE30pi/c4ArAK4euKoOaQd5xA/773GbG8DDKJIfnJZNmKkAa
 ++LEXlx15JPA4vl5eGl1FhBay0hnnzF2X25zr4Rxgu8ALm78V7VObo/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a59750 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=V_msf0f7WKJAu9UcZZMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FNPCsKqQaC6NzF7U7vZOsg5e1Yeuclsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX67Tp27B1ixkq
 cLuI7BYn9ejXeYUbfBmX9PwojhA3NL/Gr6maiAjiQZRmuQLNN6fI/XCDqRirHozAWkzd1vak+hG
 5GZTKlP8i0ZZFincA0BILoHRhucNVvON91uPaUtJDvFmr9qgMWWPvuOb/Xt0xxtAZ2NYw/mJjRK
 ZBL05y5rMujwVj9j2F3o65M6FH7ncQNTcmM4gUNHXrSIHWWCrWwosf0f2LCWXgAwYi0xtFBUBR4
 6POmrsYB5Q4P9gZbzJU8A7EhVJZxuoNYCiMcaFphU0kNfrTmLvuusP6iucQJp+85HBymatz/2dj
 V/idT9OZEBERPMpD5vEC6Hqqk8cS2xWxQDFyabrjuyZjIBs8G59UWUV8T+dMGeSX5FCXvpCcTNn
 zMaLi2hW0Lkm9rPQLmyDNWF9lyIsxw==
X-Proofpoint-GUID: FNPCsKqQaC6NzF7U7vZOsg5e1Yeuclsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Add support for SM6150 DisplayPort controller, which shares base offset
and configuration with SC7180. While SM6150 lacks some SC7180 features
(e.g. HBR3), current msm_dp_desc_sc7180 data is sufficient. Listing it
explicitly ensures future compatibility.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1

