Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONBrIl1fpWlc+QUAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:58:53 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9671D5D74
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492E110E47C;
	Mon,  2 Mar 2026 09:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyXpO75x";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYrhnw4E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8614710E47C
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 09:58:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6226hChH2504657
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=iCtSXsUWu7OcMOBhOgieiO
 gHacTyjFYNQ4EssgN+P2M=; b=JyXpO75x/l1GelWNo/vOobT2f1+C+ejGeOWVI5
 yOGeLdY91dk+GKj9aVLEhkpKm55ii03+inQ5VYfIuQr40jFbJu4ZspOCPuCkyjSx
 oFm7tInAHl9ghiwPBTLdlJ8xUETJZqmL0l7oQE4p9A+xFRTGzde8MqOaQkzzi8lj
 ZaprTjVlSF1cMXbOxzW4YkBrvd2t1Fckb7xA0fMDF0G8h7mA5pPf4rd7oI/XoD22
 /nybL6aEfp0XHxTNECPavRuyM3I3JMcBuVXsgl6j4eABLm8m5hLx22WscT6reAUJ
 Jjh6GDFl1lTXq3f1Acnh62nqgt2Xn2ugJ+D/9qrEAkH/M/0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herqeg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 09:58:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso3443420485a.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772445528; x=1773050328;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iCtSXsUWu7OcMOBhOgieiOgHacTyjFYNQ4EssgN+P2M=;
 b=RYrhnw4E1dh3+qTYReUUxTNlMpiD8XbLpFDuZ1f/RP/yo7PQCzdtoPvTf2NWURAZx9
 zRXl3zDusyk2RP7zw0etaBQSluuI8fS/vmlOsad+KsPNdDIbuC32K6Ii8VgjJ3A1FCa7
 qcSdtIIwzq1HGhGRM3vnAO4kCSIbUqTNqTofgsFIMnjnBhNwafAnO6eai/QpioHYRBp1
 BDaaGY2ZKI/VeJwV7JTU1J/KOx9a0pRVbfgtRqPkDlRVqMX6rrulCyqy/+bxLbm/zRhw
 Mw5qnxqMgio8Z3XxPVrelWgkyfsAEUmc4x6p0JTDRkKycyc0yzRXuSLF49R0BJRcAZwF
 LokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772445528; x=1773050328;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCtSXsUWu7OcMOBhOgieiOgHacTyjFYNQ4EssgN+P2M=;
 b=ojYH7xXh2mbY4YYWBpxRTW06hiYCGpoZdHPxJlwVytVmKM36tO86eDtrFsscuSN474
 d8GnQ5OoC7B4v0aKj0jEYI+4OvqVZjCdf8BZCphGeIq9HYGep59Q/pXNLepaHYPAASxH
 DBtsHc/A0hiRlpio0u1kQGtTXv+vKFV5zDUoHNEgmjOvdt60RYWDNQD1gx1uCAsDKAQr
 W+9oMLf4aBuYsDvT7oQV3Xmnicyay/KZ2TUKNKxGl2fx6pzHjwW8L8Rhi045bkP5yh4r
 rQwwBFt5yk0Bk3k37GiKgK3GijhLqD1iDKt0xdHkRzlTS18Zi8OiWbpR+/7xpB6D0RIs
 FVwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJfOqC68CD3kyb68eomFOvgbjRpNpHBJKQBLnu+9m8skDC4XfJTomzR52UXZ+qMuw9geSHft5P3/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys3qKVNSDIlfV5SuDE4batudtkHu6K1063Bpu1Kj+qoYWbj9Um
 tdRW9rIndvgv2HhXrhNRUwuQzEGEPIMT7GIOxdpHQLkJkmsMMTTS27cmBSy8lPcjbc0yZz06zTl
 GeFGG7jIUFUQLRWoAfDGYUIhcdTIVhmLOWl5w7riqGPJN1s2mehjhnlMEjUWtE1euWW89l5E=
X-Gm-Gg: ATEYQzzep8IaZDtf5z10RPfxpG4ORkXOstMSs2gouSquhD2w58xWDxPbgvT6sxkIYzm
 jwhZSSEUjrqaqy9Vllowv7RgB7vDZhBLMMm+h9EgpYizaMNNuH0DoNGOd2wiCWL/977GaBq5SHw
 xOWjCvUVSBOeDyTDfl7CZ1Kj1NMsPkjDqbZfk9IfYBbYr8x/udcczA8kmHuvhtS/nR2GZkCsBVv
 s74qV9/HEZKX8WQCzVsFZP5ZUz5RJIRmXX4C6IRuEKW6xooNifaLF7oZLUOUCgAslrbezzy5gJL
 +WGRFR+OCpsReVCiW4ahbsvJqEkuqZj2/FKNK58MHLma5v8tp5swTE0p8sFYmYEsRKIfy+vEnIU
 qWREZVNu452606jpbIowqz+mLTWfeBA==
X-Received: by 2002:a05:620a:471e:b0:8ca:20e8:f444 with SMTP id
 af79cd13be357-8cbc8df09c5mr1659272785a.51.1772445527927; 
 Mon, 02 Mar 2026 01:58:47 -0800 (PST)
