Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kObnCkPdpmnRXwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:19 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75AE1EFE09
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BD510E7C8;
	Tue,  3 Mar 2026 13:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N58YvqwG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzn0rZWC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A7410E7F7
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239n5Zo1838172
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=; b=N58YvqwGvg6C2cED
 HuE6QOiEOgy+xUMOXfRdT4WU34Nt5GlRr86dy5cy3Tsa1ShiNEFDrhUmI6gIAbVi
 AogQHcwHnXpGlZjVcI+2dDcXxis9mWhkiacZCcGxo5bo8twbOWwhV2ZOz6PmP9T3
 w0h7J3niMDDV6QiGubd+2ipfGfeDTkA8DDdiYMvWIbb/HVpdCB+BB08i2aVMsVDb
 cut8plcZSFbOreHxDdXvlIW1Kgfv51d2Ur7Ng7/xJkVLV/GDmjA4Vi0kcik0vxbS
 9u+9ygfPJ847BaPYo2BmesW6O/HIRyVIcsijbRWUrQt3YWJ5Ws9wqnTm3glW2MUN
 O9/Nqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngga8yu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso4139857485a.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543294; x=1773148094;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=;
 b=jzn0rZWCMGuOI+z0JH9CGQrdurGl3PmrYhHl6L2S7+1ASj54r9GU9ZL6ARwO8nWtLO
 QKcJX3+h+zHijkUqwkUivJ+30vrDs5//SEFA4U4F1MKxeA/8erAX8uJ6imh4ICd5NWWb
 Xp3+ko4r8p8Vk5geSSMu0zxku57QSS8j6g6NbwPg1SikbwgrTY9hdsUodzy4jwDXf/7z
 hH/pnGlBAaBlMpRcIdCFEazUrs8+lQnuUAZVSA2n2XHdHvOYzRavIYI3taw6GIXFCgpS
 4o4fMiT7cywytS9MCYih+vXpBprEyrcffsjelLLh3r4q5OM2roRWeFaLCiVVY5PpbB/O
 3vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543294; x=1773148094;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3J0UpBFWUdNX9Om+xi+7i6jgyBAiM0Mmaet3+Qk3RNE=;
 b=n4a+yS96qU39slMAURre4CLbYZ1qZ2+aBYRCVtRqJT9rXrExYbqUCcmwCI9rp09mWH
 dOvd2NMQjptt4Zvrg4twRXImYCI4lVZL2x7t90NKwtFd4GIjUm5+b+Ad5a0h1hzOft3V
 nuFATA2MIcFgpGYcImVxiG38qqeEkS+DFVfg6DzkW/BvEPSt6n1NEWSK7MryPPPo2myF
 Dp2JpkX4PMU1N068X9FVt80AYtqbxqKG+35tEXLA3o70pO6dIQ5RobKCcyLdsuw49IAT
 1hwqO8f3oMCyVQULtyz7jGHosTySgFKSfsxVGlM5JKN4bfG9Igg4bEeLwgqbyEghv8y0
 M5GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFalYkZ1cyrGF0CwpxjTsewkalr1/Nz/8M6JlG1UBXiiNb0gzTKDQotvwazDBW5kgBZT1+x/VSbAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaSCEU/WB+vaf1cCJngaTvK3qLuHmfohV9gWH0M+3sE+Uimdqj
 WL51TACVssINum/ZuTRG2+Nu+Oqbqwn1aHiOopxgiCy7kQsmhNMMNez0Ccu3PT81SWLCW3J2UqV
 WBn33f3E+1gjjiFbesi6QR6RPwaduzPKRtldiF91UFauO/TD1DpH1LwlV2tVSXbAv8GVD7x4=
X-Gm-Gg: ATEYQzzBH8qEq5p/dM27iB1lzgxImlFocDec5wxaSrkBLqLuS+LQ1Cim16JmMWPvn7B
 DhJQ6VHmpfov2FEHbtn0dlaEJMbJEmkhGItreNnoS6+7EoSelPEq7D3zU9lZaBO8HGRLQzhzrcy
 EYlogChjpf8gvIGMpXL82vkGnSGh0CIrxPcRya828eNxkW0XoAihXefvwNMq8qwfxvWdHaMTWih
 3nn5esQEI0fgbViQgbQWMmAoorOS80oyx6EiNQ+oBdj6v9q4Us2zRhoYb0wMoItuKTGDbN6tmlq
 vKwM+SophQNhY5boV3Dty5tZ87whqqVHzI4Am4HGNuiCTyP3NyXUHxMdaa2XTuli045KjfxPt0P
 fPa8l4Z/Keif4DO3TVADwG6JRq/YNURp/2RWMmvp/z91I
