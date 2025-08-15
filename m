Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB380B281C3
	for <lists+freedreno@lfdr.de>; Fri, 15 Aug 2025 16:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171D10E96B;
	Fri, 15 Aug 2025 14:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bU5G5Z9K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2B10E97D
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIukg027360
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UeZP5gu8Ml5GeHi89IxWND+YNXl/J6sv/jZKNvLERcI=; b=bU5G5Z9KnhpOrGXE
 4UD45Nr9mfzRIw15OSvDy1iqRUnJUJBFSPo5Zn+oRgBFIJ/YRpPkzpinTwMVcwJ7
 iWdHKCC7nFlbZOeQIQZBcXE8sJdQqPVt8ggik+6vKNICPnGieJ1hjWz6qjuy0V7E
 VsbxPw8yMD9yga4wZ2qpXb91+DGEUlkAagf7vBFq8s7VWbaovrT8/jrdPU3oU7cZ
 B4PrFLnjLV7H+hwgWfOEr/6+q/yOWFGZPheACSku8QNrC1JNk/1vNWUE0PJ7rKVw
 byyHtCKx6a+PLBoxd2F5PANh4q2DJGRK4f7ASOuD2QUG4OLjP2X5LXJnn5Uhk0oE
 EfrnLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t3fmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88d99c1cso40042506d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268243; x=1755873043;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UeZP5gu8Ml5GeHi89IxWND+YNXl/J6sv/jZKNvLERcI=;
 b=eY5CM3E3Q3MUaqqJnyCZiQ3I4U8+BQy+pO0U0k58SU99iOosrn6vD+feT88U40Py0f
 zAPR7hHIs5ltZ1jrur1n0nGOmH6ikqT2x51eK4KQ/uy9aN9x29IzzXTxdhLUZILUAjMZ
 tadGGbt/Tfm5Ye6/jK03rMcvhSls8NhVWwEnDxmDkfbV93p/SjDpnzYR4NFUCaH8fqfA
 9l9lCYFw0TrEj/BVhoyttkP7nDpV/yWaNuk8/zDoGQE4xO/LbcVbujlkV7YXI5LTaz7X
 rf6KWPhCnT9z4xNMoHQ4o3rBZbEmZKl8TiA8C+K4wfWT1G5iginLmyF6HiWwJ2dwq7GB
 9R+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUrzO+Cuo1oI4w/Fb0OOtcgj7AIOiT7dbO7wzRHIGgIOYXNyk2q9JF2hvLNgtm3Oa5oGuZILgSpQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEr00/tnlIU4BZJF1UXPfr+484Bfzmkht95rlp9F1OJ8StR33B
 kOGJQ5O55K4yaV6q6U4vfq3YAy9xDyvnaO9k5jyeWIob8MyvcTyw/DP2csAA/eGBPpBNTx+RkCG
 1zsFpSGvPRB2jZpFSOLg+LWRMDF59NJAuGd9obwdLfBEG9veUhl2bsugBnpc+CbJPJu558NI=
X-Gm-Gg: ASbGncuy2qyaLDJifhtrcPaNym+g06KgPDpa14uq4EEZcQT4vSlBOakdVVIp/P3Gor1
 F/NB5Cskazz9yd+X/ifqtqFfT1G7AkSr8ppmQMCQ9vqIDjWVt0gkVdTAH6FF54ltWoohz/FtqCt
 FLaHFNq9u6/RLjUBdG9L8CWCSSoYPjFgevZ9wegNzvYTVtgeGYeIv+UHQuFPo9XL32sSPGM10OS
 5gAKyST6dw0GQ9IhMFIvbgD3XlyB4p7E+x1dvJXnAZGiLrlMCE3r5CdE/FIiAO2yNeF3mhWBOxu
 guiIzBQ5TigplUJMzylOIv8SATSSQGqEr5BNtgsjO92/TNcyVssyD0RoMgwL49nm0KqtyGBoVG9
 ELCFhvqSmcNY6SU+vT4gJE5qPFnoqA8IYtbAsfkerayz4Mv0ADPnu
X-Received: by 2002:ad4:5d41:0:b0:704:f7d8:edfe with SMTP id
 6a1803df08f44-70ba7cac75dmr21978106d6.51.1755268243206; 
 Fri, 15 Aug 2025 07:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlhZhbyqG3cH5xHr/mni5fGRBnmZIlpQceroahyM/jC/fuUgwrUY48x67IMWRmk7AbqVGppA==
X-Received: by 2002:ad4:5d41:0:b0:704:f7d8:edfe with SMTP id
 6a1803df08f44-70ba7cac75dmr21976876d6.51.1755268242086; 
 Fri, 15 Aug 2025 07:30:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:31 +0300
Subject: [PATCH v6 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-4-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TKheeYZlrDlE542Y1+bR7LBZOvYB5G7ICDZN7296XdI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHRLofGqaxwkLuQ1Jev5FRpRuGH0QqlMJ6f
 emRF3fPDW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1eKkB/0eb5Ex4GfTYVpAF32D7vYX1W9cUNX5JlubXihv/127iTGUWyeTQwz4w7vttMgxwQM9mUj
 b8oB2v42i5O941rUNZfgmyYYH9hwUfF54Da+Aybf+GChMXFSZ7kTS1EOLMaRbrQ1WHJnImpl0Wg
 DsC+euXqouEL4Bk3ADH+NVQeHUhbCFqBtzGCyoUL1nnVDcQbzDal28dXX/LpqQT19m+8zckgbHz
 aWQWdu8OVvwQg1v3w3+2xXWlNXbJqOJ/2leZLdARMua73o67jYP0xWVKlNCt/H+7SaYZvItpucO
 /rRUYDxiJwOdWocIPMwDUikdwK3k1NRgdqg8curwHYNaAt+d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689f4499 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z_J9UYLRh1Z27zAtdgnDkFLZ3nwSuwix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX41tzOgeEfhw0
 bcCMcIeu/cfMd2WDUlyZGTSXJHoq1/tvUr7vy+eEwmFgChLI8G5lS6aVZtI2PsIK2po2jfMPrZ4
 K0diVygh0vGVe6H+lOOgp2e4+eEZ8GVm4dyEM1blKGCBe1tKmCZ97+IFzut55FobwYMvm4yfbxh
 E6X0A4TRCJJFfYgV3VGfhV5VYf5BSthSNjagKO2uO8oE1bDL/rKS7+bBRSx2frtQc6UhhUqCYVw
 1ctzd0fbC0keHkThh3XkIwRgRaQzwb6mj3wHDiRHYhXP+G30mr6U0wSZ7aO3LOVsYmwZB2JaEAf
 stmW4m4FJ57yBmLoKveNHYSMexbZhZeOkuHuCbR5ZpJBVVaehY0WuCEX+199mHaVfmEPLGL4Vjb
 0Wmp4U9+
X-Proofpoint-GUID: z_J9UYLRh1Z27zAtdgnDkFLZ3nwSuwix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 55e37ec74591af0a1329598f6059475926fdd64e..352824c245224d7b5e096770684795625fc9f146 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.47.2

