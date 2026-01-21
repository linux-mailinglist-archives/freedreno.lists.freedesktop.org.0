Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNKbOKv4cGmgbAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:02:51 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25357599EB
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF310E824;
	Wed, 21 Jan 2026 16:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxoGDr0G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KS7F9/fJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133BA10E824
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L9iWTk3481458
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=aMdXQSvss6tWFyMGcNBPhn
 c7uNK1YRXhNFqpjDjbWyo=; b=DxoGDr0GkOfW2gIbT31Uz4ZqrMqx2/E5LGQbyM
 RumwKOKl8XAi3mebUuhlcrDRXWDNZOS4zg86xfbrczh10X16bAi/DeYJxnvPDjTW
 2NEVeNvgp61UWDbaeY5pBfWpEcMb09Nj0xY7W2COoLuJ3fQyGmRA5geanm5BOGsH
 6QqzjpJC4Um8ZTypX72LqL4oJF+3g3IVeFeSHPgNL9GmT7BlrJAo30PWvR1B9r4U
 20YaugDfvhM8DN1FW9NT7noOwpZ7a1eJI7P5VlD+Xt0qHKMYSQR3zJyFCjg37yVR
 gNs/kwNV72K01edCnY1p3sFuZycL1olbFIM6Py/J2KqoxJow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef195f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c64cd48a8so44237a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769011365; x=1769616165;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
 b=KS7F9/fJScT0cIu0VMKBGJ9HoTfeW3cnFIrM3oVS/pp4naPIF4Hb4OG+B/+M0M9r6x
 YUu4WHrn2zyC/rhHuANtNgDEPdYJs9zozmX/VWGCFGISTdpXHCVMJBCHCGdDBDxn65ep
 q7m9WSpC6uSv8sozfiVsfc1QI/ugofuzAWRf57FIsnbPNfhgBFV6jNvNBw95BPp4WkwI
 lGFXYgA775OMxTFP7nhXSL7IKFN8DmtQ9XioCaDUEWolGV7+GwXXsaZyRFnmShAtuC8s
 DVBYto44k+4x9CgjOImzidHoJuaKj+2UZhQYam5Lnd6V3fAfdDmMWT4Ss8glhKEz4+4E
 2d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769011365; x=1769616165;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
 b=cwvBBXoNJznC4Yym/uNMyFrbwHlM628c6CSo49KdaRmIq48qUIObpvidtooq2a5I6b
 XgyEjohWaYqYG8a3xGmGjTEDGIQIy4Eu4rbttDiizMKiX51TMlmVBkIAHNhGgVb7nEuu
 XV7MTNim2o1Ivg4xlhqJB2Z0FdMoTG1guX3Cp9h2L+4D7SU/UQzVDMKh+u3Duu6zzhQb
 8yj25oSlactVmSrNOmUBe9LqPbb7sIp7QKaXpVGUzYktC/jBd3ARi0lZgDh47F//yJB9
 XxvAWD4kMwU1ggMBfKrVjHwPjwJ54UTSm+eitbd20dnjtzAxntKXg26TRhW9j4Op5P74
 XWrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuBDjZhJo+a3Ws57W55GvKt3JTcqo119IR4UbBP3xCXGtFLk9MEJingI4mhf0auGlIO3hWcw8yOsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsPprdj/eqeliEvVfGv60tUnRVHdju4IoqdjHoqumrhRhJGdg1
 DLCs+jlEMWzGktPKqXBMa0gOkmi2BGmca6MzKgp33/XFpBVgfnKv+5CsGJJrVcNi8tgKrYv2fOc
 vnyscU6W/BHdZwFLLyyhztDYzxgUiC60O9DwJ6U6QvlsBTmULnZOXt+fhSkdi+B1DDxKhfxhMNQ
 m5Xf8=