X-Received: by 2002:a05:620a:2892:b0:8cb:31d8:43a1 with SMTP id
 af79cd13be357-8cbc8e556fbmr2010944885a.11.1772543294345; 
 Tue, 03 Mar 2026 05:08:14 -0800 (PST)
X-Received: by 2002:a05:620a:2892:b0:8cb:31d8:43a1 with SMTP id
 af79cd13be357-8cbc8e556fbmr2010940585a.11.1772543293917; 
 Tue, 03 Mar 2026 05:08:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:52 +0100
Subject: [PATCH 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=29zuWhSdKPMixfedFLH1EPTW4fPqordVY2iglKGMw2E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0sXVNpJTnshGDMF0rAAssEPGRxS8AaqwoaY
 /aBmhwFcheJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLAAKCRDBN2bmhouD
 15UtD/9eh939/lVG+ZgxCCxkznIRgc63wuA3ndNre37KbemBOq9sG/b9bddx0k/lTn9zcWlBtHa
 8feLEH26lzRTRM1pWXIAmQtb1SYAV2+prpDfZtTBzaUxXZv8YbM5JaHZrPgoUyVApTpN7f0+Sl6
 6JfcMlCagrbr9UkKiTwFJnEKVjjSYndql54Jjx54vr6CSnc/yhfFIq9UHtv641goeFHNnCjXNJ5
 IcgbGvwx0/+bM1v5ax9vcrwGXtcDofK6W3fldm487P9Grjvr18H1dV4UDzg+iKUJBY1SXVkZd/d
 ChgITb0EOFu+bnw7SQMJ7LNASzidwhkO3UuyJsxDrSB6Q8mMwDIu/7WQlgyRRT/vBufJ0cE0tI/
 l9D+ET7AV1TDA1BqsYjeF/7duuEIVy7vR+7l6EdqJ/Oy44XrFdRPgXt8IUORTeERTk2NzgTpSrw
 ue9uqACuzOKP4ElGxBSir7hs3IoDxugVaH+2K6mcSwuTVoKOramgYp9dm/bzR79oFpuqcAVc2pW
 6TeNexf2SW3gu3wS2O8NFsOW6oM7CX3N4H+oMw+f9stN+2eBXbfsOQ2qzcdq95nwEuczNwId6i8
 azZk5+IQpKq2jXS2UzcjqqgX0esEGc7r/oXjl6MuL8S5DUuqidtErHSl2z7Ta3ywbW+EX3gYM/e
 y7U+08lQkJ5o4Kw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6dd3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fWqGbf0mrkHKC3v_dCiXW5lTDp6JY23j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX9TBQ8IwScQnU
 GBHb/CV73hcQ8pw+j1oEqCPv30YeKVIWoRN0Wta/eMkEkgRGF0Vb0fzbgNnHeFQ2ANoillWbJoe
 BLujVI1Uhtsu9ollkqHnMPhw2MdCy2Q4KpSRRtRv7XErjUnCo+UluzdE/hfkZIGy8kzMnlQL2hH
 rpdC1UfIGq7TCuya/EegneudvV3Q97YVREWWeSDtyQqXi01DSZPxazabBCdFvPvCUDeW7Cz7cYp
 wen3KWPvSlkXw3AWnKSsWegk2cP11TM5mZr6KW0PK9QGW7gxj398ESdFwRPJlX2jhpaGOSxu1fj
 DI+54Fg+O3P1MFR7ycEuYOmWAaR2Dx43PICEiMfdRxC+X3URVxiP9CyzV4rHv4lMWnar7EKWDO9
 21RWDX2pa0lbZENPfC1pj956MFfQyHbzxDaCQkAzwqz1mhdIzT9m0iBcM3wKco6gwTP00GrxvZQ
 mefpIYxP1p1bcwtOLFA==
X-Proofpoint-ORIG-GUID: fWqGbf0mrkHKC3v_dCiXW5lTDp6JY23j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030103
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
X-Rspamd-Queue-Id: A75AE1EFE09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf43..3ce8a9ff4555 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8550-dsi-phy-4nm
               - qcom,sm8650-dsi-phy-4nm
               - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,eliza-dsi-phy-4nm
+          - const: qcom,sm8650-dsi-phy-4nm
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm

-- 
2.51.0

