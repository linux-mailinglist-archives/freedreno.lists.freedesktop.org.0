Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7154A65B39
	for <lists+freedreno@lfdr.de>; Mon, 17 Mar 2025 18:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646910E2A2;
	Mon, 17 Mar 2025 17:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWWirmMQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DB310E443
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAmeNv018687
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=; b=JWWirmMQI6Ri1QBh
 jLcs+d3S6OS9nWB1BoK8rqbgK0ZRW+LPNG4SDqcOS4aOFcNTAk1kv09BDaH7EclX
 24SnAkGMwqXhuWLnZd6mdQzfiCj02wnOrM/nksbr2cDm4ZpkyJpOqmd5UNx8Fi41
 yq3yFOeKettgJJrb/DVbHyVEfB/lakwYr6ATXBePYfsJM7NV1SaRMVeQGc27ctgu
 wb410LODnQjuNKMxLOlF6yVKZVClY866982Qi2+9/gB97tc9HqljMkqf2uR8hMDW
 TFotjCBHo5mkrOI1wVDkiRZilx1g2tuIfVXCoqViNQTarWl4Tz+QGYgphnK6qQtW
 Bx5JqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4nhtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e91f6bb296so89039766d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 10:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233506; x=1742838306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=;
 b=xONJoabEVpr++s6+xm1/zDTzgGbKksGnnjbbT2qxbMEdpkBTO3kAYGl2+LeyejbhKF
 GxSAdMI3zHxzv1Sez+PRFrBsl8wIZeGVdhoz1W0D1klKd/FlDfO+1zNx4GJe+5lGWhLO
 LW0Z3gFVaDRMbGIUCClfa32FDBJp99BmYlMxus15uNLAcE7/T9eOZslxetPeR+Tu8a7w
 F4ZqgDMKIZ4BMAEIoPmuJqSt5lhYQ/gk5tKmHMA2JaxJjGVXfXGki1FAQ3JSPQBXep8L
 CWspXZD+yuQhesT9CI9fIJ2pmrAy2ZiVA+RPqq+eJB6zL9Xw0HxC2mtCC1Na9Xeootn1
 uaXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbzoj9/GUH/sKJYDIpARS3VoHWDlWr45oxgi+P3uQDS0VShwzlTrW0dZAUU8GiM4R3iy2z5EkxAI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yweb+gA/qtMNSlmFzjTt9NLDIgCJ9NfVNgSc2pw8X5HVIMBblwG
 bCLBs21jizXhojQEncJAXxwc2MUBcmShLSuMpsbIezpTnIjDn3r38uuPrarmSLmZjFpIMcdcT7r
 pT6d3WMfzILOYgYEgN1d44L6v1oYXX9Nab4XRQe0AXzHr16bqfrwbECQVvXber8n/Lik=
X-Gm-Gg: ASbGncudWVSh67+45wC96CFk1j1euj8DdWz4/AlB1BZMRGfLMNSv9JBRXO0PDERh2Os
 gY4DQ1SHp9l80t8pEQVa3PDv+j+vod6Z4TtfAPWJ3P36gsctkndngrA4TPAXdZW1YY3kLf4VQl3
 z4lf5g38SsXHohwqhpBxe/SHZCryUUf4+SAGX5sSPXOjw+yQcEjh8ovENvcgG5gpWsZg4C2N+pU
 jbPp0Qv4E9XBCLmoBa1LNpnwM0f7TgKZeKYP3j27pGXOp6nolx5xNcFt8IT9goCJmlxpaE9BaJS
 mVtWM9CZPaV4EHe086yS5r5tV9p9gijHCBorKRYQYeG20hWf3H/TgzJEoCGmYRQ34LXH/qix4FE
 Q6j2O2Tl1PZdRnHDxVaC79e2TzQz1
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id
 6a1803df08f44-6eaea9f428bmr220911246d6.9.1742233505925; 
 Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXtmxTfI8erWiUZ8NMB+CxvpTl746d9810IAZ+A7Bi9XLrZgZVZ5iDDqjYNP9tLWfpymWykw==
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id
 6a1803df08f44-6eaea9f428bmr220910546d6.9.1742233505496; 
 Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:45:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:42 +0200
Subject: [PATCH 7/9] ARM: dts: qcom: apq8064: use new compatible for SFPB
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-7-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lp9Zy3ZOg/Qu4LlOPJJAadQkAgPZsy1IGz1a5M9STgs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HzPjnBcIKNO6yuZWjC9nNYOeDW+D9sPOJc
 W/omJSU92+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1b8KB/42seJcItiEdCaOgz7ToqlTAJ0yDZVlyQWcUNVxK1oD8+KLpW7DaNjz6PTa//2xgfFZbO+
 QSAucKCCdIFPl8+EfArI6rOzlDcM+kt6vgSI6sKWwKtzN4pbIR7bnzrkSEvz25Cvz2XgLQQu1D8
 QhDYcg40wCEzLl+ke19LLMisix38WG35QyJX3/7A2z31WEtg2YXwiTNrtMlfKjz85rt5REHHC8g
 q8Dis9CnRF/xs6v+YI5HAvQdz3ATRRDxNBnzLNTDF8+r/chNwhaKMvCMP4PVaXhCueIoKY80kiW
 91GuXoNHVIlLpd+SsBoH9ykmKI9c9Qta5/NbYKBLRyUFpf5g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d85fa2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: sFES52A-517jxTaBx5xfYzTJD2Jm73w-
X-Proofpoint-GUID: sFES52A-517jxTaBx5xfYzTJD2Jm73w-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=709 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 3728875a5506397b36a4c0d6a5ad12c067bbdd8c..522387700fc8ce854c0995636998d2d4237e33df 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5

