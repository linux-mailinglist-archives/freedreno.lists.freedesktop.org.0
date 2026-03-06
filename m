Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAHUADEFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:45 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5669225620
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0F810EDF4;
	Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4WtKU46";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Clha/6uh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820C010EDF5
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr4Jq079916
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=; b=X4WtKU46ctLZhQ3K
 myQD/6t1G7Uew7UkRZ7ZwluxW7JZFqWQDZc302cpeE1vEpCamD9Osc/s6lXHxvxI
 r9jusATZRfXGkC5mUK3skAHr7RlyzP4YerRWh5sHpAXRTnE6UP2vBC1Unr+2fvm5
 UDvzvGRub0By5hX5u5o6ZbCixFvLycq5cNVpLRCYlosWgy9Hda8xzN38hC54Xmy6
 hdxKwkBnBeKgp/jFOuiePVSLaMZqymgrUPLboiw327tP58mwqjCzzijQlSH7eJ9T
 fwy6R04xRVV5S/LoD3V+qiczdjOze6UI18+dtOdgbB6T7aQ11UVKbN+Lp80fEgXL
 HPXJcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k7p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3fae6f60so6040650685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815659; x=1773420459;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
 b=Clha/6uhUqdev1ARguJuWI22/MRIiQBBHYrBGKJuBV2JtAzQE/qS8ZH2q20KL5MVNk
 fGOlSvTzouTBOETDsnA+hDKF6WnXObf961uyyxVER6aF15tK75HjY14Tjj9rb0Bn69Xz
 QmvYYzmzY0LCNf0f6igrfeX0FK96RTlJ4sPb/xnSU2gTt1q/rbMXPiF0z/jA9utM8ALw
 0zr0rGzpVxghSobPffSd5nMo0TqEWsfTVtE6NaZb/ikvs3hNhCGk1dcJQEMau3fsnvcs
 yyezXmxflOT0z0xHTaXWHHCey4bfoTLYq6KevX5Rk0TofeT8bOzzd/wLNkZu2S9zfiE/
 K8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815659; x=1773420459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
 b=VYYmLq9k45vLwbXexShvK/z9lHPZVNM4WHyAtX2MNaxtDDumBU6WO41qIvvGlt0JOY
 4R5vmM8wtpAqv5WvUGc0OEsvJyHpunSGNjBoVG/a0G/ib9caoW8Pgjjxxs+HAu95zCAS
 BtRC6MGlQDXeHS4HhTBZ+i6ltmWJzkMRCAjKiPZLdkcZMMLQ8F6Eoin9vcCmhMwD9Ar0
 y2gPJtbBs7Rl7DyKEM6E4/+g+ui3xHqwEXC188ZwXamP2I2zbHgor85vEiv0WIYB3EK+
 0gSzx5k+xVbUURuVQ6yW6FWnTkns8i4fug+O5JQmlEdbSXV54EoUVmgYn3Z/U7tFZRJT
 GQ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+G3EZmHDhW+nWfunzz5AB08X6ysNj4dVhefsWMMbSexHDvj/UOBn0SjT1TpM6uzQAZkF86IiTvj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzujpsj5T/L7XeQxeluSMGLdf9BY+F83GfNSYdM2BUeDbXZu+HB
 73YkTr67DmGux8Q4kB4MhSOdOnwDxE8WjaIfePix/XqSpSn0+guDGoGUFPxoSL8XdEHbDhkycDJ
 BjgHh99OL77a40k4AeMuRV+TSEzCbhec0QmytN54zgYqq/VGkJYzBg3530cSvyXCFsfK09ck=
