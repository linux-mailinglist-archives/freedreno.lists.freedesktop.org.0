Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LI6OLBqrmkgEAIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 07:37:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59475234461
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 07:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F110E0F3;
	Mon,  9 Mar 2026 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkSgjlrX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YILFw5Mc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7FE10E0F3
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 06:37:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628K01B11733749
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/
 A9Y0mA1g=; b=AkSgjlrXNbn+wUffsmmd6f+go94gDEr2bj43OEHe82/5M/iAncp
 8CGuUIrd9M1BXzqpV74ji7lobUKarCC5lnERETIdLmjj1wlGTrMp5yc42JHHMowv
 eNVV5Ts32JjrZeksTNYMAI+ovgc/+bUvhh9NfyLDjx6k2zFFpkG+qhW8NHiLQLjf
 d39rSjprax1PqUj/rRQLDSyoJrc0ZGdDZxDPoq25ceG1OthZTrpfpZYEQGgsggw1
 EQjwLP49NgZchsFWkSTe8/EeeN10LhMSsK/bpWdJoT2ZLu67axqKhI2sKopURnK0
 Nx+ziYI7HSTF10HF4LdahgpDVrzDbXlzN3w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9c0vf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 06:37:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bdf6fe90a9so10506164eec.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Mar 2026 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773038252; x=1773643052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
 b=YILFw5McuibBKRvL2rIaZ2fps0UaaJblnJ8TBT6ZvH9Az/jM7j6n5aiVzA/gRQCd6V
 cITjENDPyLe1OsNVS92PB2B12W9426+aZxDcF4PaFES7+3d9O/DkWaEWmlGTYQIaLFGl
 yNRT7hSW7vJm/0X4IRKX2hNFT32nP2TBAlB9RVwwYcwF8rfGjQ7ReFysbjCWnwB1wqXK
 NNL875Accon+GhLoSo2dSmg800h/NpHfG8DNOeFYhK7P/ykY0YcOmBeSn42YCew2FWC3
 rLCXh6/U4QB84LwdzufBQvia9az61TaKv85K9O1GbeJRDed2apzMiekL6pmUPn4E8k55
 N8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773038252; x=1773643052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
 b=VBmeGhW1onUgic0Z10+HnhLRdsZpCmvVBwz2J+aWb9M3DiKl/ajqdvata3pPtbSzJT
 zq/iP4xvE3/Jfc3wyADBGh3liNc99u1K4ST6iRk6I8+/Ar/Xhut0At/F31lY6dOiqX5J
 8AR5R8C5LmPgySXgchsvVCMVUIGYMkjZIdqWHG1OtQwvmOb1aGAZGMbUCcQGWWKc9zSz
 iL5dSf1qz4XcF5Sl7iuLWw+i8LvYfIfqxuNM08TsmpoBLlhyyO7PExGdOSwfhU9WbQIG
 p3m852WCYH6qw1w28jsaj1jBTFoGO2+At70iKLuOlC6iL2Nbm+96dI++UXQTKpVJgypm
 fiWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKhm5aBlt9CwSBnr6r3oy/3RhYBaXG8rIdF6HhWo12wr5FNZjJn6w4xiq0r/aQSSWojH3Y8MgdcoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv6+iJgVepNocCtTM8xc5e4QHSYy7YgcK5TicelwgiXAzMxBpv
 edh5x0s99IaPqMS+GfVqSvHovqK/QEaNeI5K3KPHryF2XOjStbGSZ+p3lL72CCTsxB/EfEVbPFY
 mvyHmmIKwr0kszpfPTQmB9s/YoPM0+qkPUtxGYFrE4NIzIIFID9uGcoAcYJOQJD22ztkqSIQ=
