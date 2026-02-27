Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCxSDNiooWm1vQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 15:23:20 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2911B8CF1
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 15:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1AB10EB9C;
	Fri, 27 Feb 2026 14:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmS912TP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1/N4dh1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2EE10EB94
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RENDso3996033
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=LbWv1DraxFhV/1oko2gTlG
 J9gvfW5tsF984h+FYSIgg=; b=TmS912TPM8oZ0T1JYYWp2+GYljZJJQu1/xudc9
 HFvah1a9ToJEJwXgBOeIdUCULeHTsAPS3VHsbv3TaRltqzZjwrTvWVaO0vpEfZEo
 aUwzFCKXGLknRMCSGZZu5Fsmzas52i7UDLvTI08fqCAFHhqvBoCZbCNET2sHokQI
 uAClhIFEDZhK0rkZKhGerzE1kEYrOcU4+Am9c9GGduudzkrqUEiKBlt0CYK0m4Ye
 AUpxQMZFEPLkSLw/uFVKWtTgkFzgIScKYv9xBjcpJG0N32R/g2ty5cUDPpOGt6jT
 PczM88Ii7Zmo+/Cv8ZuzjmS9Y6Lec3627tgY7htdKiyLrX/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r3p6p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso1959505085a.0
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772202193; x=1772806993;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
 b=E1/N4dh1jYiEWkrK4EemgxD8YAFDe9G7IR4O1OMv3NNFr55hUdBOgOIz1NZlzOhOSo
 5vf65cXC5xsOm7h6K1EKU9b06oonE061N0JMI/jI+fGYVO/RchQKLTmFhY8HP8uOQM2e
 SRCI4Fxl5tVCwOAPsy0UhwZKXwa5vaQQQ94K0AIEt3WOh/zu7SKF7zV4Fl+o7xDyjYv8
 wew8Sly7cRlqkh8gW6gy9aviRGbThcpoALQO+D6X9+s9Cygo+EPgiSTs2/WBcKjgviLe
 6LBgQ22AMn2rG8b3vVJZP5iOCjIZLrOHMt2rdRzPf0nXt1WFFbohktClyFhVqKxm1ZMg
 C9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772202193; x=1772806993;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
 b=fAPuv+4tqzxJQDnFNiD8mXwD87qCLY6+3qoAv2i0yLLBYskS5ZbykheVTqez8wO2IK
 4eZCC3WJq+1ZmrssXLVyQvkhRK5B6+nUZ9NCL5nU6ObOCKLIiOh1NsaJ462GoCRSKfpc
 fFPyu8Yu6HqjL1sOpLr3JIpMqhbVwvF3tpTaumJBKNXwPCNPaaTqj7/kzXCnmU9B6FUe
 63LM9CMAJ31a1bHZsckIfeF57ZOW7/KXPafFZaReWNheWvNG4EU76rnMEP3+4znA1ru0
 gqkMn7T14aeQNwj44XBqlAD2oTHkYg/8SidDgzbYnwlEc3nGUezOHHtjY24ZZd12w2Ek
 ye4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCdlnZzNbtvl4EaO3QEL9f1o7QdcSNDyVJ3NmXyQ8+xlI+W0mT9Ytv7oDNN4BEb0aX61vyENyS8VY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwndSVuFMfCPVWqeP7hNIvUS6FV0/yFJuwbNfi8B2QaUDrLzO5g
 l4LZ/SpLXd0KhlcZuhqXLe0BCEbX4/wGg50TfXuK5GpPt8WWlohSNFbJ5sCi3FO3imHQxVffMRe
 4yPAhFDVOIimS8sA9zucq5q2cpmIfC+qHptsBdK3oqUQvt4la0GwnvF5Onp93Oy3LngFg3YI=
X-Gm-Gg: ATEYQzzFqqPJ8hKdl4vAJz7hTwO+86qUIBRFL5UCi5ouvlC+b/lW0geg/mk5Lyl04Z7
 BQ/vK54w9FeSe4/J/XEjbUHu0Rfl4mS+GtzIHTEHIhms7MMdvy7yGEg1TAfoUXBKHCGvg1XttFs
 1RNyitrGnP/YYCSDRaMqd3P/ZtyyiTJr7vyXfzwH+7v/+1TfDZkmFvsbZF/ZBnb5k3LPww6ASUD
 4GCU6WlRltU0cjR8jVwfBxQIhEg8caUtrEFyCJtLLKhPv7CIF7rMU3VDTqArAII4dhoox0Bdtg7
 iJpCZaOcwVZCH4oafo7aYyfD/zjy3hGRnzHt85+9EocQHcrEFoSZFFWhpeZtIDPGGmmNGo2mTal
 TASbv5dK80LKAvOPVXOSSlLw3mECF8w==
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id
 af79cd13be357-8cbc8d834d9mr328562785a.9.1772202192449; 
 Fri, 27 Feb 2026 06:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id
 af79cd13be357-8cbc8d834d9mr328558485a.9.1772202191836; 
 Fri, 27 Feb 2026 06:23:11 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbd781sm120204765e9.8.2026.02.27.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:23:10 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:23:00 +0200
