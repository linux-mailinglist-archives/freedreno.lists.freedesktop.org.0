Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCgyMp4sqGk2pQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:10 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372C1FFEB1
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D813010E9CB;
	Wed,  4 Mar 2026 12:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbODXYec";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMmu2y+2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624C210E9D9
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624C80r43110575
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=; b=HbODXYecyJYvH0ys
 qW9NfvzIINWZxe/KqNxkMtziySg2gSl4nB95oSr1LKuyUIQYnv0K62GQftJzftGC
 qHpy0ihMZHN7zwr9m0u4oTbpHTcauWCCVDYbRA/h6UO4gHEYIf4AdT12rIkR3P0U
 vcfTA8H9ZFtkGxPzIPGp2Sk6leYXvmZ5nhc+omuPzl+PZtu5sxK6Sr5YJUjbGGCO
 doBTLWiI6ooohh6jZA/90sp83Em1vqOl4fwb8le0bI4djZs+2R1oHWgoD/iraytB
 aWrLwu0SIb4il98daixJD8VtdNwjJy6IMcDMKBlxaSwW5uNH09g0F/8Pq3HzRW0E
 3nRgPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2b6vx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-899f6e5b909so210409026d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629146; x=1773233946;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=;
 b=eMmu2y+2bqJ9y89Sj+lyu83rAS1gKHAl0G3sBuk02rNW50XR3tj86NZcpqpc89bSw8
 Brr6VwlXZtYRztbuLA41yql8nG88cVrDy+4Ow/HKDDcKqAwT+qDxvRFAQF60U4Q3iydV
 46FFK/r3Aj2qdgBr5uRiQ76xlkGXWxJUpaLQnZyC44UdJnd8zfhjPdTIcvenVbisHjiO
 5j1TCLgCAF91zjlh6SHDk5kYBVSRWYpyxi9CqdJXLg62/hJxz8rGtrdvUNyznC9kRN1K
 J06IBXnJFWRIfaGkvfkAAANXUsIt7uATRz9hEH1rFygjRDwqBVpxmlCuZIa+i3alplFN
 gWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629146; x=1773233946;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OfHV8XGd6ZIHl7x8KCS6ADJs89hGVUz2LPSsU8So2OQ=;
 b=br4jGRAlNdoO58XKk/dqQ/A75nAp3rfF06h7Bby1c8Ko0SmB2bxOllit9ymy96A2At
 wgjIWFaHQvwfhYgoDS9vrUo50oP/AzqKuGPw3QNn6LUP+Q0+OPZo1VykXs7v1nWN3eYW
 i9Dn72fRqrOkqKg0BWv5r2Dv6+pwpuKdI3o76fNIq+pbaZ2Wz1XsLWOFDt2Px5aMg8cd
 ntSVSgiE2AZTkccc8qB+xa2IMMmsvGFgP4wAQCryZnYbE+FDo4WsQ0NYeQrro+lfMzkb
 Sigw38Dgfy5demJUk1dWWjgvTF7gpB7/tKIymrOkyiLX9hqMQjob23dYqhsQSJZ+zU8L
 5Ybg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCCm7JNbzHXI9iZUbIe8uoiIIUcyiVXyIgpqjqBN6JSrEnUM/ALQHrur1SBm1ppGCGgUuwZvJdYAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS0Zl2cE/TdK4R8ej7cgX12k+wu10vAFMZD2sTkGdxPQE6adiA
 gXEF9asoXHh+u4uO9ky5l43CRqKIyy4wjzisG/WCQkyWP/sPwgP+3Gp0HoIRK0iteFQFU2EqYAv
 OqOYapah5reDSc7xuc+KqhkAOmkV238OE1iUmLeOGyiTd5GuNfs5UFw8EIKT2lDusFd38c90=
X-Gm-Gg: ATEYQzzntasgPL0R/SV0Yk3BL5tlKKzCqoZuUUO57UyG7mLdds8Hj9/ZornodzGtvSY
 JYRk/hlYYxxLTIwG8YMcdJNeWFEhqUraI38p6EK6R2Fu5Wbupe/fyknl8NSrA/A1LVKF27aP/30
 qwnfsZ5FAHh4Z2CCHrg9aeuQDzQGdqdhXq5MvyfTAOYTWiLv1AWQ0W5crqc9hV3/KUkBOK6bMkj
 m3hTcb7EDjDvSc7du19CCa5Hz1zigBJDiONNESIrrRsiKmAsYocp4r74xnLsHwWZFnCotZNHWzX
 oAsz76M/2UB1iNXy/hKbdZqYUihxherrhJnUDUlBnJZOt/EV51VkPY8E/oISox7HSWBqoB4v5Ov
 Pr/tugoCbyeu4zpGMh7P5CBOAZjNhlpxqo6SCmiB48YQc
