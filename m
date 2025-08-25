Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74960B334A5
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 05:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10C10E10B;
	Mon, 25 Aug 2025 03:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJXT9R5K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AF310E2BA
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONF51W014293
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=DJXT9R5KHnbXlOR9
 HvLpkfiLTlqx8SyiCyhbicplyJ8lpIudXTWHaJBZ9uW4SV9xTIuhi4h6Oo4HfjBl
 7Qmxxp7v4GyUHylQb4KgJQk+pt72Z15Hjx2KhzDXyFdH+MNus1hPdPyurrNoGHTj
 u5+cxAb+qIorSGCG8rJwg+ctPjbsXtqGnDPT2QPT2ZOy4S7FR8MZiCIaxNeIFqm2
 fC1D9TuhP9jg4ERqYxiptJ2KxRKCIyR52Zw7/xkniz2rLDyOKaUhTcTxdRGc6pKj
 XlDIdKf89MZ9UpXPGtRX21HqL7VblckPtDLNRh/Davv7BsSTA1vn2tQxxpLYHu7+
 QcEmRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x83h3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24458274406so87080215ad.3
 for <freedreno@lists.freedesktop.org>; Sun, 24 Aug 2025 20:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092963; x=1756697763;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=IP4sttrmcUU7ku3kNNyqDTtjXYrhoYn/4a1B5ckpvHFEn5fdUmv4IsOlzANcAINAxT
 CNm6zl+zEQQzB4kY13M1aRYW5r2LEa/h9KQ1tcdvnVMqi9qH96Jyk58vhbZBeYLdAvpw
 VHV1wiFmpEZJiIWeySYFAR1LkeykgJsjELvKugS3M3LJCVvKLkOXLTwGR3jPFijvonXj
 RpSOljLsLlK7liiHBCzYiZu9HZjGTEr8kuFXfVef+TxBgHHie7GrEnhz7fW1nYve61Y3
 Z2uhR9cv/LAngQKZjM1nCo7ouE5ugOv4WCTqo+SbqzkhzXwOhiw9gKUcGem2edklE7OX
 FMKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgDluXUnknw3ULj6prBGkwV1tmWxiP8osC3av3jISVXRcTG2+MBvU/gUcY/YcaV1J7UAaTp+lgACU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjUq9tpKeW/x33FZZPrWHiMYhCD2W3d1f95FLbNuSaG1w1sMtg
 UM/xGDjQA6QmndCfexYmOqkvWPYIbY0C/GJPKWpQ5lmEVFkqBNtSq7z7xRPo4BnEzXx+xvtoKa3
 V6KdXvwwrckalUScTeyOzkWWPy/PavI+4TTitoVc8vaWapRgd0l/aI1DMp5NgGMZ6p6puF5g=
X-Gm-Gg: ASbGncuC7g0tNck5Kr3SvaVDGjN00yrljQnHkJd2RzpHfLBU663Ipappjs9F0MLXfHL
 XqRKOtcj4fSUUi4ftlFHYkFxbea3FVO7oG1lz+TuI9FfRr5i8uQz2Za1YIt7Tvff+98NkXvMUz1
 EXF4NVKvcuEFe9Rv01z1KnGH5fZA5OYviCSTwOaduf1f83xy/qBYuq8Y4Tk8DVbkBgDiUd3wLDj
 btr0McDt15RT0MpeTL+l9sKQD/JzhPgAceU0xkuZs7V68oN0ZAus4aAnkPb8oQqGjZi52mILk44
 NBnNJ2RWp0b9YsVOTpUwBLJJOeeA+3sdgLNxMk726FAzSkdp/t0xNaFhIzCyv4drLaAv90k=
X-Received: by 2002:a17:903:3c4e:b0:246:24d:2394 with SMTP id
 d9443c01a7336-2462edee975mr127358425ad.8.1756092963176; 
 Sun, 24 Aug 2025 20:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMK+ADbj8IibkXMvQhzNxRNUL8Vw+7sUqexRIIq/HnlxR/jdalo1CFv7QorQ1UzxMgNEWZDA==
X-Received: by 2002:a17:903:3c4e:b0:246:24d:2394 with SMTP id
 d9443c01a7336-2462edee975mr127358095ad.8.1756092962709; 
 Sun, 24 Aug 2025 20:36:02 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:36:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:23 +0800
Subject: [PATCH v9 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-4-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=RZoweSQA8ut2a4sjQc8joqF1yqfWGozxepRs7xCi8mrDj9AMGr2R2uBJ5UsTZWqRa+fFcOCcT
 Lq3oefRbg3FCtvWOFYMAZT5M5XY5q/qLGJepIPBPhY7rdaiGdTA418a
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 4Im9TghkiO0MrsgzEsYe7qJVU8dmGlvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXwcBEdXJra57c
 lSKXiNlk7rT9SjUVr1ajW6h84QlZcea2OTAxfJmejGQXSfodoH4HUOOkef4UAgtBlI8bNbXjHXX
 q9Gn+qQ7t5SYlOvcu88W3TGaqzoGEjcmR1S+P7oETzPU54K0g5KnQ1B9vCmqe8US5UaIB8l6VYn
 cpWplpRUpBKybY1wHcbzNQd/BmlXPlqF/h4XpZGtOi1Gr/GyinJZdrv9JXvHuMhw4qIP8fyDRmX
 dyYkiGPpnrgOpbVmHG5g3r9s0KxCwk6++c0BlNHPQqXHXtILW3vGU+a9xOrrArnuto9Y70M3oLK
 o6v4VFRXnyKclF957tqnizZauvV0M0+phLieFtkZjznh9vME+PCllwEKjF3gWVpj5VtOG7hcGq7
 M2jDhBpK
X-Proofpoint-GUID: 4Im9TghkiO0MrsgzEsYe7qJVU8dmGlvN
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68abda24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1

