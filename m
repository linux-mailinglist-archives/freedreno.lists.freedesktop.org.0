Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74DB097C2
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 01:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50910E8C5;
	Thu, 17 Jul 2025 23:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJ6yAY0O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C0A10E8AF
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HLjNMg028066
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=; b=hJ6yAY0O14NAP0SA
 OD7RIk1xgMFCFV0Waxc6glqINKfqNrshKx7X0m+j1IhGZTgu4SKIcyaO88U3fK93
 N/RKgxJxcUmMYorqd+tANjfAmIXX2xtm3ZsKQ4OGannWCaKJIFYdvWfJbaRlo4XE
 3hGm948gTzjskqC0wBuUGVM432JOTHdn510OiakPXvjx5QkFPic9x1vCooGbZUQ7
 f6/1yaSjf24JUbcCnCXhx0yq9e+s2KCzPX+ViaqgfGrJLEyP/8erLk3wZn5xF/R0
 KKRazVs+JRI6XJEmg2toHA2p/Lk/xI+DYUvClM/8Ri8L5sG3TbDtvgmo3tj3Yl+0
 e6vusA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh61q10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237e6963f70so22934995ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794935; x=1753399735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=;
 b=t10j8WD9Rn9qQb/LLUHh7l0wP7AlKsb1FQy/quH9xoQCJxI6CEyjlN1TyZ9aCrow2x
 xEF8h8ut1ivJ1apfzkzVWyb7u6LaRtiVlAyUkh0UKtqeFpnGzpfLwD69za/7KUpjAn/S
 ZXNESjoB/Yr/zXUt6eG9AxwQL3ctlq6ETKPdPeIwL6U0HgX1ipREIoMb4xwSluNHaTl+
 s8grtBSjsOhr+xefLaXr9D4wWkL2lhTtt9k1TzbfqljfIgrdk31uY+qeS78ws2oCDOUk
 X3iIhaR/aXNt0qdvaMmx38ys35GJkyR0v0gdKbxlszc8N6IwJFVS+QjKQsU+PxZbt2kq
 fZrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAMFIbud+07aqkH4J7DvHLJ/z75d1d8JEzU9SBAuiE+bh1S22RW2UKgUzAPhMMEeLADQ3bZr/0lco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX6NpzzBRZ+TLFu8XtRNcrprb2/lS5N0iLrbmAgybu3DBZoItm
 IijpZOWviXUc6aUHu6a17BbJZidE/Owgiv5YlKD+emXCILO81wMjN10HopFNcIfK8dtaeyHiVUa
 ytzf9AclencCiJqBDf97Rapr4zkNj7zOI6LsKEyUw+KBpRb6JcgmO4ytSMk3ec2jGGo/IHA8=
X-Gm-Gg: ASbGncufW9sPzgIMK2AYzB65En1S4E7kxRBsnwlv8ve5IhOLXyU9wSG1g9l2kWma9Hz
 j0x7xoI5iIEgnyO2s6n7ucpg0eZrLWVSYdaLffFYMVaKFCzPcyHLjXj11nuBspzAWqhaw61Hnls
 QuykV2FcHtz5hXUUjXRI/1VSEfDS47wI9jPwOkr1lv2hu+v/G1mGXAVYkGhXM7AKoCuz0trgUMI
 EypScAS/4h87ZfcISFeZwkyyVDOIs+4m7JfGyBLOVkS2BGNu3EZKnDiSYtmtkEM1ydAcaUfqJjo
 8G0zSMh0wwuG7n6JYKkn7Ij8FHyF+cnJ7vQI7L86Y0tN44OCXldtWEyQyVMOOp0dSuq/X9lClhE
 p4ZOS91DOE+eGc6G2wE+iJHj6
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-23e3035f782mr80881075ad.44.1752794934703; 
 Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7EY+GZlHPcNHVs1AkXZZ2eIbMpFdFBa4h83G1a5pVhnBvbRDWLwMJEYWXJSA5sRyT8Jqsg==
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-23e3035f782mr80880715ad.44.1752794934261; 
 Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:44 -0700
Subject: [PATCH v3 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-2-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=911;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZ2y2IyaYhBO6AuOxdT0mFWtWBLRRO6rCaMc6lj8Ipw=;
 b=JIQEhhSfOyDoyV7zPgQsd3A3ppzobltB2q4r0El3ARcu9XmGhKVnrWAmOUE30VXrx8yJGe0zd
 e/IkHZCE9atCpqRREuhMprBnDp3dtKBR9yS3h9V0DD0pruyJh5ZbmIW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68798738 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sge8M0AVKL66gN0tLIndT7Dqw0_oQZaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX2uQHmINqFKrR
 wPdFkLAQrIx+I8c+y6z9+OJ204O66PCNBTpTPohp+Z8+WMxiTyX3yGIi3MP7T/6wF9QtsA5Uqcx
 CeorZi41ak+1EgM5WsC0Bt9qQ2VSVM//kpmhmar11JSq6in/LfZGWZX2PKaEe+cHPgcz/NnpG00
 cCdoRrgasgqcTcnhOfPdBibJ+cCHJ+J19sTyQF5A8pWgV+aTP1zVMlHJtHEi7PFFpGQgjXxfNfG
 3fkmbZtvrO7cC9r3A/JYaHm8eqckifcv/T6TGoqwTtYnMYip0k484hIaLmzgPhcoo3/X5+V0kxB
 5bpsE9hZiCf3HjTC3MiO4OKR2vgrQVhj9VwOOyTFSSZfS8riWTifBMTAyHMmR+eW+mRVH7fJq/p
 Z02jEogjRMGTAudxnBk4thwcs8drAuXp89VlVHHHY2uSSU6tz0RC7HCF5coh4Vy/ip+Mf/9P
X-Proofpoint-ORIG-GUID: sge8M0AVKL66gN0tLIndT7Dqw0_oQZaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=899 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.50.1

