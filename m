Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D1B433CB
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 09:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1F10E992;
	Thu,  4 Sep 2025 07:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkWJDUfK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31BE10E991
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 07:24:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840Kf6o029700
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=gkWJDUfK/EmvHJOp
 Il4ZQV1HfyFRXs2662MVXFJ4c5Nmx2ZkLS3Xqw3rMgecHgvVVGkpuIzRXqSAaWrl
 eyXb8wRZguWLa2N6u9cQOte5cBqL/xY/EwsUWWgMRzC5FLOXnFVPgm2Rxd+s8+9+
 fU3n+/VdqBw46eWok3GBw8G3LESkfwIy8va/izdkYzitN/9cLaYwUVq/jznk5oRa
 QD+Wj+yG1KqjnATqoiIaewOlcCn8oTmMh3cLcoBlqn6KsaBgKFBtyPe9sy+2EqW7
 vQd/sAJ0ErLlyqduLPc9VlofPrcl/9ea3A7YaZzIciz01VOjRS7z7rBQX1d/uEPP
 hZCGSw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnperg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 07:24:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4c949fc524so523938a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 00:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756970651; x=1757575451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=jaGK3B0etlyqXF+C01ia3o7q9CXvIS/mktKQLACz9eXVq+CzrQ5QyC8KJWIboBuzLe
 MjYQ/O/cOsvLsa1R3b/b9I8Anyd1pN8bTrPQM5LDt+gvIuoBHY38cWGl23gtUoYdzlFv
 BC/KHOi7+jSViwF84l2op2EHTjcXH18f53OPcCTjO2HDjjtut3dUKk75gAgdBKDH15wW
 aq0Mv2XUj/rtp6GKUjmB5t/vJ3zXS+We7sW1+jTmdb0xBAEgl/MDyfnjlQ9EGPbhM6Ir
 IoddJpTOG/oKzvOXpg0hykSyxVS5LELBYfxeZxL/Lmn7OL+i6YGyDgCLdjTnBtoKklzk
 eqGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw8TUhwWSKRmFpv++6qQLKgFU4ef+HfWDhMUsIb1UciyR/Z2hhYk7izlGzi2zzy7zQtiXd4z+xkIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4NT50bPbkRhpmuMt3XZ0iwzPkOKeIkvoi2yupQYacsCFdpjQQ
 Rc+PuNIaOBsyYUG03GsdRN9m2cQGj32KrAOPsNaYidaAtVRgH56kHOY3Q9XuGaDsMznUnJuPvTS
 Z3NRBbg/oAS8xJACm6oi/rl6qoeKqDV8cWTtMyxqJFTqbCvqlaDDGFUcSeuEdH58VY3luOv8=
X-Gm-Gg: ASbGnct2YK6vzyhpQrkLhAHs78QrFWyopEX0IpZTGAzk9Tp95Bp6jIg2yNxbKN89MBp
 FhkekzrHkB8EozntYPMFz1xtGbiPuc8JM9tlaP6/zI68h8oPDWkNAxJb2VAhpsf7oVJHcGE3nWt
 XMpt+oTdQVt7M6RIaDz7CLnE3mYk4GqHpZ6WO4jE3ahRBX+mEmUe59QsAATHRDH31hKaF5ryKOw
 poss8TR3fH1rQi781ofXanYCdcRY5V9PbNvHHQWipI5118MvUAVPGmHmN+xSBCzzekP10SMz7xY
 eDb34u2ensZSMLBhP75TPxOxMY/4QLmkykkwtc+MjqLx5T5McwGGmDp2vK43j+bFR7sp1h8=
X-Received: by 2002:a05:6a20:4322:b0:243:ab0c:f0f7 with SMTP id
 adf61e73a8af0-243d6f02e59mr23320011637.31.1756970651454; 
 Thu, 04 Sep 2025 00:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ8enfuqQcqlAwxhsH+5qitYBcmR2no0dT0Gse689XelnQPF9r7les6vLU1Q3oV7U2TZEQrw==
X-Received: by 2002:a05:6a20:4322:b0:243:ab0c:f0f7 with SMTP id
 adf61e73a8af0-243d6f02e59mr23319971637.31.1756970650898; 
 Thu, 04 Sep 2025 00:24:10 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 00:24:10 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:39 +0800
Subject: [PATCH v11 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-4-bc8761964d76@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970611; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=KWYVYnoqYgq/copKQInvh0Aj1bnq6K/MF3klLEorICC76+c7mfr4OZNoUWfsI0R5sv1eTtWYe
 nVQENoqS8xYDc/JIPq98MskOGVTXkgR0GuWTiXIC4qigBzXIKpBSb/C
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: C1513cdc43hidHvNXpeNCIBiN77kHh2E
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b93e9c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: C1513cdc43hidHvNXpeNCIBiN77kHh2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6rliPh0k02ri
 7EnpgQ337UDxIx5k5GRR+URacN2UiGBe32ALZPx0BThN4mc81E9dpS0dESkxelCcycrfrU3uOXW
 ZzjLip/VEq3qJH0oHY27+Z22QvG85mdY6P0Kn7jNQb+e4lpWDHCfqeDpBW7wFpGMehCBkYivfyH
 B2zQX4Ii0kxJ2lw5ZR6iOubHZgCenQO/AxGmnvztfdJrPJxcAcums3PSdqwFwqGTkiHjK90jo0f
 nR7FZk/dbP97K55YD0BzAOPZ11LscOcYkdLCqu6nF1v9ZsFRJ/eTKvXV5kkctlSysyeLXGRWYPl
 lv6sml97w/UWkUphHGdDHa0/dCfeCKOY5M6fdpPjx3VG9ooPp7q+ircBB3SAtEdi2eJDSWYcRH5
 jQOXSjuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