X-Received: by 2002:a05:620a:471e:b0:8ca:20e8:f444 with SMTP id
 af79cd13be357-8cbc8df09c5mr1659269785a.51.1772445527303; 
 Mon, 02 Mar 2026 01:58:47 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm9523027f8f.30.2026.03.02.01.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:58:46 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] dt-bindings: display: msm: Fix Glymur DP controller
 reg ranges and clock
Date: Mon, 02 Mar 2026 11:58:34 +0200
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpfpWkC/5WOTQqDMBSEryJZ90mMUrGr3qO4yM8zplVj81Qq4
 t0b7Qm6GfjgY2Y2RhgcErslGwu4OHJ+iJBfEqZbOVgEZyIzwcWVC1GC7dZ+DtC4D5gRlBuMGyx
 BQAu68/pFUPLCcK0VYlOx2DMGjPa58ah/TLN6op6O4sNoHU0+rOeJJTu8f/aWDDKoqqZUhVBFL
 uXdE6XvWXba930ag9X7vn8BChVuresAAAA=
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
 Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X+mySEiLj/X2N40KikSw3L+Zg2B3m4zZp1U8WaBFubs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppV9RxSQpE808cNLAeohVls5YT8Atr4vGjY4XU
 NnnCUza1/+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVfUQAKCRAbX0TJAJUV
 VtPYEAC9wmhC4eBN9sCIQphv+PrNEUqfswJf8Ynvzuf7D2LAwghKFVSoYQCAmARFbplJGhOI7+0
 4GQjcYp7AmWEhxf8dQd96DToCQkqfigo+TgN+gjXy89CkJdYgYxvJmJSdUm7cPAQIT7bq74XxrT
 9b8k5c9F3oodNlfUsdtYQs49HUe5VH+HMYryXMUxJfS1BbQRJ06rgWgL9FWSuUAN6/rlM8KMKFc
 R4SabTBroB6sug9oVzHbiEoGZiiAGnSJSVxnkm7yppPsoCbJOn8yzA4PFfQCTy66+7euj2FbYEh
 G2en1qi2+u2cAvBvhUiRWvtX3TAqgJTIPUIsg7KjgHv43WOgbl+uFNtS9HFkM94r7bOP2Q7ZBM7
 T2zYFEuONYfxW1HpOASPtWg5tiMVNfGETYfDA94RfaxHHsuitk2kVAjkwbK5glUxeKrvA2H/uKE
 lxLNrElrL56cVsqMECjSTXQO59pcQCUpNCCPQB3+T0sUdUJ239iT+aSeiNmRcVgBKq8c5ATC0Du
 MOR1kRxCDpsCWBfFdDiqwGbke9ZicQxk9LXsRaObib87NqN811/HkEwmtxAuTwvhylNVU8jSVzy
 LmDvI37hY1NRYvBd03Jco/KAknNeI2EqtxDke/7HM4gHM5h+yJCAA5GvzDhOx6mPlCUaq3qYViG
 CzmAxD60c2BQ3UA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a55f58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zEcBLWh7pef_YpQEXFYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6b4PuTZf0oBfUtnaWPmNrhveaf6COp3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfX61k+LLc2bohY
 3ApDBhSkKlKu12WwiqgcD2sK9mL00t8h25J21Bp2OxlH4aIVpghsBri0Nnk2Ru+HV3nVh29WmpZ
 aeibtss1urIkshcYYmMDZTtdE78PZsmTorR93Bfzn0iGdi8fc4pnvEhUzmOJwAKKHLQG4BHT5Qi
 68FYzZ0x3cWhqQowL04AvLVKplK9RuBK8aCwzDXiL+YfMe18MPhiayc8VDHzWDkxja0xDF8aYf7
 ZRjt8XhPEQdifSjpsMwEzT0BjUjbpmUUvJdEorDHQ6Y467RyI2ckXIkfVe7/zhdQvt65wVxt2Lt
 15os8AKPEzqj+LVYrUryLAp3e/UQ5xFszcNW/DaHsihAQIlmXMYyOcScmQarDkZZHdggl4HkRxP
 QDARWdmTAGJ7xd+XgupXRXEkhDsoMKIPXtsSz/6hig9dPJSgBqrHqAsINbQ8Xf3tkorEyxvoFuk
 uuD2UkOPo26yIUVSR7Q==
X-Proofpoint-ORIG-GUID: 6b4PuTZf0oBfUtnaWPmNrhveaf6COp3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: DD9671D5D74
X-Rspamd-Action: no action

When display patches were initially submitted, they did not include the
p2, p3, mst2link and mst3link reg ranges. The devicetreedisplay nodes for
Glymur are still being reviewed and have not been merged yet.

This fix resulted from review comments on the devicetree nodes.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
- Link to v2: https://patch.msgid.link/20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com

Changes in v2:
- mistakenly sent without cover subject line. Please ignore.
- Link to v1: https://patch.msgid.link/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur
      dt-bindings: display: msm: Fix reg ranges for DP example node

 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml      | 16 ++++++++++------
 2 files changed, 30 insertions(+), 7 deletions(-)
---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

