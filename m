Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDOpNMv/lmmItQIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 19 Feb 2026 13:19:23 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165EE15E8BF
	for <lists+freedreno@lfdr.de>; Thu, 19 Feb 2026 13:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5128510E320;
	Thu, 19 Feb 2026 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkAHdzB5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQfFnHVg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D201010E328
 for <freedreno@lists.freedesktop.org>; Thu, 19 Feb 2026 12:19:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61J1V6iu2782076
 for <freedreno@lists.freedesktop.org>; Thu, 19 Feb 2026 12:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=R4zw131gS24jr8C8DvGulB
 /BORrY6Rq1789Y5GUHu1U=; b=CkAHdzB5E5+56x3QNm2+QmPUlFsY2CNHsydoY6
 6iqRztaQK88ebTvuIbQSeB5toNV5xWhRezCbfgzxSMXVMX0EStMHRL6eYJ3b9tfc
 d/54uOHjn/EFn14N77nKwOo5SBCvRj8BxI2jmmBX0D0ZoXxW/5UKpuWS88glVRtK
 tLB5hbkFCGM+c5zoHJ9mreDDolB+9kZSvaFCeWT43YRYrkNJ9kzBbLfv1z+5W0oC
 Q/2AaQqO5+njHj1+yomQJi9PP32IYQoLPvufC3rUny+1d6uORWz/8W1We51A19P+
 HvjaYCU6qbENUvr9BSEk4gmmncovp6UWptPqr9Aj7vJsZOlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd3ahcwew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 19 Feb 2026 12:19:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb6291d95aso1018382585a.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Feb 2026 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771503558; x=1772108358;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R4zw131gS24jr8C8DvGulB/BORrY6Rq1789Y5GUHu1U=;
 b=cQfFnHVgDBycskCx3JHpMwGaPg1mZ8QhkwOkx50y+jz9ulrhN9PQMAMzJOjAjnAXMG
 lg5pRsT3MooqZYvk8saHyU6XQNS6i++RtoIIFh2YQpIlVUbfc2kDisV+457JOKeMVN2z
 4JOFGbA1CPxmw4DdsMHT/qdMoj7kw7Myf/Imrjgn9ON2YNxh0JgXVD/vLmoAUe/s+ja6
 TCu44yBqcNaSHjMcWy2RqNUqv3jLvZGHr0ajdoyinxLE2IM9Qu2scSspNaHmG2ere7Qi
 JLMDIxFYMdbT/eb3H3NR1SelomzaK/HxwpPn3tSe69WfqDYpTTaD1G51gJhz4WtLjih9
 MqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771503558; x=1772108358;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R4zw131gS24jr8C8DvGulB/BORrY6Rq1789Y5GUHu1U=;
 b=AFOKrqBhw8K8bAXbTcZXmiMaL8nPjprL9ed+vJbBEW1feM287XknCim9UWFVtM1Vqh
 FkXhLqUtTEYi3K6qAOw1tC/usawGDIyBhXYhhs+sxL2xAi+vgpot7k2V3juy6yP2CuTT
 Nf9Ikyh4UXICiiQ18+Poai8ZIfJML3b8a3jnLVol+VZnP8h4lEioz4zg5IOE9QcwP0SL
 GShIWs/4ILYfgRweXUyUrNp1HQgmLHELJtJXLDdGhz+NiXyBh9jU6ongKmDfGjPgQ4g0
 Qlvj1SrKd8ntmj4MWhNZy1C36ORHcRHB630hbrTGV7ZMNE2pDlUC+T12EtLOAVkWLDNc
 NrUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEpkmxKtbxVQQuFpwOsNbT13wZeC2EQYlJIpW5K/lWeKj/HTKEDCKeKdWQanPlytDZFjvZNG/SMa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRWzUQKcMwBKWYipJP5ojdJdcXQmlFbovrh2joCXyerRJEFQdE
 01Bx1yytf23lQ0Q67xNAhFtNlVo8aJpzbBnCCPlHlEYud9n0mdwPvkTlp4d9ReUFE6DrWgHWsj6
 yTeaP3PIQJFFoVD9SkjVW1o9RsM8Ql4tnc6QReBsZwVFyTgc2Dwh+1cfc7nAUT28iZaVnFY4=
X-Gm-Gg: AZuq6aJlJ2rkloOmUj2Bmn2iJLc8H/XEm6ziWkC/WoFkTjWm8oBYDU+Ak38Cbzl35v0
 QNQB4wNeXjpa+xn1s5XxK6OnO/QDJLS2r+bXBCyJWlHS4J1TyOVn6eDgFo1pOrr9MVMR2nfIBrl
 39UleICYv2AuYqdoQrAW06dYsJsamzRp2ctDtYUDGV0DCa8eaNj7MiM0VGkzCKa9DyVEbiuY4Q+
 XOMHyO86nqub+9wvyzpJ7VWnfIgjp0Vbjsm8Rkr++RhMgmTXaGDVaRupkFiM3q/jjhXqbob8WJY
 y2N7P5PKd/WMm0+Mh3+zBpcMVeka5PvOqDPIxn9Bi82Vpa8nzgRRC6ulTz1hhF6tqDK2SrMfHrw
 /N1qOE/044A5O9FllN72JQsS/9Sw+qhiqjH3FEqKna1O1IybrxnnrJdBy5VWl9f2b49NSfI6H/j
 8cJcqfZ91B92ksaaSPkAfd3xL62DVNUMHl+iA=