X-Gm-Gg: AZuq6aIgqJOGSZveAYK1HPsLwJYFvIGtdy0LI7cmcdFkXqwSjmfmcAdkR66lqWMG6B0
 k2mFq73W+6wnEJQPgn5DDWTqD5+T5oy2qtgnRv268ySsRGcheGVsei4+wjI3j8OL2V5zznz5/lf
 Oxim3bopMk1YTWHBqGPxEUFecJr+hyokIHCM/l/fTvwxLGBeOreKT3xaD6QpqPqqA4macET4sE5
 NpBGZaMeVGc0j5bkGVLhuyvJcO5C86VW5Vf1hSewRQ1dhOdJHZS+AzHVw+pY+YCZ7xmHwTFAo76
 068JgCH3KGMetZpQk1Fg73+QamoLCaYQUhur921QQuicSDxiMe0KcTg+gp2zL9v2OuBMIhWY3R6
 WQTUqflNc2rUksdPZpEyrF5+byKXYkXiZIA==
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-352d59a0c07mr3968689a91.19.1769011364541; 
 Wed, 21 Jan 2026 08:02:44 -0800 (PST)
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-352d59a0c07mr3968652a91.19.1769011363854; 
 Wed, 21 Jan 2026 08:02:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-353032f5e46sm1123495a91.7.2026.01.21.08.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:02:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 21:31:57 +0530
Subject: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHT4cGkC/3XQzY6DIBQF4FcxrIeWH63aVd9jMguES0tmEAtq2
 jS+e281mXRBF5AcyP044UESRAeJHIsHiTC75EKPofoqiL6o/gzUGcxEMFGxVrT0V6le0fMw0TQ
 NQ4gj5dwIrhuruNEE54YI1t1W8/tnyxGuE9Ljdkg6lYDq4L0bj0UEH/Bib6KnPvk9LtrDbSSv2
 YtLY4j3td7M1+GtiWSZJjOnjNaykqxjNWNgTiGl3XVSf6/Hdrit6Cz+Ic55FhIIdWB5o7SpoC0
 /QPIdKnOQRKgVkjFdA/6R/QCV71CTg0qEmgNA10ArbXfIQMuyPAHCiVk30AEAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769011355; l=1710;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PaTkkbTLymilZT5IHeccGXhs5FbYXmRp0kXnIdLl+/0=;
 b=rXu9YJKS9ujSb5yaEUR2l2aYorjvlsWV7pynHqrZWZahhpAS72Vx7fVtv4Qe6+d7fBolYwErJ
 VKSvfw4oiHkCxTeAcGIyxWG23AW5Gb6Kk9n8pIY61s6/gq+UvyO+cuO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: eujkAxNYa-A7mFR9Jd5YKtCayt82V27p
X-Proofpoint-ORIG-GUID: eujkAxNYa-A7mFR9Jd5YKtCayt82V27p
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970f8a6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dVXzBuOjJOJ3YG4SI_cA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzNSBTYWx0ZWRfX+MAFsIhieHJu
 RAEHnmUKHO4u0DTl5Pay3Md+TEQlxqO1dnB8FFmhl61NvjXkZikIlkYxEZXaMtcV1xw3+ZyD+WZ
 tTVkvCcshzgrETWhH2IJOs/OSEY7qqqhguJWxdE6gMlxUYaQHNZJ6uTr3fDzhkUH19RrpeJ9vL6
 MOSueAF+eWJIc0K8IrvnjcyFr+yU/rB5A3RCA9sBtpI/wwh+DHblZiO9H1TNT6Xw0V66h+s0YB8
 7Sx0al6eWF7rc+w73PjErrT7n05j41qc7SxEh1WQeVRuYgH9HsLCO54+iNL0dxMqMUXjISl9h/F
 6gKFwtWgcvBKG3zFK6XAec+P1zBmQ/rfwJH0ryq8ZhsFw1YWt3tk84qDc06XBFygNj4l6gf4dFL
 u91kkserfvdGkw7q0swqOarFGsyjCBObgGVDVqZfzyXNd2bDnzeOMSPAS+7DOpwvxi4/WaKNXZ/
 mq2GfvWrZ42ntblZOfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210135
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sean@poorly.run,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:jordan@cosmicpenguin.net,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:cwabbott0@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 25357599EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
<< Trimmed the cover letter since b4 folds it into the single patch >>

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

The single pending patch in this series in now ready to pick up into
the msm-next.
---
Changes in v5:
- Dropped merged patches
- Rebased on top of msm-next tip
- Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

