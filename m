Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267CB3FE69
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 13:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D58E10E683;
	Tue,  2 Sep 2025 11:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6zyRUPj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67810E684
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582ATMh2022405
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=; b=N6zyRUPjVnq1G9ja
 KcPaq2mtNJM+ZmdKazy0ExicjtvOg/3YKgRUp46jxoqtI6aOeRrVRL1cxGkjpP9h
 4FoM4QAM2a82XD8u58ZP6jqXU7pyiq7yG3jiEHMFKEUAgNFh7tYpQkEKByFbivKy
 XWK1UehNwAqR0tUhFSrI1sqIWyPJ2l+Kh7+vAe/GJzjy4KPBf7OhUpstas/jJeFy
 ICozRQEoMsmK3zYrr0fwDPqIYECSN2xF/aTrColJQwSYhX2bSGhmLmAf9rexBpLJ
 nir6kkQeM9dqAy8XvUBHhm7VGXkSceqClia25KR41dNUeDFfGAB5R9Ye9mtMKuxF
 iqUoMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7t87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-329ee69e7f1so328600a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813846; x=1757418646;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=;
 b=aj001WE30/ehY7ET/Sgdu1VnbfetKyM/GvrdB+/bHCHNwenoO1iW7B2TA8KKEnDM4o
 2vVwIyrTO6ut9UiI2A93zTVb1k/Dk0P9jygZNOFhBF8H6b7CSGgxyVDiTQmd+gJ+CCH1
 JbjTz/HO+xvDYQw4rAP/BNbGCh9XYmFZXv1fdx3CtnOuVcoljYDIAlzuLzC1+v2RXxN9
 y9Pi4T18TOOD2RuHPvIauy0xF5kj2g5M+ZjmAmLX8DqpCCPtDRV6ZLO3pQkmM+5zvq9L
 ilo7NAokM9W++FsA3HKeGGNlsvUmibJP059vxSJ8Ma5pqjB61uN2aTS32wF4gy43Kr3y
 UOmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQpVODXIVkyKiLh02F1T6sGyDYcPYotXShzfjXh54Do0dKBmdRqrp/8R50UPphEiZf4fWfF7COYGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtzMFyXaCPk8Ygn2rZPIjBLxIy2I0uTYakO0W+iUMXIVq6Ir+w
 9IBHfbxK2RM2wqZTLX4ieAryBor9cy/AyQ466OXXptei+b1RiPkjooWH1qtTYSYNeYz5XnzE+2f
 dHQdEajnxEQ9fBSB2DT857KKUL4+pC8ix2u1fHV8Ctiad/fu0DoPqO8pXXmeESFVMFkRJ8HI=
X-Gm-Gg: ASbGncvFaHu6T+ppZ0yv1vnM/oLGtUzhjiFL2NIGIWUowy5lzSFzmxynk7co5WMFpEU
 qNJh070jVEI7gkGo8roAf3SAJRgafLGk7/wmdPNaRyNTHRteVtDqGCUnBRPvsyVy7lvuqOt3UXF
 VAovo0EhnitYLH2JyOZOSwlKnxkiSGxXdExG/KLFyHPiDEqHqI2EWHs18J75YKe/bPq4wRjP6BG
 KJJTtAF8qenzLu1PFvqwC2IcgKYjI3kTAWA5HSLxUkxEitmJIj6lHrwqMj+FTCFgxJG9L6g9z9r
 +Ss2J+101ni3TWbv6zTc+RndKLGSVt8ORbd7kJb/W2gflpLS9TNEQ7Hf+IuunqHF
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id
 98e67ed59e1d1-32815412d5fmr10872185a91.1.1756813846406; 
 Tue, 02 Sep 2025 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW99TwUZWxEy45yoetqpbaSq5lJC3JPeKamGQotr5IZQ5SoSdER5YO+EmZCPCjeK1GGCyBuA==
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id
 98e67ed59e1d1-32815412d5fmr10872157a91.1.1756813845739; 
 Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:00 +0530
