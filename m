Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D8A6115F
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083010E9F0;
	Fri, 14 Mar 2025 12:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ht9t/N2v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565BB10E95D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DLQFml016092
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=ht9t/N2vrwazGsIO
 SKv/5nTOfmyws0IP+io2QjYroBsDjo1F0Dfj2S5JzCgK2FWGAWnkfUYxqkY7H6u1
 y6UbN/rZi3d0uZMAhkJ23Xbk1brUIGWYHxSII9JuhvDtR+sYN5ifQiv3rAwwh+TP
 8KtbRvxfzoIqPZn491kGZBOB/hm2azsimE6Vj2UGe5a2O67HEEPHJPlcil/wa5h7
 W3/PiooKTC0c/hPEeElYojWiJAoABEW1Rwj3nef1VFN5f7LLIatiHdzaN+4cTU27
 a1e1hgONAPyI1Olg3I/aQEWixy2w6RX4WBwo8lFZvlH2DsFOjXbrbGmPma8fi2mc
 NDfGkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p078y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4768f9fea35so44593961cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932563; x=1742537363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=;
 b=AUKi2S42ZJxEDtZsRsLaPfPI6QZ81AdB9PrIHsiTPHEcBsJW0/HsPX486ie+o6JL/E
 AQAHbdBq1pq1hOgulu9qlkucRfI9IDJt5RL8al4VibujyrFuFCBDTJVyV+U0R6cfE2H7
 I/OT6eWt8ICAsBOMyKWHGxQLRFmFF3IGYVOgrrcHVSq0cWtXIcGzOyO5QTDRi+Q58Sum
 FKFKvKqRqaR4x765lg49fVIiF9nioN9X2d1A6kI3JwBWjrqOVvZ9D9eaeaEU7UWQbaYN
 GCIyqigoCXMqgwNamYPmtCXEXp2GiWkGCv46b3ycRZRGMXoaeOqEGnSCMfMJtB+/mtwI
 STYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOkXCLv/pVdIew7QT8rZ+ahs2M/wzjdwS66CAes4YmtYCp+VyKRCi33C3XP2FmMSAxIZonwcFtMsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRYEzJMSdYDh7S4Jdmlk4XSOGhyxHYwEoM9yLHhCps/SVieV41
 9UlletOINnzxCunuRAPGlhJNkeuI2fUCodm1Xoc4PZUuJd+FTl6wD6RIbdLboQrObqr0rUHheJj
 g7CJe7oT+I0SUgvrc1xzHcz88CjREXX0RSzGZGYuQEdLcS3ngqrGhBSYRWpEoOKeiIxo=
X-Gm-Gg: ASbGnctLvscwDxGZ9AUTu6HwrURqocO6lpdzcHD/Er0D8CS9xiaZlDVCQIWgWeuChDB
 x73FIDUtmFGnZQLWBx6r8RCoPbB21IFKXekO7cEUG1wwI/0Js2GDidNVUtpceEAu1uErhaEoHQg
 mG8s/yiBXxZogOzKRCCQ0gbV7DK9lumgG+eqKExoNV7pObbqtHkY1lF89IwT87QgzeTUZp7hK0h
 gkohj480fYZBFIIky1b07zpAS5qnC66KkKsbrE/XC5zEDXf246Bb0glqpYomN7AZsupvTnMsh/t
 0hKY/8P6HEI0Qg3WH7IG0PvQwIBLTCkKcD5Q7at0ghdJRN/sMsu2+D/SchrHa/0YBWyR9ok1g+4
 FeSoR9NqlF1WY1ALT31hhbZrsRr6N
X-Received: by 2002:ac8:5fc1:0:b0:476:a03b:96e7 with SMTP id
 d75a77b69052e-476c81de5d5mr17607261cf.51.1741932563363; 
 Thu, 13 Mar 2025 23:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+n1SUt3ZgWbjBVBsan3UxzAZliUmUbhM/LGRIG/kEjkmc4qgG0/uQ1PciTX5CcH0qlwakMQ==
X-Received: by 2002:ac8:5fc1:0:b0:476:a03b:96e7 with SMTP id
 d75a77b69052e-476c81de5d5mr17606821cf.51.1741932563035; 
 Thu, 13 Mar 2025 23:09:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:06 +0200
Subject: [PATCH v2 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-2-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGLHauS/kbPNT1IjIi4HWBO66PbJY3yYljy
 k7mnK8wyUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1XCDB/9C9EqdRpyEiVH9DTNw4lOwlcIzfsKfOlndFaAglZwn453xFx3QqoOzkdMmXny2vZD3b7r
 2xJGe+JOVOfEL64u+8osiwklNvu7rg1wlUT1asglG63bGWZOzaSbG5LKmeNttnIZwfRf+vG47WR
 TEgrOvXAXW5x21m/qxkOJe8MLQViXZFZ79YhJ7SZdG0i3iw/Ax+4eS/fqMi5mx9iHzreSUgWBaO
 NX63a0+4pjs/VpcZ9qwG1LNmtUFJ3jtZEbqd2gBANpWKNjSAyQEhycrd+iQT0q5lw0/a6wPBDzq
 2fyMTWMyC9XItTvu11hl74MFrtsmDBOJNVFeJ+gvu0WfIeN3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: DZVn25M738BPp_mWtezUNOXsYH3ZTDnu
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d3c814 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DZVn25M738BPp_mWtezUNOXsYH3ZTDnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=881 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140046
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5

