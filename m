Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC6B0FAC1
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15FA10E854;
	Wed, 23 Jul 2025 19:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfvOE8gd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3410E84A
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:09:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHQKdH024756
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NXrXegjKH9F
 ZEEv4Dl+TWuWDw89FsK2vfam13ri509Y=; b=hfvOE8gdG1duZvZ8UKYvlySI7lE
 Ndfuho0CV3rtLDIq0cAvbvEpw6e4dwj/JR1ac64ntB8/2vaQv/7+/g3ZoyXLALcy
 qGfNJFjIYWf7Zt+sKVJJkN49yNrOOhYTUxFTJA0e3bqSt4v3ia642TE071PlWm1q
 S6qH+hgF3DzafLUHcVNyTgRIjHQHRwpdTzm+wb6z7UeXoksbwR/wzNk+hBcRH5sA
 BJLnuq4mB8Ud9JC9r+vX6TWYB+e/DCuk/BfNuYnz/6DguI+Iw+smXhoBmpS5tvHI
 CrTmYc1NJsTkoqIl2ldMjdf4QxijXuhX/oMKqefiprZZZvT4Ee9XTPnZSew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dp3jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-740774348f6so215216b3a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297738; x=1753902538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXrXegjKH9FZEEv4Dl+TWuWDw89FsK2vfam13ri509Y=;
 b=FJd1qeeWWXRGOVVWo4zjFjpBWbUwYn5hF1nauKAz9waHR9ZYgMmOBH2klUbfgTrb+6
 ZVoSJMj4ZvKPzEFYnhMWxHYGVHOBGsIJ7NnhCdGv1e1iSHV9XEnP3VBwbXtfaaEDsV66
 zSLFQSdTbEXrIcoqfOcl+JL3Nas7a21RnwmxfvwKmVgopuPEnZkElqlEtUhocfaEakKJ
 DX20BTcS2iY/Cif92ohqsVTAEHgLNGe5RN695Xf+xHy82dKTTuzWGj8y2VwDi2fnkQNX
 nbGp8cFhlP6nsZ6hoT/1XeFkRW3iiatPRYMzWDlAKGuZtahwz3ZrVW8Ld7xrpE8QpT5D
 wnuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMhm46UH6HLIkaZgJqIYS5u1iK02LLoGrHrsQyTEoIyNdkvnINbp9+YLAULV7LHAdJks6I/V17I24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ3moGTsBB/PjP3lsoEqfE1UnqPlN9CZYimCwePyrargDJcoIv
 +er0e5b1Ef/qYmq++kc41xLEwdvzELvUuQPLoA7hKW1DViwvc+FcW5lC3j2TRDWQPmEImsCH7em
 uOkHtalkeMXgn+uH6B6HEC9ib/duRawpxgFLkMHQm+zM0jywyXmJ+4DfBqWMs++GnsM+tllU=
X-Gm-Gg: ASbGncstuI6TYEahIDEFiFSyaAA0bKmbKngX4BpoeKHevq4roOrtpS2khi8gddU7LDH
 Re7jLcxMHEI55rbzypE5YL6TFM5yIc+kPIHzzW/IIr7IYzAR6OUrjPGzPkesHM6MhmGbMNCKCu+
 MH5ucJm4AqTUfi4VsVL2dFX0I3ySOLHNTdqMU1Norb9CwlpzYkWAs9/cD4YZMk5kMJucNLvvo5U
 Z8injkhExTFN8Q/6AUKenTHYLXat0Ug7qltNjv7vPtyjnl9sXNEzC/xA4Qqz+NgZhoiwdBdyJ+A
 SO5QlDQZX8vduB+L2Y0MAyImkRiKpcguJN1Rio4FehHlNG9iZhU=
X-Received: by 2002:a05:6a00:9281:b0:748:e150:ac5c with SMTP id
 d2e1a72fcca58-76035fe970cmr5837898b3a.23.1753297738378; 
 Wed, 23 Jul 2025 12:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6rfYQZeb/JoYfO4ZK95X/OcOSoYrnuOfh+vEGrN+A4OlMvLtndbVepak4mr0nineouEWh+w==
X-Received: by 2002:a05:6a00:9281:b0:748:e150:ac5c with SMTP id
 d2e1a72fcca58-76035fe970cmr5837866b3a.23.1753297737800; 
 Wed, 23 Jul 2025 12:08:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d5e73sm10158873b3a.59.2025.07.23.12.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:08:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix submit error path cleanup
Date: Wed, 23 Jul 2025 12:08:50 -0700
Message-ID: <20250723190852.18394-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6881334b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=l9nXAVJ8hsDFWAt1A-0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Gh-nvj1mRBnKjF6kL9idZFLwyNz_-_ig
X-Proofpoint-ORIG-GUID: Gh-nvj1mRBnKjF6kL9idZFLwyNz_-_ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX07pHGWUDyatO
 4ISHnvSoCjOKcQfZRqsy2GODGg7VwzrgfHPsM0OSRjDFNXYd5XIJ4BAbSdk1YLpWJ+CI6CFh7QU
 0nLRpIIwWZfZXq1+VnDArHTW6Wh/9AB4Z588vM4SoxODweLilNiujB9qH9VSAK4eBsWXN0ukui2
 2HV40QmZSYfMXvTnAyGkkLw5fZmlSsx5SZVT5hvqnNoOna7ncZ/RSQNXzO9+aMzpowjx0UmmDKJ
 Sr92g6SvRnKcG7ftDPTYDX7yd7II8I6Bed98e24voV/WLeqLYd8Fsctxh++TfPyPArRtH7pKwvB
 dTZLY5dIaSn5L76hHB6GnjSAhCrCEZWcXFEDXGpKRQil04ZabySZa7SnBE6gZ4ZnLo7Mtyjlv9i
 hbdLEB3GrlpL4PS9GS31L+B2OHmd6ngez38ELe+JNDP7+CUf0VfvWvf1RqVsVAIVPhW0byjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230162
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