Subject: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks on Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMOooWkC/yXN0QrCMAyF4VcZuTZQizjmq4gXNs26zNmNZBNl7
 N2t7vKDw39WMFZhg0u1gvJLTMZccDxUQN09J0aJxeCdPzvva0zD57kotvLGOGGQHCUnQ+WENIz
 0MKzdKTqiwNw2UDqTcln/P6633baEnmn+hWHbvje5QwiFAAAA
X-Change-ID: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qiHSzVHBwmKCmpWxCLWKkvn6EVGayWKBpsn+FNXo6ls=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpoajGiWV89MPuotO9j0TY9byhHx2MtflA2zy47
 idxX7lWc1CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaGoxgAKCRAbX0TJAJUV
 Vr9rEACSpY2faiOnGoMe8kzSd6PPC1vk5Lhem2qn7I5lzQiTwIU5M4S1kbzLpT5wYDWRjvjhBcI
 toEwyTpL8I/XsVi6s99yODDmyHebSPdTzrtpGvPpJzLgtBkKThB7pJ5hq9Kx7M15GfO9LllzYUv
 bLihWNPYWrQkaqonzlMhz+fm5SiH5ELbPpDrz71CTZD3ImLg7eN5XP9YS3K+OV0dJSz/LnddKe/
 +1PSUZM8/HLrjeHPKzdaO3rhp3IYRkYlO5+Q1nCL2unqNtFJNpg7ZKMYM6jKX3r3Ru8jJJj7PxE
 Kb1Ak3mCCD0BHFqcDdZRcwlTV7i9WUaCeHGu+01TImDY6IdQs68d4ysn49PANwloB3siaOkw6fs
 YsqHcuhI1N7Ujxbgbu7zB513FrJ1/21SUsVI22c9F0lKAR4HrHbBsUOplAmEEvlzn8XHU5FCEbx
 HaLIrLbB1Ftpw0cRgt2vNxMmNgl1CwrAgxvJNV++e9gC93a6xxdLD6gIEiTfMSGOsC7gBzTvp6r
 sXsLPuUfzG96aRpmKG6YvmZcSkWmWFgHle+dxO69kXw96UcpMM5UN9tm0zlsmc+QwH9z1WAeKXj
 cCtM5cNzwq5I73QXh3azZXJq2yW1o5ekJLewh3V6mBGACNw3dK4ciVgoXLoEvP3r48Ag4A/sPZ6
 EyT0FRCQFE7x5ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNyBTYWx0ZWRfX6Lw+/5MftjQm
 CNjpuNZTdAPfDSwpD3Cwb5jO9/d/9ZSYSGvVni8sJQPlc8wHp39uwK4Xe9LQB3tCSAaFw91ENhn
 +XutRo/cAx7jEUunQFNUd4gRR/3Y9ubeZGEhaCrQDR2VpCLhoPZoSrbxofYItBvF2HkZwtOJQK/
 Vp6HlGw2oEkhhOLFspOGnFl0kgX6GE3sjaHbMYcl6eog1zBJJ3+8KNbmedD7EdJ+YMXAY3Lmc9s
 sXBmOWg5PwercdWV1ncUAH9urIMqgTC70DQnNxT9aKXivNlSth9bVMhDaL31xlliUC2PMw5b3Ah
 x0qUQ5iP4hUrSYFLtw4LEpxr3Vbc5V2dPgRcQOl6iPmspiCgK113oZrYwbwJufJb9KNMbIrIxkH
 E/ZRIPp5mUxUVi0I6ykW4rOT78oQFp/1MYzu6eYFSLUnl+lOUtGq6m86dMQgSBYjAG73jFWwkwo
 P2OP8kxWuk3htYafAgg==
X-Proofpoint-GUID: Lc2r39c-NJCLqPNk3OlPDb167wigNu7i
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1a8d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feC5BgBSBr5ATEYaNTcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Lc2r39c-NJCLqPNk3OlPDb167wigNu7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270127
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: AC2911B8CF1
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: stable@vger.kernel.org # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