Subject: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm modparam
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=4562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qPgkL7fQFaE6QyN7pM6ijtnceZa332Ylsl3h67JWyzs=;
 b=KpwHPv5jbU1wG0upN69QN4TU9tLv75znfaMNG/wW/Vr6JMKnE72nr9y8RUcFJA0uol8NLt7B+
 0SEFpVmHcU3An78DGT319SckSxtIIrGYV3cpjSsb3jEmR64RaxyjTRg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 0kfoSZgXevT4TSDHwH5OdVm-BdhF_K7F
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6da17 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7L6S3vPEwiY8THHMc4kA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 0kfoSZgXevT4TSDHwH5OdVm-BdhF_K7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+X2GDB9wkQAJ
 2nSu+srnTEggeplOvNv4b0/Bl6PYOcz9ZEwvkO8L5YFP1LXjlb2umXEtY6WCUgWpuYyJ8LtkkTX
 E1muKSOi+sW/1RYY2Q4/aX3riK7ecdmw2tv3N5YVbap2TfEX9v5skY2eSDM6L4/LRJwOXAfOWVz
 rZ/IJPiPhLUMi95UksLUTvV6fA8NDgjPcbsQx9HmT74XrXGRUCzGpTPZfud20l6ajHLfhUVZTg4
 mo4D36HeCNa2Xab0JQT4v8vUstHoq6++Bz/9tqNRc0hO5Ri4Q2yD3vq0RZW38KdUQkHZjCaj5a0
 bSsUrb9M5TwqmVrRD98dyx429OS4fNdX4tfQmUhae9sj57M0tWlEGCcWMbyxWYpb8fTw+mVWRVk
 TZwBc1Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
drm_gem_obj.gpuva.list, which is not initialized when the drm driver
does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
is set:

[    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
[    9.523160] Mem abort info:
[    9.523161]   ESR = 0x0000000096000006
[    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.523165]   SET = 0, FnV = 0
[    9.523166]   EA = 0, S1PTW = 0
[    9.523167]   FSC = 0x06: level 2 translation fault
[    9.523169] Data abort info:
[    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
[    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
[    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
[    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
[    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
[    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
[    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
[    9.763632] sp : ffff800082dab460
[    9.763666] Call trace:
[    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
[    9.763688]  get_vma_locked+0x2c/0x128 [msm]
[    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
[    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
[    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
[    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
[    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
[    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
[    9.763782]  drm_client_register+0x58/0x9c [drm]
[    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
[    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
[    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
[    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
[    9.763848]  msm_drm_bind+0x30/0x3c [msm]
[    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
[    9.919283]  __component_add+0xa4/0x170
[    9.919286]  component_add+0x14/0x20
[    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
[    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
[    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
[    9.919341]  really_probe+0xbc/0x298
[    9.919345]  __driver_probe_device+0x78/0x12c
[    9.919348]  driver_probe_device+0x40/0x160
[    9.919350]  __driver_attach+0x94/0x19c
[    9.919353]  bus_for_each_dev+0x74/0xd4
[    9.919355]  driver_attach+0x24/0x30
[    9.919358]  bus_add_driver+0xe4/0x208
[    9.919360]  driver_register+0x60/0x128
[    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
[    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
[    9.919370]  do_one_initcall+0x6c/0x1b0
[    9.919374]  do_init_module+0x58/0x234
[    9.919377]  load_module+0x19cc/0x1bd4
[    9.919380]  init_module_from_file+0x84/0xc4
[    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
[    9.919384]  invoke_syscall+0x48/0x110
[    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
[    9.919393]  do_el0_svc+0x20/0x2c
[    9.919396]  el0_svc+0x34/0xf0
[    9.919401]  el0t_64_sync_handler+0xa0/0xe4
[    9.919403]  el0t_64_sync+0x198/0x19c
[    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
[    9.919410] ---[ end trace 0000000000000000 ]---

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf59097a01c2b2556608 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -826,6 +826,7 @@ static const struct file_operations fops = {
 
 #define DRIVER_FEATURES_KMS ( \
 		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
 		DRIVER_ATOMIC | \
 		DRIVER_MODESET | \
 		0 )

-- 
2.50.1

