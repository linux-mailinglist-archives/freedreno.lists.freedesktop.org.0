Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBL2Ol5fpWlc+QUAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:58:54 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E531D5D8A
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E55710E47D;
	Mon,  2 Mar 2026 09:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZvTX/TF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDBWlu3g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABECA10E47D
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 09:58:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294ldU1291376
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=; b=JZvTX/TFus0PFkgP
 smpqYF0pKuw4Dh9dOB82LfeLNny7gH9hwTq/dgVIR4UVpRC5LcILkwqIU7xpjSCA
 Uf3xCrFDPtC9sQn6rMP961wrgF4zFfWIwI/uuDz+RYzorsLf3ISQsgMmOSEw1gSN
 H16dKGXWfjbmLRmC7Ng6IYMbol8IFJ9uy+9pfQszUztJeeyRu11LaxZniEb/oE3V
 WefihAwI+UEaEYRNdfxKAytPMaImGywifHrU2Vb/3pIwB613StsjIyKPyB1AcF0p
 ao8RXhvua6hIxaqZDsAwvanNgTjeGMQtZkb+Nzk+P3hElWFT5gm0Mf9Nsjr5la0r
 FEao+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku06qn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb413d0002so3746740185a.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 01:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772445530; x=1773050330;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
 b=gDBWlu3g/lwbLzzxq/khfkDFLOKUGYSeQiiO4QE8q5ql7D/8oH2ti9Pt+Y57zn66tU
 DIoRcwh4WSczgwU96fYnDwFkMXyGEaiQWh/qhIRMlQ7A6CPj6ArxwD6Q9c5DTILNoikn
 1402tvHhMGqddn/88XaYvuqetwQ8gyv5r1spUoo0fXgkZKbRSNydu7ZrVVNuuBJcKVFb
 pNb3uomWl5IrxG+QQGiTerIXPsd+N078pq1zIvMAgb7WQj4gRmoWf6CgNCExoCJhzQ3D
 jkieFXemQQukgGUqWq/zthHCYC95XFxqB9e7naa4Lt5FJYXq+ydSfx3ARay51mQmR2fC
 kK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772445530; x=1773050330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
 b=dri7EBihSEp6NFTUJtRG+4CyiX/tkyZ9/1MChO8PtsyOlMf4pugWjb+pqQ576sNBaz
 WXWtFu0lpYTaCoxoRN4MsVjO6ViWHItj1/wLoOf6EI5wGwVSo7ZAwbBTnomOhrpBPyL6
 NX3o0I6bCNgE5Eg5PGnsUS/MCD4STW72R+bjeemQuDtRYkI+IikMrIAiTG2o1taQWCff
 NS7DO2+xgxpn+2O4aPLUBpvVk666zh7XQJCuUCtAyUD8SNJ/AqvuFYHgcDVhGqs5b2nJ
 qVjvEB/OKKpURi0/q6sru2LDkP9xJ9IwB2xx6IgQfzBCo8lJ2CSGUHD/navPwROAGmpi
 jvNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs/3gsPlHJIUm/pVUs6DoFDvOJMUEwDP0IhUHpNyD4nOK6RtE0lg33JanUqFDJNKLsnWHiNwtDo8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkJ+vaTrEtjzn619uHHA945YiK+LOFMninbyXXrkQUG6m0ctxG
 SPMcC9sTcRpX/luU40MglbOlm1QweQd554f8R1E40nAXPStC9ZBzNUrDJK1IlKCNh7EzwXv8N4j
 ybi0cVcILFY0E5QIG0W9Eui3IvZWrBPlFUh0/+kRAdF/MFLaoHLMP/Qv8tr6pWZJIxwpjvEo=
