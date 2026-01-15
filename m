Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05AD23810
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFB410E71E;
	Thu, 15 Jan 2026 09:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcldLNJb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CatpboyW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D2910E720
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g1EL1055253
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QjeuQhZUGHp
 7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=; b=QcldLNJbcA3x8cKa9SwsoFvAmIb
 DURT6NGVh0J9YV8wyLaVuXsRfbv+uB9UhvDd5Jyj2sGv2IwirIO9Ya74shLMuqOY
 vpHLGgfWmRj2AAI9o4yjk7Hi872OUy5WlgaXmagW3BdCRa3FY7O90Uf71kxUhknG
 ey9xI/HGBZOQRXpiIGOz5ni6yP8lRG84Y6EeMJeHr9FLi5CTbp33kBzOkwNr4SFp
 sSFp2yrhFFi1SgbQb40StWo/9ktDf+XUVdGKC8KEwCu+ZnsGCN+koRV2xuc5FIvB
 mChvRL+BXDoxA/gZCrYNy51TBhfDW1RbpaL7DlkSfCFE/14oEuXQNs3bu3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d3449p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8824d5b11easo15433676d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469313; x=1769074113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
 b=CatpboyWB/bUrAyZFHI5Q0OcCwiOFATImPSusrZ9XoVuxB52WZ2FLUY3mkjH9JQvME
 6M+9dZ/7yAuL4OV/ntj9LP1sYxXwGfug9+GjEOaPLbFmM1ONJBt2ytudfzkubcYavoXZ
 7gXXdigFqPb+5oatZbc+CQ8y/t33+dl86xjNNZxNHTWTBnquR+62iNNhYohvCMu66+UI
 vC5Qv0cN0RfTlGJ/fLRjeZEHxeGHj/YPsJV2d6uF9khB3MrGBBDd5baT2IdbFgOSuvAE
 niw+YiMOgR/1R65jWOi4WPoM4PnBowE53MxXKcd+hJkKEuXGk+C1qOBYBDfeXU+EUpxk
 BaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469313; x=1769074113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
 b=C1jjIvrVpWiwr6t/NRKahFKIAe66fzNm62IiPPznK36+vXHi46aV/LEguxHWSRQHT/
 8C0Yf/nsq6o6sDnvGOv5usrGggQxupqVVfOJ4yhF6fg4nT3E3PWH0XPNJyi6CQi53YaV
 kmdc+3ro779HmFHvJhTGaPqICv5fKDpaoyGEnaHJTiIPgFDghQBAULDrOh/PZVFhCvv0
 hsXhkFmIFocH6i9dfDm1ciCIVtFbt/BLvwCVgNFLwcSTEHMgOVlCN1M6LJCL8jaHx5UL
 YgJsyMoRchFXXjsBBM+0JglEL78xC2XiW9kBA2MwjGDM89/Xd3TyGBUpYAQhu7Fp5mIY
 2yug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyAfDQw9Jvrs5qBJNvNFOfj04tmDmU2RzTZHChySzTwf28qQbrh+fvaGY+p5/sInyDmdL1x9xk93A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbnxmStGHmGIFkw4Y6kTmjIUy0aPjYevEaxjVvfns7f45WDNMK
 VGTsRG0fnA4ous6+hPX+1zY8VOnbr4WhRiofd3rTd79Ni3sf2UQelEjA8tstsLZ4pJ/3iv8WBoC
 5yUHESH3UmRvwKY8K8dFGauo3ap2TjMmlP/0gfTEEvyu2j1r/98LymsSQlt0K5MLnbk3vL8Y=
X-Gm-Gg: AY/fxX7bZwxBFPdUyqqB2h9rwNFYGpyAljpCjp9obN6jjQ84to1va/p8lAN5RTNwDvb
 y7lWG8bd89Ylwk4Kd+pnlOeZH+0r7zv2DzkoacNSm6vAk9xS56qWUG52rXhsKDgDGqDmLDCQP7P
 UkMNJkzxawTMl9X7Hfu9TkPjlOaYPCU7ADFR+JBUWTfXQ/wzIn7dlZw1B7pgyMu4slhb1lxdVqA
 KJp/4aRblzhotKcuJ4sfsuEeXC3sm7mVF9D3MTPrvGXcP77jn+wrKNiTOol8I2j5UAwuD2rqatl
 KgL76++Ra8wV+l6/7pzUdlnavOEueqvFFTXGgFFqGD0pbb98SXLHe9wRWgIE15Gvk2KMHs40iyb
 aw9M72Z/RSBH0n1XZycZ9t9qxwlYGKFEP5S0TRLyQd0OG8XFbBTmY4Fpsrk9lIxM3ZTs=
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id
 6a1803df08f44-8927439bc0fmr83782986d6.42.1768469313241; 
 Thu, 15 Jan 2026 01:28:33 -0800 (PST)
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id
 6a1803df08f44-8927439bc0fmr83782616d6.42.1768469312829; 
 Thu, 15 Jan 2026 01:28:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu, 15 Jan 2026 17:27:40 +0800
Message-Id: <20260115092749.533-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L4RdiRjIxYnQCkJhy-HS61m-oynFmazk
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968b341 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: L4RdiRjIxYnQCkJhy-HS61m-oynFmazk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX3KvqXMZW4Cnx
 E5v6oQ8+c14gNglsMlRT/qmlF3+vHk/N10I5qVZzFgaOsyBktwIdz+NI9s50ElKorm/LguKWQ/e
 lxzjxGzrxuzVJHqsA+Oit4J0aL4OlxILxhJjDvLX+qNL7cGX4xUohmxHcpTCr97Kqb3+LTujfcd
 TohTuI+sASWJPMZJRzxVeOdPPGomL8k/9zU+VxlUvhIVL0AnubJuhoqUMOLOkC9aqAnNfVgzvAh
 u9oUL4UZvvBxq/QdwSmJm9gGOvlOcqIck1QPC/Vo6Y64LOzFo18UmYkpI32xCs9CjXu3uXz/k9Z
 IX8pZs6qelzw0GVIv3S6b/71Q75+L865Y4gN1It4VEpLzp1UGCicCO1EstK2TwFzbrfvJK65RS2
 gWtY1bluqPd68aKOUng0COuPZvguSJbt3sTb8lQcxWidLiEeXtcpUJQKLiVP179oxbT4cPSd16j
 inT4danlwb4ECurNq3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6276350e582f..eb6d38dabb08 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -374,6 +375,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