X-Received: by 2002:a05:620a:444a:b0:8c9:fa4b:1269 with SMTP id
 af79cd13be357-8cb4bfbd4f8mr2213339185a.27.1771503558109; 
 Thu, 19 Feb 2026 04:19:18 -0800 (PST)
X-Received: by 2002:a05:620a:444a:b0:8c9:fa4b:1269 with SMTP id
 af79cd13be357-8cb4bfbd4f8mr2213334685a.27.1771503557550; 
 Thu, 19 Feb 2026 04:19:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b90adsm5295878e87.88.2026.02.19.04.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 04:19:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:19:14 +0200
Subject: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMH/lmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3dziXN0UoMJkkIyuhUmSpWmKkVGyQZKBElBPQVFqWmYF2Lzo2Np
 aACgVU0BfAAAA
X-Change-ID: 20260219-msm-device-id-84b95d22c0b0
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?q?Lo=C3=AFc_Minier?= <loic.minier@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cILG7kZAEzTdG/ciX0BNMM1ChCVTuuFpWpfEtklMVwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplv/EyRT/xnDFwLoq+Lbzcy81urSNlNBLQdUGO
 aUiqAcARGOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZb/xAAKCRCLPIo+Aiko
 1X+3B/9bFH4Ytfj1ucqMWGmsDaiqGxetCAHmWIbZwh1+bD19kC09LkMWNoThlywWfHgUp41/xlr
 WBNrmnR/cDPP5/kVf8U37vsW6AHAvIukDanH8hmrQGEGCNalpEHRiN/bQUUFoQmVoG+G8+vsrf7
 LHa25Y4Gq3yqgZE1N4o1Gw9mTjYXj6Egw24cU/bdsebl3Mp2r1w/o4ttNAjpGfBDfRt9breooAp
 eioexEFOozeDg0qaQrK5AkTZjvf7RtAm4+7fG8RICfxnL5N7z6JthnExJ01Dh84W+/jmv5YdE5H
 0/VND3t3FoQzg/0cPO/p4RfXkPXAJ3Mr7MR0BNcOqVkuLjav
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Zo3g6t7G c=1 sm=1 tr=0 ts=6996ffc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=XUzyY04WHD4O6pcxTvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExMiBTYWx0ZWRfX0/FAlnu/xehu
 cQ376DUC1Ww/X7S0KITvDBMPz+PuurqpIRmTbE4UcKEhrHlW46RH+CZ+b+mkOVBYs9ml6LVAXnM
 hClQGRqeHjt8ViOVb0ptRw+86s+SE5kKqQmEH50uTUNXCvpmZBLta/UQGrc6KGrCJq9t/wcLyrv
 Y03eA6t8mAGX3B9JekLFefyOONfgr7Sy25og5HiS1En35+8/ycJUOfq7z+jMNH4RuWNSFu/9w1v
 XaP0raFTIznyHLnwCtt8Nqc1x83IMv+OAa1lb1PMPJ706ovFONnBMPSucnUrmo/sGXufZYtCIgB
 avf7Y+KFdDwQTzzKBetBAPBJABtd6ybIWIx6HCvQqF/Cw+vse9hB4bVusjG75CJvClKMYZ2c51a
 hUgRG3jOp2/FHdRIRSmCg8cPb4vXXdvZlk1y6O3iSZL5EbVyRvhpiC6gvAoN9YPwFu8phPpLRI6
 t13lqmJCjMPrwA5VjiQ==
X-Proofpoint-ORIG-GUID: jYiMeP1cszEgjF3rrRoo7nT877c-E7j6
X-Proofpoint-GUID: jYiMeP1cszEgjF3rrRoo7nT877c-E7j6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190112
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:loic.minier@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 165EE15E8BF
X-Rspamd-Action: no action

The drm/msm module bundles several drivers, each of them having a
separate OF match table, however only MDSS (subsystem) and KMS devices
had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
enabled only the GPU device (without enabling display counterparts), the
module will not be picked up and loaded by userspace.

Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
module.

Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The Fixes tag points to the first commit introducing OF-based GPU
matching (and thus possibility for the headless GPU binding). Other
are not usable without the main MDP4 / MDP5 / DPU drivers, so they
didn't get the Fixes tags of their own.
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
 drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 554d746f115b..4edfe80c5be7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,kgsl-3d0" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static int adreno_runtime_resume(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..d2124d625485 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
 
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d8bb40ef820e..3c9f01ed6271 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static const struct dev_pm_ops dsi_pm_ops = {
 	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7937266de1d2..c59375aaae19 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #endif
 	{}
 };
+MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
 
 /*
  * Currently, we only support one SoC for each PHY type. When we have multiple
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..d5ef5089c9e9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 667573f1db7c..f726555bb681 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8998_cfg },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260219-msm-device-id-84b95d22c0b0

Best regards,
-- 
With best wishes
Dmitry