X-Gm-Gg: ATEYQzzqyZbwvenZxrZg6qnV0GKH0XILTjNSul47jW8HX1alMKLVQ4gyFs83UiXYXAq
 aVQhgq8SCMzi2T1uxirPPOh+KRlm+eAWaS91Nh6yeb4fm/h3zLb4FXhsgDmFnyEXH3nEOv4mlxb
 +TWuWCRyaqTivef2KyeumHmLl3XmyR7CaIdbrt14cC9tfibY4bZ08PrRut6TEssld8XWn8umuk+
 eZpepAdhBpbqmhZm5YDc8lZHIUOh358y5g4wYCOINyArsclStwnyTV1K/+Km8yYDdhsTC4OwatB
 RswJQVAIoCSkgHKQOpGMG/AB+df6oCO7ozN8JFwc0pvjM8OtufloznsLbZXFeT1JL3Ejzo85LkL
 x1crEhEQfPVI97uzpy60+RaBqI9nYAlNfzD3IKkMcTXkai2Dytwr25i0e9rKLvY1pq3+flZewyt
 DLx4PIne4+AQg0zfLffpJXFQgJYkVgxCvzMok=
X-Received: by 2002:a05:620a:4056:b0:8c5:3045:854f with SMTP id
 af79cd13be357-8cd634f4e24mr744636185a.30.1772815659149; 
 Fri, 06 Mar 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:8c5:3045:854f with SMTP id
 af79cd13be357-8cd634f4e24mr744631685a.30.1772815658631; 
 Fri, 06 Mar 2026 08:47:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:21 +0200
Subject: [PATCH 15/24] drm/msm/adreno: adapt for UBWC 3.1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-15-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jQr7R3+YepKvgcTe6jp82KzUXB8bK1KOSbD7btdKNGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO2Mh9VtIMGbSLApYQvh1/12VtHGBuGs96J
 LKj2n9wd2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1fM0B/0aePn2nUdVqrcTb/zKAEPyRqZvsdd/RFmXHhDcTIM1DzeaDRpKCBdbgCBupqy7wxdYpeT
 Q28bxCxttL64fQMq5FfqaQU5YYfaYGQOd/pdtZvyIrlxv0Kh0rgt6UtETgp9+kmr8w7ySgjBkxD
 yY+NTnmmhTo11WoMqXRadin0/nNVIud9JU1aQuA6OBOwL0kLtCL0AwkwmHQWpZ+H+/Z4imEoIQw
 d26bCyB1xLGkmsiMQ4Im6KSMjQTgVUhxNZsYMOmYVFvuiztrFIOVqkU0BLkglfde+F83fPVpwLl
 WMDUtthT8s4nfWrZNR6I1HOYSKt8P2mEwooM77KkSR9RtkJ3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: m3KjjaJ6aaN9mR0Dqi0oxNpTnD3ptpxB
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab052b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=h0EdKdWjJzRczO_IdhYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX63PEySfm5v1i
 RR0ieEfKLBUaJTWSDwiA2egWGTepDukIh0gBhbfew5QtV4X6jefhv1YpYiWQoJP9p3OFUjqe2k3
 Nk71xTr5gfBuVWPQOwAh/e1fT5ZSwqEbbBQZ0W+yfiRZdlIKebJOevTEIvjYMASlgADURPH3M4M
 Uue/H/SmLWkJ3lEgPp9exyls6OT4aPkTfkXUeiX0oQB4AEKPC7qGEAtuaR8BACNBunItmxzsOxs
 VyoMuvube3x1s3ZL7Sm3tsfdSKvQsJlbSQK+ry9H+kND3oDc+s1kaV+QHX8+W0+3A/12WcO+BSj
 UHn6ewdGoY1INk3+OWGu0yrofDFX/p0vGteAOiN0SAeAn/FS2JdGqNR/SCtq0R7Up9Nqy5b84Ic
 9FL6Y8RYJ61XmTHtvXlbCbV0Cr8A0yKvnwqGLvsZIPsl+V+NnUAM8E43gaYuswRO7MaVcaqtAqZ
 DXwDyF30EzdsMUo0qtQ==
X-Proofpoint-GUID: m3KjjaJ6aaN9mR0Dqi0oxNpTnD3ptpxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: A5669225620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 680f0b1803a1..45f260db729f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -289,6 +289,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
+	case UBWC_3_1:
 	case UBWC_3_0:
 		amsbc = true;
 		break;

-- 
2.47.3