X-Received: by 2002:a05:620a:4727:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8cd5afc7ee8mr211014785a.75.1772629145643; 
 Wed, 04 Mar 2026 04:59:05 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8cd5afc7ee8mr211010385a.75.1772629145157; 
 Wed, 04 Mar 2026 04:59:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:44 +0100
Subject: [PATCH v2 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-2-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GIb3p99m+Q7msRrWkixcfxO5ArsIUlG6bkPtYuRoVbA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyLT51f6ZcJSbYLBb+KNBxFIHFxCZeP4wdrX
 OnoE+hrUweJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsiwAKCRDBN2bmhouD
 183yD/46MHY1ly2P+mwcktiEIlnZdh8eGty7X518wUPU+zfVmfccIRQJoiSP3FdR8BzfrjCk2rJ
 3u0fB7vDLXHDI/iW6VXoul50fsbm4Y0mjh1s7ydz7a6XRG6wHh5txmZkgL+gJ0HehCUl9PwenRC
 50i/rIMfmIbyAAkeP7VlHY9uQS1LlOvOMtnQj/au4wP8vQXdfvXCosw+COyyGjQIRi8rjU8VNau
 wZ5Ugq6iNeIWXRHBOr5sF47b/CLrjwJqmbdR8b/Mqcero4ARP7pPGKxfqBSWNp/c1yL7QO72mcx
 Z7emJ/k0CJgpzYltzsCtahNzW1wVm70vC9JmsJEhics3bcwZbWIhZtlkQOnZIlL0mctEeL5dL+C
 EBCDmVhJpbe8c8cfTFXSep9tZqcYF2ixSh1txe9124yJDcd9ZxxKuevF1L0mAK295dlc86+GLo/
 fgtU6637lVQc6vhvb0v5kLnzkVmBlN98HDR0DWL8ExXqxmwKQq/UM1aOnIRrOxUwBjkY4Ho7sZb
 JS+Fay1aS4VdB8ll8q3jbSHtUH+LgEvQ3CfgqaFH5BxLzwFNmj2lhTbuvBXl5aO6rfG8PXHIYiO
 laMvnKhl/MB0/MrodvVieeukyNhIlCgSXNCMtHxreT7OMsqLAusz0JPFq9yeJGQHLJlhxNGmKBs
 vLCcmIT9GtTq4Qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a82c9a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Z-FXux3aXHsngxkoKRZYHGzBeVRmCTMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX3CJ9Ygksgo2p
 O6HzexZXtHTr95aFKkzbXRc5fbRt3Y50hM2RBFug9wMjAp6D+P4rnut1vILBHNVdrA3dfSyHzH7
 Pt7oWRvrWt66GahPrHdfxQB3fKX2eQ9dQprG6Ohs9mdQY3wNDf+YxNDMf0yEFkwlY09ZGq82WT5
 7loQjknOztc//a1N03CSxEDskFvIQZ8uk51PHQ4CdEgQ1hGE0R/bETUsikGzpWSI0wtLzq+hlpg
 +9Ub64nKUhH9BhDEK6db9pHGlyD/zgz9u/MXViaGwpBzx59B7SinTsc0WlUJpeVJV+rEiAA2duW
 yR4zHOIlao1F1+ZeZqaRRAovgREfTIuz/9v/07184LcRKWAL37p8/9UiuEi6r1Sp617j0BqWa7d
 IDaC/SH0T+Y6W114mLLe9UWygCyp3y/Gf8d4sTyw88bCzBUwVK8xF4GmJowdcdUc2gPUma4uGOe
 I3DJ2oqTB7V+8XwccAw==
X-Proofpoint-GUID: Z-FXux3aXHsngxkoKRZYHGzBeVRmCTMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
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
X-Rspamd-Queue-Id: 3372C1FFEB1
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

