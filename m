Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGGhCG9ZpWlp+AUAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:33:35 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8058F1D5988
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 10:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E110E46D;
	Mon,  2 Mar 2026 09:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmWlgbr/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYGgZAsV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C8F10E46D
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 09:33:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62281Hgi356388
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5ubBi6Bvh6rrf+XIS9huHc
 +cLy2tCgROMoo7C9gzJfw=; b=jmWlgbr/epNgbaGvrcR3koGVziEIaQZQlvqU4F
 WCMgULjd6oFL4S/cxogG+Aen9cmaYtmK2jTs9HFLlLq4Iji/JZT4IVYcO7GjtNSs
 ZZjBXv1rn2rM/mD5EL9mNEiSWokfWvdqE+Z8337U1LAI7OBSYzwp6QdpZF7sa0cy
 TqHfI95nnPfbP/FyGfXYdn5t81Vx4YWHk9Gd0SR1TW8L3s8dutzJw4dWINAgtfNt
 MgSYGVjnJinhJM4v71hqZ/dIZLCo8lb0oudH1YLESvdLGV2Hcse0LUpAPfLs8xw2
 TwYKsfCZ+pjQCC9PG3z637jQw6VYsZ/khxRAmuMFdMDo3Iow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649r6a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so2978853685a.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 01:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772444010; x=1773048810;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ubBi6Bvh6rrf+XIS9huHc+cLy2tCgROMoo7C9gzJfw=;
 b=dYGgZAsVXwMu4S5ocHQkERpA7akTBLZHIZLJcS/+mxZnj3yUnEvMRIxG0VpmKiHPAW
 cmEpOLfKsANzn6tbNQ+9hTkWSaIdaTuNzTxOuiN0RjAq94kPrbD7UHoBTotmaMZmL09/
 yalr6IPGRu486tu0+GS9t8NXnXbUQFl/lCm9FZmStJeK1zuc2oeqcE6mCUo1558L4QHB
 64DmO2CwvxgyjhpexLgEZSFt/lYfPIwFwJ74771/O3pZoYwy4x9syXma+aOpyeJoiEm6
 h553P9NQXVum02RPbsyQjq8ZrQSkLeimF167jRaFHn86MY9TaJUPoaiQ70SA1ydrGjKq
 J4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772444010; x=1773048810;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ubBi6Bvh6rrf+XIS9huHc+cLy2tCgROMoo7C9gzJfw=;
 b=clVDaSoFa210VpTIyj2cwK1dVF/o99w8XrWSbyvHWcnZWvlTyG7CyJ73M/gA/Pmih7
 UF9vGEBp9k02/C6QYp9xuwbJ5jTEYcHGpF3MmV6E1DJNXUtjbUrhBEJAg5rmyPtkQCTd
 nWt9OKpbLH0JOnPGDcEi4wzI9u2/J6yKfJ8wvLFKDYtUwqyPxeLH0m0Y+Ts2KtiKobWo
 rm+VX9avRnHl72Ebu8/FUA/AhTIgAYFYBF1AvLkiPwuGIV7sNjUr8H52LERqolexOt+r
 aRVQ7TvcXMqIbZbWaA2zzLGK1zD5u3T7575xV7+0qU6uzMlwY+YM1DZQKDtWBOMxQ1M6
 Lgxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc3rxUuYJT4fC+vGiO3y1/4D23fKbSIu9pgHyTfvbi88K6tm2AWuANd1bgtnFO6izC9EenA6z3T+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcsXSoXY6nZik2ga1OMwsYA3BVCAqMTUxd2gLrlzFmNFWNLYqg
 NDRCMslFh9uPG4I+67DQqNxsEbRyIck0ZwtqC1MagAxK/Ri2EzNqvs7v760CLeJ3Uh+5x83m0Xd
 TiT+Hqau4n47sCIIg4oKw+L9A3/ZcghSrvYBlPXRh1HKj46WDcR7hfmVEVbM4l98FExpLTOA=
X-Gm-Gg: ATEYQzw/R3WOLU3CYntZ8lfSzVjTBXWgUE8BfUMORWgHSYjKg45ezKGXw9FPw3jmGOR
 IpnBieKJXVPdA336IQ4Jg+0nnG6nzwp4YpLpuGX00yQWhvMi/i2PLVhu73J26Y7T5Va7M3lZmSZ
 HJjKBshoR+RMHUiOFcnel1HAXC4xFDnoFyjp9H2yhoSwPshQStF1Nd998gAJ4jCl/6cJePVI32m
 ji3C/+OZzSKWXJnWUGFUy6bfpBlOiMQP9UfEz7ll/UeKF53sTJn+VIFF+2WNjivCthImaUgpRjl
 8p/C65lDopKW6VxQVsHRwa+7350DoRLkqKz/cTNioSuonhUUpipGRPMzSO5KIV8sslXgtTPRUvb
 ERcpyymyF1ybA7OUnpJPNEGTpun42hg==
