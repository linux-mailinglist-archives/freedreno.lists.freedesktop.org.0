Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08AB2EC1B
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE3B10E86D;
	Thu, 21 Aug 2025 03:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUlmt6AA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017FD10E86B
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJWA5I005798
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=; b=eUlmt6AAuho5wdkr
 o4j6MR9QVgfB9gI8IylgS1vLDVapbYjbRHop+U7w+lk0vgg42JVRmjWb7RttP5eQ
 D2nT/7kULgkVnRetLcdVUfQXH9vvvvJPRZlDsE+3lNLe8U0w+lbrKAwhPvNomZAt
 NhrmDFu+4JLgJlaMTlh8ZW7ZrneTYiwO+yIWyxADuio1HVM1Tz97ly7fD9IG63Ad
 HnCN9IkRdb53FG8VnXbI2zwvjRd2CuFlZ0r4H5M4RoLogny2lpJE4JH/wAgM6YC9
 dhhhQySSNExksxKCuZoPDknaXVDsAsjhYtI9hDmpwCOPlxPyLQ80mXQUyYh0CqFq
 ta4etA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ckus3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4704f9dfc0so1481724a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747446; x=1756352246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=;
 b=T3y/wyLhb9k4CXwo1FEYypoUJofiNPP5dYacau13bLefpQMY+5MT5slKKvvB2F2vus
 Ffti1PdTTAt8mCNVQRIPPxLFNDB4djx3l7vMMFEJrraQZOlqY9HsBUKECZZ3lGxgv7OO
 WGUkbpbJ3DpGwTKPZcJetJaGdxRZgKNjz94mxI0H/D8dkbfzX6HS2FiitIAzYLi1vmuI
 e066S9/wPKtq6Rpc3gRKK6mdunkOtFvg6oxspQ/Qfs+Uq7VBzYa4psT2PHI3tqvLw4pB
 k6jpngOeBpwQtqKz19eGS8PeZmswcPJ4/2IKPuotyedO/pZ25sP0Lrj4rh7ptif9ZPHF
 onlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaU470aHcy14H6W0uxLwjK+RbM15LlY4chFCa/NOpai9hGCBH3e/MAa3SgHOdMMa3V9d3BK/ROTsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp51WvTb7yDkU+RDQZPEgTH2+gMeLcrmkpTMHT8Ppc/SzbFBN3
 cdKJkGEBQROtCWIoXJZvbun1Y+PfR52oGb0Jq1Q5Nn9OXPYWmeiTBDcD1iHucrfrSgHZDEIwi1q
 2wwcgkUEGlmdNnng58XLetIQHHPEsgsUaWlRmqVDGh9GPwWdWd6+GyLjpL2QUbo8+tcReqwQ=
X-Gm-Gg: ASbGncvWrjkXw1Q+1T1v+ZJl4qWwwXgQ74ar5jg0UT6xMpmnEIXku11YhUOF0B9JXzz
 pKl54c2DtqGY4eLdwk0UfRHRDobo35HfYIsAKSddfdYlJnvzjjJw/GFits7Za9EZbY8kPmk4VC/
 i3mQ5g5kWwHXJJLggo7PGW35gNtKftMNthVGTn6PYcuLWaK16Mwx5IXcKDvMlNXrevFC2ONoJl1
 nwzYWeicAZB69sDG2SntI5Evh7FcYeMZngC4OlJo1ifysJSc1HscYRNSG04la3rPiaSC5Kc0+Nk
 13LbUCCwqyNsXs+zgi9tcNWLAxbspLn2OhA2njQntciAbcpL99SYk5H7wDqW5AUoxVuSxnk=
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id
 adf61e73a8af0-243302c9111mr1308504637.23.1755747446524; 
 Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP7fH3nvIAuguK5uO0nZHBdwSgTrqe9xEtuGpzyBRAGzFnVbJ7eW9pMnJeNufd/3ZYhmSLEw==
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id
 adf61e73a8af0-243302c9111mr1308473637.23.1755747446067; 
 Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:00 +0800
Subject: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747403; l=977;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
 b=nIqdK5cwHfKA4OLfWyrt9z/LdtZOW4Iwetkfd1JMz89UozEsjKfrY5moqsraiVywkhgM6/qjq
 uGY5PjQ4rAWAws1iQ4pyqdTzZ2LqTHFXsU0e8v9ZXsffLRA2a9Ne3f+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: cLc0UsiTILY1-oiUt3xUc9RhDYMlgGu8
X-Proofpoint-ORIG-GUID: cLc0UsiTILY1-oiUt3xUc9RhDYMlgGu8
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a69477 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=56KCLgTT6E_AFdM1kc8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/phXD2yqW8k0
 2tTqVzF4gYHbl/TgAN4COJe9SUk2YPDPfaysA2UgW6iJ7izWl9zcDZkr66H/8jWrG5N0avPJD9t
 6d23ZbncO9F5intTFBBeaRvTW6ZGpteX6jcaq62LVYhEgtVV9YtnqZLwb+WCGv3qfin3Qtd35an
 L3mqLpZUHTzeyQAG0IU9GTkYqf5J6BtNnRjHKMml9LViLQtljHVQb46B2mUOR6iA96LnUqFRE/0
 jz8TgizVSUE9x57j91rS14pexMO17lg1lghDSIuxXnCyOXtd4AF9BHjW1z7fy51vNdybzxupDDC
 9n5HVxV96u0PgMOWbqWcM9iT3wcoPjkAzd/Om8hIeboTo8SnyIghhDbl3Zv++8Uw5bQDbJky7gs
 HzcTwfijOXSdmXjqruFa5zwxXPOOFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

