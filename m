Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNL9DD/dpmnRXwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E521EFDF9
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F81010E7F5;
	Tue,  3 Mar 2026 13:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7XCzeqr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqIfBGCd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425710E7F6
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nJpP323914
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=; b=M7XCzeqrVKDZ7ZUi
 pRjwXV+Sa6fONy6BDmsT4yghRKyn+Wm9SXJ2TlTEbaqcJulo4CIJX5CesrAoQuvn
 pEmFhs4kDWMxBoRzaA/2tSh0hcgRBe7sPmR+HB4E943xXza0SPglRDpxcW5RTa52
 NF5hskPpX/3QfkjD2c5c9hdGx7CTI5+vQgvLt9eBoRcz9TOS0VIN+vEpl3iffmI7
 kM5fmXoEbhTtozel8lVd9DMPPF+YKwo5VXg1ywYclO4nn+x5y5DG9ufUe9nKO76g
 sQoYP7wY6doywZqAOE6NNXrlZz83MfGhg/rTNlXyhZmvKmb8Lxdget+MJyqqeafH
 f7l0kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfv5g1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb5359e9d3so4160143785a.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543291; x=1773148091;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
 b=RqIfBGCdBQTxPaYM8fQGNgXZ+pus2smHSvFW0s52HeFg55a4CZbkZwsd7L92KVzH/P
 9pYH/FpMc7ksR1WeZtLzckdGwe0F40l0qgnLsy/XYt1ESzKPLDaDpX9y5L+DCQQk81xc
 6Vewmn2tmRmqQkTBuG49OrX7wZpHFog31D6zJkrFh+3zI2Hw5BXgkzshEQ6t5M8iS8z1
 3dys7hm7sfyopTDFBhq6C4LvT7aI2cuyCSjoWGSxyvItKfvBa7a8HrKKuFFYGXovWO0S
 d/svIJZ3ZqsbYDJP2SDAfD1VkHuPW1rXDGXF/NMF1SlIWEvzcHGA4fvhhCSDYQ5glEms
 BgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543291; x=1773148091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
 b=WdmaPU+O8MzesS4Sf/20stB3eV4UExJw/RYc/iLXBkafs1g2xx1OS9gSzYX2UXY8eC
 wqB6YOEJJ70J00s3cQN3zyvrDNlkFKOruhvRlh2l6YwzYGOM0JHqxciSfM8HaEIDtsxn
 OTB6k3FAPC6gvTePrbVnxO5Z0gmi7fiDC8omVore32IXCSB2tuZldMg1dms+P/AdfbGz
 xpq+TPlqz6AwtAufiaXKsoV5qkW/igBeJLkVtPmZfTqEH5heIvBnC7q+/mHLx34eSei2
 sULi2s8qYl9FrCZ9c7kLfwNsUk8CL9FXcq0pl+z0gyTjVqzQq+L64C+QDtwTD+JZMOu9
 V9WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxfr79Jr07yHTHnfpdnEY5KmxvRn751iaaFqQeA2jlwwRDwk6xA5wc+nwo9dPfF+ICLRd2r5ntz7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXpahwR/GNwX1t5W4N8vbX/sOVyquAyftNu18iVLWUxcw7Ruf0
 LdxRITSjG5iV/XNByPGvbe8vkUsEHMpaH/83w9Z7vjupb5PLW2GWj8t19Ec/muRlOZ3QzhuCpBd
 fUiHI/eaZIv32P0g6wzWVBCBY49yZvPx2dYKotm2/uO6IY7p6MqOxv6NvlK+jSNjAZ0Y0tVk=
X-Gm-Gg: ATEYQzxKcNP2W5TZus7kFcqagjATqDpBPV8T/N5zMZnNMIq7CD0krxtPsRRh+3T/aSE
 unQ3AATH4hBjSCTkwVcd3w3WdXlJSp4h1uawMhKAvLmrm82jKZtc665VoSU1w6zlLMVZvYcG2r9
 FpUjFZc0gClQjURHblY21QdSkJBpRPrtfFM2urDBr4iBQizg+DixoBbpb2p2hGMd8SrpC/TgNkM
 TXKXVvhdC9k3v/GgufFREYIGkwyTrbftXggBefK+MltDuLNR6zgMiqD7TdgRbMbDXUgNvjlG49T
 ghla9N8GTakxZ7j6FmquoOr6M4b3m1MKrB9M7oOjTTTsqYnD/6T0/e57/Lvr8yKMoyogKcUWgTf
 3xFlr5EJFmkyCXG3yGmYk7Y5ZkfPzRF640XGC/UMun6KD
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id
 af79cd13be357-8cbc8deb9bcmr1945426285a.26.1772543290648; 
 Tue, 03 Mar 2026 05:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id
 af79cd13be357-8cbc8deb9bcmr1945420685a.26.1772543290205; 
 Tue, 03 Mar 2026 05:08:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:51 +0100
