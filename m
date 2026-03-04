Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLbfJJwsqGk2pQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:08 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C21FFEA4
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D239010E9D4;
	Wed,  4 Mar 2026 12:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4LYzdMD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aET9NEg7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2CB10E9D4
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6245SLFs2274966
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=; b=b4LYzdMDq7KmK7JD
 mJ4uoD/4qP8HQBxIQAiiDYBkYpWxbWZjGm2BCZcnivv3WbhKsxz+xLCx4ziFVxCx
 WWIJqinBMjFsuuIJL7f3x3n+pdBelWhHoEeytl++QlYa2YJFzcnFdFDjI4EjU2rB
 qifXHkWC3xbuvFoXz3j+cAivodv7HM2G7EViFePAuhjVhzPBvnJMwtTi5YiDhOQs
 X5+qIYHoPINlEAS6eo5T90mSZ5qg7Ic3JIrsRyP6FxWriA1X3DQ5khDNI0EXGrat
 v4wZ0Z655i9XcaJOlEYVh92ecclBbsGdDlNi3bJaqiriNu3e3wUeSl79KWT4GpnA
 WlGwSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msv71-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb706313beso858088185a.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629143; x=1773233943;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=;
 b=aET9NEg7+CcvYSwiFw7xTIywgTlto/5628lLk7xH9FsiJQeS8MQndRjyOAraMJz52n
 P+9HWSKbxKcLt+sddJ8MUTRRAiCylKlX2cn6qHUojEdh8tTXdbMTt6VRUBRB7m+me1Km
 ewUae0bWvVYHDHRffJxMGxsf1OHNWo6FoL/p+HlVmLd7xYsIwDqLbu3GxztN5+0RqaLs
 3fymYc8kRCWlFE30ai7SwYAMgasryURFyH1AoK/QHZ926pC4NWrsqekovEPzvep1klJn
 StEQkajM0q5b4Bn6NKONK/uvs4dLopzUIiG1xfdiBBfRAUGFe3Qxc9RkQ75JaGNN7nDf
 PJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629143; x=1773233943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=;
 b=DE7VD1aO8BxkcAk7el51V3w0b9JLPe9Ji5q7rkVtTlLHkmpDWXUrkcifyWLIkiSAWv
 GkbEUhp2wFZ2mh13vVyg/Gy6fYYuQ0Mf6zEp4nKLhwIPC1DuPq9tqUJio4jpJ2zx+IEA
 lQL1vUPWAYjxWKKLZbOTAq0fLYeZ9VwVEvVRh2axOPe3+x32PYdzVj5LDDBnKzYcgbjo
 miwX1THfPC9zD9X2ZnKFYnqlN4RQyIr1OhgqfhYvWQxug77JHlScPUh0/Bayad1A0FNc
 RB6ci3YPzpt+IGZL4fYplBPr4oIY8O4ePb1bhE8lo2s6RBYLygfMWyVkmUo7qoKO2yNl
 nFnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ6QotrWZg8UyphUINy7CDSGWjMd6PE09hX2/ZacHvFJSo2iGU62YFy2mnnuSJ0Zcu7l4hmxDi3UA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQjQjrfbdHR3u+6AjHyvDX+GAHhmal1KPT+QAOwLLHrd8+8Xvr
 +Rv5NE2ifj0nNletgdkf6I6zwSmY8M2ReJ87XHuFe+ycADAHCcP3w2mYj6yQRECDEWyyvMz59Lr
 uc3rWSAzNwEQB2HT52ZYuapLvsbMIFPPa2w67LD8o2tcTdvNRzg0+BSYI4WdavpW//JUIcDM=
X-Gm-Gg: ATEYQzxOMRzLSeB903mD5/vdvIU1uO09qFz4sNQLI88jRBC+QoXqYxCLEh6Bk+WVsEm
 3tFc0yu/OT5n26uGGuL/cpoOkfzBy8hD+vehOZFQC2eyNLZtnuE+ybMVPyJ60X0PPu4/eVo+nd7
 8Aim2MwaD3uLjQYmYptPRg3N2smKjVmbwV+Q3tAO6QhFJmvwcA31IKClXoYY+vnIJNDNur837p+
 s0Nrr8ypO6HXFbZuXkiq1qxhlPRJY/0UWV7/TKMn1kT9YU7B8v9wJ/bopYjoRbfVgyKPpPtKJFV
 sf3dE3hlKxFw5N+xC0+YJLs+eDctuYv+63KptiQOa8DBkcvA5cZ86Lq6mUdYiipebXnDmhnjEnY
 5VuZO3VpO+vK8qODKOZVtBv4gOuJjMBxYWTumKDX0XBHp
