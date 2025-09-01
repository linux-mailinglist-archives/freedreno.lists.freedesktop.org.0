Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C064B3DF36
	for <lists+freedreno@lfdr.de>; Mon,  1 Sep 2025 11:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D751510E3F2;
	Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWAhe3A1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473E10E3F2
 for <freedreno@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819ePXr026353
 for <freedreno@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=JWAhe3A18RmjzDzZ
 Z0AsmrpBxizSatiAvThVXP2/Wmn3h8IfP14ej9OKyOd4uWbVwYKTGh5K71Gcxg5i
 AquS9r6CT/z5Xvpi8TucNSAOhQS4HOmXa4DUJM5GbQva1hIvLcUAgWBuIszMoZht
 78v8V1nrUwwIq638aGRMtOCjTGDpvcWTlLBZNdz+H2CRa8psa5dxMkivuI9a78sn
 GUs62Gz5jm3Cm4yQeqTUE+5EYEPWHxWlsFeZQK+tqwxwNpQVt97jAyHqh30q0sfn
 uP4PxMkeJ9ZqEX38uWAguaeJe6Bc1yLOlpgMGNuZ3xTsnhLrTIS+EF70mxtNYMTR
 L/1A5Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkc70j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4cf03610fdso4319286a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720708; x=1757325508;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=O4tsx9e34Qq1p+fc8U2UpL4ISleVS4XlSz1yeUOywJOTdbase5hQpIryNPhoZuFmMF
 X/TjwEGhHh3SZdflna+18eSKw1GspdlP41aomOu/WnAmmF62jBHSrPgUw/Uj9a2GtqFL
 TWHku5TGaf24wuR0r0q7O5jkF65y/pKoyLsFvYp7o/f4yTrby2R1dSlg3UgOscT8hD/0
 Db6mWsR7oy37vKubt7vS4EOuImMb+nwSO2oaFrDmqzxmxQE10JKLNOD1ofwXCh/PPLxo
 75anM3/B2+F2k4lwk3fGYcOg2HPiSPI6MSVFebHzIRsp4vL0wNfpwu5b1XnK8dgYDySu
 +ULQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6xbJKFwx5L7iBm+7nXsgt9OKF9sXTuS0/T+tivWthuABorq+I0RcDzIBc/OouENDYP276z2VYI80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqIu52Yw0xyQr4IibGpvf7N31TmszaFBu1NwuWAuXk+UAQb+QJ
 luSg+oNUB6vJ4xIjNmgfb1jMi5kTzF5DufwGv0/yh8i0obakhBbTM1kj/7x4O7fptNpjeTcwhrP
 dTsVxsGNRU1b8RwY4Oogz1EtwvaBDJJqUFVeZkbON39ScAxG+J2BrgA9ZUJz17UDsdTmDAH0=
X-Gm-Gg: ASbGncvPStk5qRMEgBLyuwS2NGEywrml0aF9xMExKhr48L6mQRSka+ToOw8SrCuTFbz
 Xj49Jrko7SI6qYdVOSjJhZt4vN68zPoJQHrM460NgXaoxM/omfQScxJFlQqbyaFZaQFreAfgR0J
 ITi0G0Ojnu0IQcWHRFCs/dma/GAVn2HQunLW34G4fkwcKJGx/JrQP4zaSjtuhlIdfDnGJ9IgAkU
 KKAdudnYzqgxWsGgAzoN1+5EduYq50S1vc3RDO/cIW+KeyoFHPpEW09mifgpng2rlKOHMIrqfea
 LoZPDVhxZjEFCx8PFYnhwgr/60mz9f1amUwUxWUP/vUjhsuCQbf78JWNOHRcYYopX/Zgteg=
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id
 adf61e73a8af0-243d6dd56acmr9552547637.11.1756720707586; 
 Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0MoPFSikRmyDViMrlgzOfYeCyLjAV52qLyprlfZ2BtiAd4BuV9Kdl5fEac8p72y1J2WvtDw==
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id
 adf61e73a8af0-243d6dd56acmr9552504637.11.1756720707109; 
 Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:32 +0800
Subject: [PATCH v10 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-4-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=nK6UeSTKXTGBlXsu+2YyHgK746mWAkfKz4qckJV50Abj9bxG53cDZdJiYOqMQxNf7O3dZGDFd
 9T377LelwR/AzsUUYDWRurQHcDtjXdMspfr4wjyZmrzODmxcjjtqknA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b56e44 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 77kI7EI3SAC-j4TInQLQViiBNttv-ZW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX/TQX/L68I8O8
 MyG7+HTOch0hrYLPD7b1I1Vo9M0WEAs4aEQ43iNd1qk3SNJxyFQR8VkPL/GBZisANLeHY2wl28N
 wmR3gxd5jAvTo58oYfyIjIW8Da9S95SY2ns9IIsNR583u5VPTFx2ig0ijlQAIax1rCsw8UqJcg6
 dcmQ/JyWRW30qGgeLXEc/IGEdgrXq2hggx2nGEzAOuPUSrdEaURSrVb8DL4iJtFqEPiQ2tzaaL7
 oXlmJAD6AKIkTly+imTSN6fGDQSyyNgzW7P4yXr6dYwkSaPTHUBAUR64oKcMiZR5yWbwetp8OdT
 +5kais5M4x5kDc/5ChxTHqkIAiRXl08ByP3VvJgk09JlEw1EfJ8jnKBbdtlBvCiT3omuAoXwvQq
 I+YOT88f
X-Proofpoint-GUID: 77kI7EI3SAC-j4TInQLQViiBNttv-ZW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040
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