X-Received: by 2002:a05:620a:1903:b0:8c6:a2f2:d874 with SMTP id
 af79cd13be357-8cbc8df7154mr1251283285a.39.1772444009907; 
 Mon, 02 Mar 2026 01:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:1903:b0:8c6:a2f2:d874 with SMTP id
 af79cd13be357-8cbc8df7154mr1251280885a.39.1772444009263; 
 Mon, 02 Mar 2026 01:33:29 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b485a0b6sm9968789f8f.39.2026.03.02.01.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:33:28 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] (no cover subject)
Date: Mon, 02 Mar 2026 11:33:18 +0200
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5ZpWkC/5WOTQ6CMBSEr2K69pFSiQRX3sOw6M+jVKHFPiASw
 t0teAI3k3zJl5lZGWF0SOx2WlnE2ZELPoE4n5hupbcIziRmgosrF6IE2y39FKFxHzADKOeN85Y
 gogXdBf0iKHlhuNYKsalY6hkiJvvYeNQ/pkk9UY978W60jsYQl+PEnO/eP3tzDjlUVVOqQqjiI
 uU9EGXvSXY69H2WgtXbtn0BjZ2CTusAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wY7IfBK8MfIbdgSrQbHeq1IBuOSDLU4dySVR+TMj+EU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppVljNJoUYrcp3sFgJgfG7g1yxqArNlmlxiWbg
 LX04b35ul6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVZYwAKCRAbX0TJAJUV
 VkkmD/9amRQWuF7D6PlMnZhj2NQWbjA6DG5LlhmvAVC3EGZGJwFoG4jnfnYJO4lwoo6Wd5aGXX0
 jhKt4JeiYjupoNG6gGFS6VUM4LdCaTEfzMqmT28axTDvr1M/PILJubPkO7KSyrIPwAQnTmdE1o6
 9jeTfSco28cAAH8f+lUYPaWFU0tNoq9iiaHpP04UPRQXmlmirMAQoxqGOcS0ggU3ZFlsjmPAEiZ
 Ig7Xq58wyQ2EXHBbA4QeGPrX9B3+Up5lf6ZnYTOkrIhQVVomtvclMfKhnImrMwI4RirQMGB1Bvd
 RtF94+mXeuo8u9vY5zzTm3JJc18UaIAj5yBGeIh0XXvsrGqjp/x99+LGvs+Ff0zG2H6LCOjyrMh
 0oBAAHdCjAHGU+wqC6y/3rG9UHJF2bM5JEro7rnsAEb0mLDlXEdbdKm5niDhRZnuuYvBD7/rmKU
 lNuauvlDRxHHmspaUpB+WuwKVf/3GFcuHjar62h46raRtm5XQLfAyqkVhPaew8nlev+u6XSwSJk
 exoBlt0bNF7umd4Ib5b+5vweDolGY9b5DiqROuTSdxim3/iQw+qRkkeUXimQt5M2iFDInY8X7U/
 XHkkpVW9mLurO/HlVD/oO5fTYDE1+mHWVvn9irg2CAhg54P6spBw6q7YlyPYKiCcHHlX8d4909D
 x+9ChDaY+ozmyQg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 2i0gFtIc2MI0VMfu6-_4pzmBBAINTQ-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfXwR5TDtLZ6wxZ
 It6++n0etfxLBQIE5cjtu5b4vmC+lgZ5HdXDr2A0D+leAf+tqZrYuPU0ZI6uUrpJBEBLgJYgRwP
 Qxj6E/Xj62R8ZHinb4L3fMV4Y+1Y8NOBIq9yEWrRgdQk9OUGq+iwp+10Y5cxenrQQ3qaQ7HEUuz
 +Nw5BMelBorZuqsnUog301AUvTSHylppx+FD8uYGuI8NwAKTg8HYt685sCrRiYMJgkzm2MK0TXE
 N10YhpXBdjcaCsvg5uIMQerMX/TDgyicBncc6cycl2+SbZLzyPpDVm+dAHpEzvCHjubKfmRcxiA
 MoLl6d4YqcgjpqH2ezkMedz62bpQiNgzSXbImrzVNH2Cyw1G+e6d1Z4q65RHn4J4ujFMbw+fSu2
 /fNRdKkjvzJEhiI17cqKg0fqeQIvF5zg0V5J/c7vYE5SqsHVfnE5ZjWMajY5OXO0iK+j4BhDJfb
 Avo8qNLwITJFwofRgGQ==
X-Proofpoint-ORIG-GUID: 2i0gFtIc2MI0VMfu6-_4pzmBBAINTQ-b
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5596b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DbH3OLhbisy877XqOIAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020079
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url]
X-Rspamd-Queue-Id: 8058F1D5988
X-Rspamd-Action: no action

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
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

