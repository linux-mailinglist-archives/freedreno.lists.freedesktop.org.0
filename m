Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE45B41DE7
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED2D10E7B4;
	Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyskRiBb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612110E7B3
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEwVU022943
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=JyskRiBbpjmESb46
 EDPO31Z1EZ6yvegcHcH5dnSFNCxtWKQweEDJiHgII5QuNkgrqz+jiyEukqN5+ZZg
 ODBPnlNl0Q9itxQvhstV5cVyfsurT9JDf+Ql5+L2VmbrSLjCQRY9ILs3m052p5y0
 xcOe31KxSvXy9T8oQfx9f3XlR0Ikc5H8uzUqNw8gBlJllJOjRsumjxgW+AphYR0g
 3hl/KaGrvk8E9kf9WO5BCX3lRE6HRMSsYctWj7E1+FMr0IzH6sQKouRhBytHkF7c
 4SrhuCfWG3+EHxuM18Xux1+Vm2tzcymxAditpe76q7TWDLXW2giX0PYqSY/H+SZV
 mxys4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eknkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b35083d560so30849881cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900707; x=1757505507;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
 b=fizS8ZMoUx5HKOwvGJhQTmrf+eR01bWi7Yc0zN2q/N5n+TKbUjpGiZfI64rrGQiSJO
 FXHaVPAiOuQT/trFMh8ZIugeMk1h3GO32Ume53NFjdpinKkQPAg99sRZnd14bNBgJAWH
 ekP/zFeN7RkblWlvmz0X5dPJbNJ5AOKms+0XXqhntnboiukh1C1I9jtm9ELqfGxL/iMu
 20mZO7+JLaobb+muUENdrHEbu+M7qbmVdrrh3xAHWN36OvF9j2z0RJbPFGgOs+ChMiIp
 I0PzKo8hHw3p1iczrLmRYojTH+Jr8FiFgvE70/eZqE8byYXyrTsFfddv35tISFDVuoOx
 qqew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyRIpaOs6nVcgxvc59u9cFS5DDgtbgp7UtWK+RxIO/18fiYAZ1zBBRn2bhB/Ejvkm59gKNmG9YAAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/hAJ+Lxsv+cAOy3iUHhwF6vZ3SSMYFkfhNRUNEvZh2nb53bzJ
 Fr0cybR3oEvXrg94JHCCppoxsLKEaVOEVvNLVjqT9rmMQkfcEdU31MpKQDX/57Zkz6eRC0gpMys
 oCVXMLGMTYEiHUZxgc+SRPyQUY5kns8VvSO/XoLwHrkdJTHGQG7IAOUFxkBF3E9ZrTvVSAMI=
X-Gm-Gg: ASbGncsGelhegPy9W7bSOcnlSh2hkCqTk/gP2bpCFq0FWjUIrG4Y3NCv0v5HoJK63+j
 3tTCjVtAC8rvBAIMDLpuHpf6Spq/hrBevQ38q8rMT0BzUcVWjrIg1JOSjHrT8QQcVecCIHJXbG0
 CkzzmoeymscM3t3T9nfTegAB7wOaYfdly6HDMsD8TVBciQ18D4PwRTzX4aAygAmUVFamR7lyely
 PthVrcR04Ynqsgw1W16keCoQhq54xoLd4OTsizQvnQurBtc6S0yzy/vK0nVuZMs9LKlUAO4gOaW
 nQffZuqy941AHhotVe6p0Z2jTmagmkPAgXHfH6QFBKNsc39MU9h1XnH/PMGnHzhNpyESqL864Kp
 DR0FxqDcE2Gaxm5jjj9b9iN6jvE3HO68Qyb/UUQ3WXU5TDsqyBWOz
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr153034031cf.80.1756900707153; 
 Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+EMS2bgzjF+wonzL9M5BRn88S64ov/ovDLLFNBNiMqEsjMGSjj9Gp5N1zKTttlgvTkbhnQ==
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr153033731cf.80.1756900706608; 
 Wed, 03 Sep 2025 04:58:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:14 +0300
Subject: [PATCH v8 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1XzNKs3KOvrfNw9T9A5PinobRn6+BUmHYpZ
 AbXYmzlA/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1fDkB/0cdD4STyN4uofga6hg4Afg4alqCVv877OF09D2pr1z2nA5rdLzvmgnUcMuCfflk0wXjHJ
 bXsEEaz14lZtPp4J7G85o7G9VjPzwXeS+sUHRbWrm9NXR+wD2RcdMefCPMdcbueKkVTkQYgbgLf
 1FJVNEdeUy3cTxX6eCsIthEtfOSBCKGU6DvSa8D3UYbrbIpb3au9HwSzcrQ136I4QrjjRc4qZlv
 0hS9T6hv06o7YlXVEKtOOtgPd/PmvrYjHbiN1jnXrHriCAdu7gl5s564TQ8jmumSQFQB4GC74Go
 dV3x6hMYJ103JuT1RIOZFoae1XywiZB+ZJLIyFcu8cy2FZ/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FQ_jAZ0lpS7CSeBgapk_syFS-a9J3NaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX03T0yHwUg8gD
 bM5vk9hKKNueDE7ZFbyLnBKGJQjJocO4E5USDtpxm/Yg+DFSJ2z0KBSKBWGyVsR8IdryhK1cygE
 ZmFpJ7QEl7ZV58eUv4tD44K/kVO0KnL+/Bv8DNpL2TNToK3v9VCaw89hWyXhTzNW0FYyRH0aKTm
 Rw4Rkh9FNLz2tOzbEjIdeq/P1KplRobiotqNj4G97NPtop1V0T+NsS5mxkWOSRemYKL+FNepyN6
 wtvyA2TAX2daleWRWKvU9YJA4fpqbMApvbd1b8RWEJXHsH+2ms3BrDS9Jn24G7RavV7uogmn0Uu
 1y6RFjSFbv2B8RypqcnESjN7kXIOb1uq4QT3/QN5jge3pmHA/b9xmn3F6bFfMmsCKpr/bUJmL9w
 3n1o4v+R
X-Proofpoint-ORIG-GUID: FQ_jAZ0lpS7CSeBgapk_syFS-a9J3NaS
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b82d64 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2