submit_unpin_objects() should come before we unlock the objects.  This
fixes the splat:

   WARNING: CPU: 2 PID: 2171 at drivers/gpu/drm/msm/msm_gem.h:395 msm_gem_u=
npin_locked+0x8c/0xd8 [msm]
   Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_w=
sa884x regmap_sdw q6prm_clocks q6apm_lpass_dais q6apm_dai snd_q6dsp_common =
q6prm snd_q6apm qcom_pd_mapper cdc_mbim cdc_wdm cdc_ncm r8153_ecm cdc_ether=
 usbnet sunrpc nls_ascii nls_cp437 vfat fat snd_soc_x1e80100 snd_soc_lpass_=
rx_macro snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_wsa_ma=
cro snd_soc_qcom_common soundwire_qcom snd_soc_lpass_macro_common snd_soc_h=
dmi_codec snd_soc_qcom_sdw ext4 snd_soc_core snd_compress soundwire_bus snd=
_pcm_dmaengine snd_seq mbcache jbd2 snd_seq_device snd_pcm pm8941_pwrkey sn=
d_timer r8152 qcom_spmi_temp_alarm industrialio snd lenovo_yoga_slim7x ath1=
2k mii arm_smccc_trng soundcore rng_core evdev loop panel_samsung_atna33xc2=
0 msm ubwc_config drm_client_lib drm_gpuvm drm_exec gpu_sched drm_display_h=
elper pmic_glink_altmode aux_hpd_bridge ucsi_glink qcom_battmgr phy_qcom_qm=
p_combo ps883x cec aux_bridge drm_dp_aux_bus i2c_hid_of aes_ce_blk drm_kms_=
helper aes_ce_cipher i2c_hid qcom_q6v5_pas
    ghash_ce qcom_pil_info drm sha1_ce qcom_common phy_snps_eusb2 qcom_geni=
_serial qcom_q6v5 qcom_sysmon pinctrl_sm8550_lpass_lpi lpasscc_sc8280xp sbs=
a_gwdt mdt_loader gpio_keys pmic_glink i2c_dev efivarfs autofs4
   CPU: 2 UID: 1000 PID: 2171 Comm: gnome-shell Not tainted 6.16.0-rc4-debu=
g+ #25 PREEMPT(voluntary)
   Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
   pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
   pc : msm_gem_unpin_locked+0x8c/0xd8 [msm]
   lr : msm_gem_unpin_locked+0x88/0xd8 [msm]
   sp : ffff80009c963820
   x29: ffff80009c963820 x28: ffff80009c9639f8 x27: ffff00080552a830
   x26: 0000000000000000 x25: ffff0009d5655800 x24: 0000000000000000
   x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000000
   x20: ffff000831db5480 x19: ffff000816e74400 x18: 0000000000000000
   x17: 0000000000000000 x16: ffffc1396afdd720 x15: 0000000000000000
   x14: 0000000000000000 x13: 0000000000000000 x12: ffff0008c065bc00
   x11: ffff0008c065c000 x10: 0000000000000000 x9 : ffffc13945b19074
   x8 : 0000000000000000 x7 : 0000000000000209 x6 : 0000000000000002
   x5 : 0000000000019d01 x4 : ffff0008ba8db080 x3 : 000000000004093f
   x2 : ffff3ed5e727f000 x1 : 0000000000000000 x0 : 0000000000000000
   Call trace:
    msm_gem_unpin_locked+0x8c/0xd8 [msm] (P)
    msm_ioctl_gem_submit+0x32c/0x1760 [msm]
    drm_ioctl_kernel+0xc8/0x138 [drm]
    drm_ioctl+0x2c8/0x618 [drm]
    __arm64_sys_ioctl+0xac/0x108
    invoke_syscall.constprop.0+0x64/0xe8
    el0_svc_common.constprop.0+0x40/0xe8
    do_el0_svc+0x24/0x38
    el0_svc+0x54/0x1d8
    el0t_64_sync_handler+0x10c/0x138
    el0t_64_sync+0x19c/0x1a0
   irq event stamp: 2185036
   hardirqs last  enabled at (2185035): [<ffffc1396afeef9c>] _raw_spin_unlo=
ck_irqrestore+0x74/0x80
   hardirqs last disabled at (2185036): [<ffffc1396afd8164>] el1_dbg+0x24/0=
x90
   softirqs last  enabled at (2184778): [<ffffc13969675e44>] fpsimd_restore=
_current_state+0x3c/0x328
   softirqs last disabled at (2184776): [<ffffc13969675e14>] fpsimd_restore=
_current_state+0xc/0x328
   ---[ end trace 0000000000000000 ]---

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm=
_gem_submit.c
index 5f8e939a5906..0ac4c199ec93 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -514,14 +514,15 @@ static int submit_reloc(struct msm_gem_submit *submit=
, struct drm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
+	if (error)
+		submit_unpin_objects(submit);
+
 	if (submit->exec.objects)
 		drm_exec_fini(&submit->exec);
=20
-	if (error) {
-		submit_unpin_objects(submit);
-		/* job wasn't enqueued to scheduler, so early retirement: */
+	/* if job wasn't enqueued to scheduler, early retirement: */
+	if (error)
 		msm_submit_retire(submit);
-	}
 }
=20
 void msm_submit_retire(struct msm_gem_submit *submit)
--=20
2.50.1