X-Received: by 2002:a05:620a:29d3:b0:8cb:391a:48b2 with SMTP id
 af79cd13be357-8cd5afd2c35mr207797985a.79.1772629143329; 
 Wed, 04 Mar 2026 04:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8cb:391a:48b2 with SMTP id
 af79cd13be357-8cd5afd2c35mr207794385a.79.1772629142835; 
 Wed, 04 Mar 2026 04:59:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:43 +0100
Subject: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lue32kb97htDnzVq/E2GGEoAq2EwhaD55U9g6KnE23U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyKmtS6NyRnvukSrpsNu7xFG1VLxuuviX8fp
 NgC9TXnwxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsigAKCRDBN2bmhouD
 1w2ZD/4oXikB0z5IXKcd3FNLyd+5LId0ySiS2OpckaW10MTDXDHLNrcEjyPd/CqUqz4SnJHgIuj
 NgaWL1K5DRTzeyw1sKsH+2tbFSR0rkkyeKAbQ/MEwojgfhAeNA2hR0MZXCGL5kGzrDZ+jd7HOPu
 6LJT7FViLYkeXyTKKgeY11jSwyU5PbxyEG6bDBdjjDFzufJpUaj+vtsZukfQn0qLcEmqVjBkzWs
 CBk8ICJjtJUdsYDoBHMygN88C5v42CZz/iQ22hpIcY9Y2KEK98hun3mi8+np+s/izYLkRA9yzUZ
 IfIRTse8ynQ/J6vTUfLoieSnnwnrd/yq+IUsTGubVSxjJ9kcTeFxXpGssBGpFiXRTkQZb+Mkumd
 AlchKqkZrJyhn0WsVVX8ebUUJX3VcDeUEkSu6AjEEeaDftc2osJTc4uvDkY1I/3A0exuh+wm41m
 tQRMu75hXNnUg/6s6SKes2kYI+SWRiSiLJEt1uQ5pSycbXsviiTrZMwBQLn/hvM+nNcgMwMOJUK
 QoVjQGkfLTAsQRKI41rDQKGzWtS97aWaNg2X3v5j75UQPyod6Ru+L/qMoeawEJ6Tl7d5qtTAQYj
 tv50dLqeZFVEiOvIpxksYsjkEIBIHxLMpWspLKm0wsCVhlvBYz2DnYnitqqCRmYQZTkbaCp0pYu
 g2EuMsUgd38FNAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: CoZdsWjdS_A3l03rL9owO3qAfJliccc9
X-Proofpoint-GUID: CoZdsWjdS_A3l03rL9owO3qAfJliccc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfXwV8mnKfKTLjj
 MwTI7Izxyiy5Osy/PCn7wtrcKvKt/24mrpW2Fh4xi35Bqv3+RpGNZ0ImMpQHXBjlea8nZmKOunF
 KpBtkZwG4KLehMaXNyI11McOJGs+sY/38+O471boDiFOCrmbccQsy23QrJ43/R2iB99Zi4Qd7AY
 i5w6pHRw/F+IcjwCP4j0ch4NcwLJUNh4IHKp6PzWVr3o5eqvbA9+elY8GukdYqN7BOvHsbbgesb
 jEH2a7CgUWsprnLEHBdMJv8OVp+5AyVuF1DUo12aMydZRNVji4SL/Wyt4vA2lW3s2yOesFQqt3v
 3pc1K8zbUk9/cxEKOSW7MgJHSlbV7ryYvfHikTGZVmqgBwoGUK7mzmZZS4DUt0Cu4LBAa/hd7Vg
 XHB1dsFPDrp+wLsNXv/yNDiXQ48tYI+DeNIcfSZFhYWSNIw8hi8SLLRi0tWRtXmA8Bzo0fxKM/o
 goNvaeT9iifdUVSoiew==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a82c98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=a0c4dxopxCOJUshKGJ0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
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
X-Rspamd-Queue-Id: 448C21FFEA4
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
4nm v7.0, SM8750 uses 3nm v8.0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Commit msg
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