X-Gm-Gg: ATEYQzw4DKT8fPKTrsoL4DPc+UxpwdpyF7Ce4G5g++GFMM3oSDW74SMQ8/WKTz1A8Pu
 arpF2+u0aPSNObQWwAEOBIPp7DcCU5Tv9qLmVo393Bp3nn/ey534gEJ2Z/0Y789xZ0jdB2tKLa7
 +eELMTazwWc9q3Hf+8RHrc5q6KRbEEzeZDX/NpBvOTvWZ9z/wjGzOv5Z6O7NX87pyXsikKV+9yP
 u8fTK4Ak2SjC11WiHCsynJb4L7dkpMakU6BjXR1KVS2UBxJ2sTDyJ9LsnFUMpV0rjjOWplJKbcF
 i5JG2ehg5/KDlxOrSQULqE6RBudCT35Q0+BbtzYgvBvZEcv8D2KjKchQvjJTWMeb9/TUsluPzU8
 ZwxwESjFwC+VfekvQPy+X8FMzMYq2daT/f48emt528O6Aj5xRzImZsWGBytTUAES/b0Xj2ShI
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id
 a92af1059eb24-128d55ba213mr1040234c88.31.1773038252131; 
 Sun, 08 Mar 2026 23:37:32 -0700 (PDT)
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id
 a92af1059eb24-128d55ba213mr1040213c88.31.1773038251559; 
 Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128c3f5a102sm8488626c88.13.2026.03.08.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org,
 krzk@kernel.org, abelvesa@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2] drm/msm/dpu: fix mismatch between power and frequency
Date: Mon,  9 Mar 2026 14:37:20 +0800
Message-Id: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MCBTYWx0ZWRfX1KymtnQ5oBZV
 61EChbzDOPYm0IjrjeDLYUBBguIcFM3Cy3Rh/l5kfVcbLFDFNBe1qfMt8y5knJX/gHQVNdGAugm
 nTl8GOBw4720k45h5uJO/BM/rZpWy2HDoS21iISKEnaOjj9dkaTDJ4k5GFS50KWhMPljFGtdbKZ
 uVpHNDlV0bbiy67wqQQj8rI3VCnqK24o4KjAscThjlL6d1Z65h3zBTqalpUX0SV+ntZOnBb4myW
 LnmPlLuj27uVMmY9gKqaHt/LG7YQINH0NcTvuZTDvmVVMY7Y1uKVXNRQs6OCp4WyYgNd4LivvrU
 D1rBKo+RPOUfdLhSYJw4xSM5xthV9YmqlGRezRJEeZrx/k8F0bFEyo6qWnAaqfdoXXq9BTBWdZT
 paX8FA9LkCq6OtIeIBCJbzU8LSg3E8QBUyKm5y3f3CBCA0JZyIfisciMqScVulR3u7hrmfeTZdT
 NTNbonHgHdpoG6UzBfg==
X-Proofpoint-ORIG-GUID: W0ZZscA2Bl7SuptM03POy9eTHorYfGFq
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ae6aad cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kp0xKC1fNrCP_-QnSFkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: W0ZZscA2Bl7SuptM03POy9eTHorYfGFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090060
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
X-Rspamd-Queue-Id: 59475234461
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:abelvesa@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

For example, in the DPU bind path, the sequence could be:
  cpu0: dev_sync_state -> rpmhpd_sync_state
  cpu1:                                     dpu_kms_hw_init
timeline 0 ------------------------------------------------> t

After rpmhpd_sync_state, the voltage performance is no longer guaranteed
to stay at the highest level. During dpu_kms_hw_init, calling
dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
fall to MIN_SVS while the core clock is still at its maximum frequency.
When the power is re-enabled, only the clock is enabled, leading to a
situation where the MMCX rail is at MIN_SVS but the core clock is at its
highest rate. In this state, the rail cannot sustain the clock rate,
which may cause instability or system crash.

Remove the call to dev_pm_opp_set_rate(dev, 0) from dpu_runtime_suspend
to ensure the correct vote is restored when DPU resumes.

Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 449552513997..327881056dd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1463,8 +1463,6 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
-- 
2.43.0