Subject: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MdsedeCf4ANTTpubxrkwpqg4SHUnRXKuJ1I5Fc7YjgQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0rzejX/Cug8m6PVKm1rzybqpY6fqV2lhCb0
 3TkSGo3lVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdKwAKCRDBN2bmhouD
 1y+dD/4un7OMCcTu3QHr5l/jJdFsc1HyQAgMZv4qD1NgwZqQ9qxSLZL14G9s1UEplEoxSWu3whz
 a62IAGLKHRxJdrGhst7g9wHZVS3DlXVaJW0t0RmAG1xYQZUWrV5HwvDZY/AgTgqWtb98XuTQkyE
 tdNor973fkzRYprhHiaV6VnxZ7UJ2rZc5EZLfzMWyVQ1YfETU4eOEeaW9aRjVc4I58RWahNysLp
 OCAvbKgdSAvk5CFf2gtuUp6aB/XutUCeoDz4Vf5OeLcYYs1qT+p9VANB82cf4Jg0vLr0AvrD9VM
 Lk6MBPAO3UkzVQNUdyFUKD3j1cCP501bw389NpigPfZNU+IwPpw1Xn+XJYcKHzU6LtjtaYQSS6U
 dJ3e5oG2fRdmX456JVPRnHC+pB8zAbNfXhMaVubhN2VVakwNJ/7SVtAX2op335xrpPg4vefonsT
 TYHRNlKQdacgQG6JVqoRcp0vmn4uIOwaFCOqhO7zFgl8Y5VyMT+j9BeOf2duHQ99kq9mmlhZGlb
 LrbcpN5pueTzIe4Gy+3Dj3XQNbZDCzqZpcZPtbnK7XsNxx5TqjmfcK3cxT3uuOdqFINUS0zAcrY
 Q8/hsctpyHRK5N2igQmL7hv3YlgRTLtnHgqm5KZnWl+7cnQPydv/QB7RqcuOSIqBqL6vtVKIo6d
 nlzyC0eHfYmSKkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6dd3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X0BVKsNMwB65LJnTjtcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TPmObX5bdrhDG6wzJ81CWe73rpHxeeP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfXzsEEz/Po7qfA
 uRTd9pHP23pM8vh1Jg+izc10xEyfzZJ41er2VvhmHFAVKGrcTxNQ9zx11OtNiFEHAtgoUDa3iZf
 0X+qrfRS00QOPdJSeaT6EfhWiO6XXuCaXhtMpgSyvx9y+8atZfydeWXHSrUpdHbWsJ3OFEp4L/Q
 mjt9Q0K235mZpLmjNeDx3WtNe4RSOX6hoiGBi2tSs7qs824VELzwrI4zp9q6LGOz3R33D6Mcryb
 Xpo5cYCLKkaM23g/XIRoX83z4qZNKA7+jKMZuEAMckE3FwCUkHSmaNeY3t81GzshO7YUVjCR+Zy
 BRQ2oFLXmcpsg0EgAI0NupkszAywWt63sDGYVzPOy7Zf3x5O6QlsJA0pOobQzQCsxVakVFGTI4L
 9Wp0Ftqizh1VaAgmrQ9G1gbo2fLJIj/+kif38R/342OiYXIZMNHNfKVBIN3IyoGL3OTV8QN8qTU
 vCljkqgsZwh9yWkVl5g==
X-Proofpoint-GUID: TPmObX5bdrhDG6wzJ81CWe73rpHxeeP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
X-Rspamd-Queue-Id: B1E521EFDF9
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

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with few differences:
 - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
 - No MST (according to downstream sources).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..d06d396df4c0 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -67,6 +67,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-dp
               - qcom,sm8750-dp
           - const: qcom,sm8650-dp
 

-- 
2.51.0

