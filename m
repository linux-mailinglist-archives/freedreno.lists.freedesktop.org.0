Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C8B1F38A
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E92410E2B4;
	Sat,  9 Aug 2025 09:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HETUexZq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8084E10E2B4
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UGSx009156
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=HETUexZqTVdDOGRP
 RWasJYih7V6A+xvow361DxvLJY+SHqeJbak02pkjsA+kJQtjdMd/18Vgb9uIY4Eb
 TM2viu6jTQEBxrNvN43BLhzGYkq814eQ28TKkQpwhsQvEY2X9M7zw5b1kAqPRWez
 HqNeh+Nd1/8ZSG0EMyHNVNWNV4B7IeGww0yVR4u+VKsfQcg+J7tmEeSaGnPyn2ZY
 NyO7WfeAy9v0eYEA6rI+6QijwHiemy7vPKJFco94VLx2rN93ZffGF6z5Z4x93GKd
 ecNsesXKjUHtln0854kKQyiEfyvLVRuSUh7yV7S4Fd76x+A+tGjiEAXWIfX2A4sE
 2cXlLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgkde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b06908ccacso65959571cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730987; x=1755335787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
 b=enN7nM+aqO2u0iGeDLyckBbw97wlDFFoBNp+2IBMQVvvn/8UgxaA7cZggzUaJdhM2p
 iLn0maWZ8Dq6CGAsCEn/Ku7/DJyW6+TBhhNfhVew96on7j0+NQPtI7LTG+R9Bf/mzWHd
 WQ7XkTm967cl+8RUm7WwUo0S0YJm0P4wm4FQeAuZVkJosnk7M5prE8opCQxUIk/uUnLk
 Hsl6VUvlZ3658120XlHpm09J1I1RmTMVaxh0vB6a2ZiC6HTmDsivcrisqkkE0XJ1rwZ0
 azAiKwUlXyHOudXf9AW0TBMNYlS2+MSu2dYGW4Ba3/WNY1MowK+j+7ELDxq5ILfFqqn+
 Bneg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaZdyQEWQQRuEDcKolAsI5ijrDqSpZH1CaAKFJoi5ANdgubtrP9P9ZeeSTDMAR4SLE8ePdbifWYlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6OPUVIrmlqFes6IJU4rqZN3YgRxEj2BuqgpSkSGYoHncYTHDo
 MQdesWR/EfVu+anzpi/ta9yGfHQHJpkUcqw8WWbMU09fmVVAkLkqDziN4fuKLr81qG72g3yXBOV
 McwKNussCcNukMbwnFTT0203hpRtF28xp+Wbb9+N9lmVRcrE6YMek6R7N9rfhNB5rdnZw1a8=
X-Gm-Gg: ASbGncs5pGkJAjHa25PbFQss2vgvwucC3SHjUCxVz0EpIAKydmGLVj/HSxf4oZy68qy
 e4QJYonM05Ns7MGPvouOqlvikNJDQL5C/HL9Vg4kzG9viAwdA8ZKXdPP/03mkbne+jCLZlmxpq8
 XJMhG0J6zllrJVgQBonYfONVL6gwcEgLlVqY0NU0xhGWUj/Kxo56lfM/Nn4+QSX8DgcmyTMiDtf
 qp3fEGsBUdjXBxxHh2TgRvhlK7zxlp1uPrN2K4JY98mgpRDbfjT1ki9TZlEwpHSYzKfayldDEUH
 kRPEjBDYkP/29hFr/T4qQ9OdQiJora9BT3OI+wMdrOrcnVNArbMPAr7htWM19FdaGeG/+iri1Di
 nQbVR1+43pdVHsHYg8gZlGzSUWM75md79Lp4UQr1sHW+iZyxCQgt0
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id
 d75a77b69052e-4b0aedc899emr75036231cf.35.1754730987345; 
 Sat, 09 Aug 2025 02:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZvWtm4YlKcaL23W+nUW97ef++KL1gDtBq38oi2j2iC9f5MjRqW8FMjd3aynm+3WxWfkZZ6w==
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id
 d75a77b69052e-4b0aedc899emr75035961cf.35.1754730986918; 
 Sat, 09 Aug 2025 02:16:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:16 +0300
Subject: [PATCH v5 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-2-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NXtQ3bomvI5JzHf8G2204y7/eJt5cmkeL6NKDMpr9gg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiy8bk2eyMWBCLg7kj5oWCwhIy6ZQzsXJ5v
 Fg6f80aQbGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1a9RCACZtDdNaFddD3qCGcB/weJbCYH+yRFlmWQ7lGHxAxSSQjfDYujPMeEaA4yIbucYI0Y4Oup
 NuNyAcq9AMWwDBUYJRiY6KKLIUTrd5tlAT9LV7qF+jAUot8QnbFw8sT3XTJFmaiNx0luXWSVfcj
 tF0NCenZp1Mr3dYPKq7kmLPkDSJb5UJItb11+ZKvjP5ibrZkOUQxKiiUpd7YUyk8vGTQiufx932
 SWyQrYNKRXzcas23G902tyZ5HlLxaM1+CJEWGOake5tBi/fbHlL/z+bl5roh/U3XeP3Fo+ufB/K
 uh9QGEy32Ll4xc1qcDI7fJGvkcynbeIW3T+iKj54CGRaUVh6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689711ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ddv5Fq0EwLkprmGfW7xGF4fF2zaHHw91
X-Proofpoint-ORIG-GUID: ddv5Fq0EwLkprmGfW7xGF4fF2zaHHw91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX329pAvoUlrV9
 IBDw6Cz2QRzL+kf2zDOPzFMMPNxDuKd0VCsAProi2Y1Ppm8SwDtOidcYNQTHrx52JEqa9QC7PLt
 YJAm36fTL1Y6W0qbjNgJWdv6m7WaRK6QvwfiO9W2rh5mCwWRjLte4GVUW1+x27C9zUjaeQrI3Q/
 08Qid8kVL2CD6iRz17aD6B5tdbf8cIBYJztC2G1VMjtYzv3rnBz2lI1JuaW+tqtqqHZA6+/earD
 5RfhhmiIwGnA3dTjo6e9BsgXhcxErxc01zsMFiQwGerG3i0lQuLSH+WmhLIr0qTkVsBIlxJYtsH
 uo4u0xZrazrMWQaxTzSwoOg450ae72F2rmRo8ac0ACwEcMFGJjAKylv+Apz/DYUAH6o5pYXqbqt
 QC5B//hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.39.5