X-Gm-Gg: ATEYQzw0OkGAX2aI7/5/YYIZq10sRF7U0VEsaYP94aYuBoTgK1hFJDMEPViSa8C3ey6
 2hTJA+/7PZlWYqqjqmkikFWqTJcXX9xUKZpvjLCuvwhIoMEEhNF8MKu4kwnYuxfb8vrzR72GOak
 VG6ZmRtCX4qTWjqAkTb5UCv7Losucb7F6+D+QoJVWMAmx0z+MEwvhBnr2dzOUD6VCXSDV4Kiqs+
 Y5zL3JNuoVO/oN5/um43wD+ub5J/zovE/tM+xSGX6Ss+0+bmAmBAscScPCB0Wc4JteL1wD9x+AG
 JLhrJT0OYQrZDUJpAtNHiG/WohOr2uVlVv62F9xoFsYHt/A0nBeyRjeyWOS/E1oTsyOQ+MfSYVb
 BqbzNcQFzyicnHhlVEyBTjQHYap2fYg==
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id
 af79cd13be357-8cbbf36a89dmr1665567985a.15.1772445529935; 
 Mon, 02 Mar 2026 01:58:49 -0800 (PST)
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id
 af79cd13be357-8cbbf36a89dmr1665564385a.15.1772445529405; 
 Mon, 02 Mar 2026 01:58:49 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm9523027f8f.30.2026.03.02.01.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:58:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 11:58:35 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: msm: Fix reg ranges and
 clocks on Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
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
 Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ugiE5l8CcjjtV9Npwf4dBU2Z3sbwAjztE1heu0QvfRM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppV9TBAduqk1gcr0xXxNkiQDCYKg8uz16HPzEf
 wewNSqwUUyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVfUwAKCRAbX0TJAJUV
 VillD/9gXbcbldVwFesEX/WpAjC1aiqVjQ7lPDaV9iSKTn+vNs3Vu8SZ2r7tcKaP2PyQexSdrd8
 mrYVW6J3DqEPW14o7tdPhVckKxCPPt9sHOxGf+XSy8jICvBtg3XZtZQfwPI88Sjg7qttvAAqzI+
 E+FzWOlIg1L0JLD2jJq7neufzgWFhrfvu9yyoFzD8V4SxIsd1MdH6WpUYdDeiWNJkbQ51qW91hF
 6G2dvHy++UYb5wcdMC++IqeTVikEgqO/+m55R08uoFfCGtzH3MoYXCW2N6ux8yabUVtM/84RgJs
 wVGsGC9m/ZdU+ITDYRGemhEwTQ3rGgJ8cQbrESGbLy7BwRyPrDdoCeWckWLmX87iJXwY1NLXOgg
 l33eGQkr7WSuQflEU7PAmW9a8eCzLRSRZH5xUQeKd0tTiQTwdRDI1qdY/1cyROjr0XVb4gylPOt
 pDcxSup+yLlTnT/be6+IQFgeGI1pYwjv1BcBaAXA4YW5xqxwpTaP6/SSm6hlwc7ruzSLj8MCIWy
 AwG3TypK46asAnzCYPbVRProLx/iVDYM6nT3hJoOrng5fNgwNE+PzNeaKrk4D2VYHIgajls0kX3
 cPEAAj/+Fy/5yixcFL9nx4VpSmJw0/SjerRjFCZbZI+W62H86Ke1Gs2dhtAt1Hpx3vpvoMZTQoL
 cep0UDwNFCgKuqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a55f5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8l7133DT9HzGPwHiDQYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 29A6J30k3dlYtxgsWdinrj_wdjjYy1gP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfX14tfy+9f6wO8
 1JTkCYMip41R80ZamqTkIbrqJelHEtg7n2Am9W/+iiZSf2ydlgnvHBBSyFeWelhA8Tbgvkmzwmc
 dHyjw05KECd8fLraxu1xFlf4jctJu0de3moBj64oEIm8HZfkg1oBC3PInYzHKWTYddOYBYJ7PB/
 Znu3w/9u5i85NyPaFc6Vu3wUUSKb0DzR1krqVRxIbec5j58EHTObcj4eg0fnvJ1iELbNmFub8b1
 l95RaHiPdwviMLv6k7sB7xZArL5v2I4mWtGdDVxudlG9h/0YxG+IFSojJaooea2kxSQF2wZ+Bcr
 iKaRx4eK5X5fhDz/dhByjZWR6V2lk/qL6cJY+6OXJuvqwYNg9PiEq9rKMACptrzrT7PzITZNSfl
 gVega5PzMOy1rr3Uoj5i0Y7m/z4KCXT+y+HL9wRsGvH5+69vFZ7jXVWI/jIK9GYOzwNzRR1cIFg
 /5P2Du6l9hNuJL1rYbg==
X-Proofpoint-ORIG-GUID: 29A6J30k3dlYtxgsWdinrj_wdjjYy1gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020082
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:stable@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: A3E531D5D8A
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: <stable@vger.kernel.org> # v6.19
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

-- 
2.48.1

