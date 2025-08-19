Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FBB2C297
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68EC10E0C1;
	Tue, 19 Aug 2025 12:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVz1uf3C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F5C10E52A
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INj3RQ001951
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R5/ed+iMJVza84RA4CmOOZSSACg+IzN4IYjyPBClVDw=; b=oVz1uf3CRu6f4Gjh
 JnK6KXd5EzzWQnGXvUqANguG8cz5HxvpU9o0TcUTmQukj57RbmJcGW18xVKUJJnC
 9+Yq2fhB4ju3JvGICCHrZWP2EDcyxFuYCuzxIbawxELhzSCvkOpO1hFz7oAhLCmk
 TSxP8rFGcOQ7vyEb4TTa8qh08HVXJW2o+kB0DDPFBCh80ApYOTeuiQk+JTGnhnvx
 Km6US/rQb6xl/1cqBATmZ5y0Njf1Og/iLuL0wSz6AtXp+ua2cb3m+K7yeHhsZ+QJ
 WaNKDp+vkH72H5uwaW5v0ek4tF/W6bqAq5WnDM4a5fbas0SDQMrDBr7/ItjTh9rV
 +Ha6mw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vhyu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581c62faso50923655ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574476; x=1756179276;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5/ed+iMJVza84RA4CmOOZSSACg+IzN4IYjyPBClVDw=;
 b=eMq9+mCr86xbus52R9NpiH19h4qBxzwIEKOdE64PEQ0CQBvhC7VT4X7xpbFLx+6AwE
 GD9GDZXcnxH7E9b77hE9Km9djA9YyW7skhgM9xlfuYo+OsG/DpCh8oaEFsC0f0/Klqej
 8O09x5YTqVd6EhZeEhG+njzZQlhRUj3Ad/g5odGpvVsEWUeV54dmR51ZLmes+pbU0NJu
 RT/WJIO3NlIXNLgtKKLWWn0VjMoeFiGsEgxLFn8CrcxqMzPfrJ22cODz7r2JBuLCSUAT
 0Q0YnF9TD7uyfCivxlMFxGO/tNDtC9OBWJ5K7lCR/eNfTWkEbThk0mJIqrYTTay6G0Ye
 nMxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKFzaDRLzm6s7eWS/daHV/B6U7r7v62myzIX5pP+2u7YDSjzAD0ov/vn68naXDcHI+NoudD/4Qewc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnjeH2EzsMr9w2I3+idaII4w3tcAxAy0s4QrNJtu0LKRU8OsXC
 AOL0tJsT6JSpllrKaO9EVQzWtLNhw6Zxh1k907+Jbomo8IUBpVt5kJTuXX4PrmjRZODR6iKM9ur
 TC1iZqYlqtlE6pWAInK+k38ZwoxkrEeSdZ4RzoD1ly8+GkU71mP6r23kpPnhIYnGHBmkJmkc=
X-Gm-Gg: ASbGncvQshMEneaMBjDGVMpFVV0oi25pPjRlK339ONj9132M4q8mhAydV2d4xi7qDj2
 ZcuZ9F0JtKI5A9Lkjz1N+luna0qruAIIuegUD1RBLBW/J6tqgYzfLo7B48KhIMqM5Njb+YDmb3L
 0OVWCCjzusltMAmu0fbfZbRaDfCX07yoJ/ukjWOtG2ec2pM1yOloZGRqI0AlgE9u+q9vdt+r3Tn
 2SRmeAfPjkOuDx9h2QTl+EjfJG7BGPNtGU3FajIqYVGZuOp8CqBE6rZp8ZolpCRRtW3BUwrNxr4
 CqOM3kA1m3lr14ymxtYVFMGEcuyADOpN8LsGZNbjdFG5VduWMvYeKQq5uIZ9iwRrsOL7Wps=
X-Received: by 2002:a17:903:1249:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245e04ac757mr15321355ad.38.1755574475926; 
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeF3q0NRFaqzmeniqpQaJM8C07r12p9EeneZ0E+iAYto/zETVgcNSjCv0p2TC+5I/zykn6ig==
X-Received: by 2002:a17:903:1249:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245e04ac757mr15320805ad.38.1755574475483; 
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:33 +0800
Subject: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=1239;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=PkZh52tFVW68m2fUUsOwG1KUdbGeXKurw+4OaZvkX8I=;
 b=dQ6aru+yQ61EPbqt3DsNB3TZCLkB+30rVHlgf5Qp0xqAZ4vNfPSKD+2OoesGCp3xqCbOVmBvY
 qnw3cp0Vl/PBskaHMLYtoqm56M0lLnVkiKAh8YdMn+BnF6esphosG4P
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX00zIGclraPg8
 cpES/B6WIpGrNH8o0s36JEoaREZqSkiKjJngJjqHWDKqROFNEUTfKCbbOS/TXkBAHJiN/CjpzLy
 7sBZYpLDsv3/6fZi+6AFcn9Skk9GbKF5ummLOChZCcYEifcrv9mUaYh5hl6Q/bcHeryzYTT62IY
 gfkJhFlC1n+hHd1bbTxWgJmFzo0712gN3/oebqVLI+W1DQp23IoULkBAFN8Um43U0uifKVIUWZN
 ZXeMDH/Hw78Zk/0fsvvO6kIyume+vDzlglgxdVYyOCK5/G+CaWIyl9n9LlYISzejvBLlkc7jtTR
 7xBGQ58bPOoM2mJV2JKNGAgwnbVKK/zMkGJ70n3fkM9he53eB1S0rDWkAvtxkllOGYmnOhUqVLo
 UVYRKqsV
X-Proofpoint-GUID: EewG1QvrTRq5_AXAxGowzVXoLanalbHD
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a3f0cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: EewG1QvrTRq5_AXAxGowzVXoLanalbHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139
X-Mailman-Approved-At: Tue, 19 Aug 2025 12:04:42 +0000
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
be enabled as part of MST feature support. Currently, using SM8650 as
fallback to enable SST on QCS8300.

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

