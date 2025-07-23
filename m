Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08205B0FABD
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44410E845;
	Wed, 23 Jul 2025 19:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjzrmpCL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC610E845
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHLFbR007832
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DySszsnLFN4
 6txmewo3gUR0DN+Qtxzt6DPVvLE0QlUA=; b=VjzrmpCLJaIuckolJY0HFwNaggP
 Wkcum93o4SrXx4L9Rtkx2n7wxenmvWv1KaaG0KXnrdmeKXSjhyCxFs/fC10UCsQQ
 tHl1c4cyL+5zpw9FQyL2fa16dSrWSgCV28FfEFmc5h1OH7SnrSq0GHVrb4XIP2DQ
 p3q3QmXGuI66ue7oC/pgo2KHFIv9+VmR6SgexsT38h3zvPLA5CgqmkF53fTfRYhL
 ukr5TPlXd3s5Vj7wtFzArtegjLnpzVoxnZz5l9IWwBUZ691qjMLsFIzDFFvD6zON
 4PScvQsaQYfNJuCxPYn2KtwFnupSjqXJsqjT1t3TipAD4qUKdcQPx81x/jw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qe9vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2369dd58602so1289335ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297737; x=1753902537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DySszsnLFN46txmewo3gUR0DN+Qtxzt6DPVvLE0QlUA=;
 b=AB4QIIKdzI9eOslPKb22/VsfnGZNVcF981M5kjG5WcfREgAM05mgmps2quXk3tNc2d
 bEjc36268movvoNaaeQCoynEGTlBRYRTTFsjawzRmAEaze6Hux+MF1xYsgCKLXNCbTv+
 j6X5ZvBwJd/RSOBwSvavVU7nTm/0qxrArqdRAJs93s+DJXaCpMrb98lKvl/IkUcYhcsu
 /IYWejObrokdzJWK1B3og3lbn/I6ibN/SEJbHmk6i1mY1n3Hje7rhuqaeQ2KW1IFddbG
 HVKGqW5FScC8hbMbF8vVTY1egbLVlBqs+2EFQVKPt8bGaN48AswCjBnHzCWpLLbbxzJC
 1t7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpbbgjbm5ty1AJjpT2LmXoGXl4UMkcSv33UX7cvd0E8aurlGcSLwnl9mgoM+lFQLAbyBjxjIYj8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytz6Wr1RaN1J3tfpI3r1rNU6QudgwHvuQ3AV+AYU5gkuEF7JX/
 OPHgQRDU5Pm36eTGOWGYx+1R2w9eZNmaeP0EkEDrIe+sI+UO3464r0OxHUKfSu2nnAHDUDNJqXl
 K7TzMoq+QK35F+Vx/grfCIhRQ7hH8NqSfvrqLWwTu65yV+6fVQqUzHIVC53qeE0jXYnFBhgc=
X-Gm-Gg: ASbGnctyxKgPsQwzV3QvZ0kTx6tXil+tinkkNRXHKUFpDQvem/BNgXe87jyPOJ0tO9R
 HnCiOLC1rNSVkXLHGuPZWH/5vrHFiIKcjxT/yF2RWakWdu2J1BtqNQSvEgtGDzJQ5+vN5exr033
 rFkI7SQ1dwSZyQRmCqeuFQtDtrUOTFMVerV2tbVKX2ZZsrfNKaPZgEf49z2QKSn+drGoTErQKBY
 OYCciO9xGg21Mn5THBNJEDTuYYBen/7jyBNN6jI3e3DpFREsYRk6KXljySU2aeBvLCky4rUnJNe
 J02+7CxveGaJ3mKSQxvVGptg8gbrPMYKGFiUND7EvZMDSrrX+jc=
X-Received: by 2002:a17:902:e892:b0:234:b41e:378f with SMTP id
 d9443c01a7336-23f9814e994mr60313685ad.15.1753297736822; 
 Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvO2wHRoQjvHn2W4SmUFBRllrdv1e83xv0jpGEErywCjUsrAZwZkzrYZm9UaPLuj47t1U5KQ==
X-Received: by 2002:a17:902:e892:b0:234:b41e:378f with SMTP id
 d9443c01a7336-23f9814e994mr60313235ad.15.1753297736352; 
 Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2d06sm101524775ad.43.2025.07.23.12.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/msm: Fix refcnt underflow in error path
Date: Wed, 23 Jul 2025 12:08:49 -0700
Message-ID: <20250723190852.18394-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX8/RIURPlfjtu
 l/o94JMdHMt5A19UZvcpLonVq97yNnI7Al90POnJUudZvccceCL87VKe7jkT6YxJcCHJgzKleLV
 K6t/l18oI6/pB5WHy8hJ8d0PaE4WhII3PtbQlc/YaLXncnjqF0jG1LBM4OP487PWDz8Tv9B44iO
 z12iA5HYrzIarjXE85oFJDlTgEvdpPmoCze/zuFWkcWcYoIufBm5p/STaqIsrLU1FwHapET9Yld
 af1zBEX1yUmDRT1UNsq5HtRpk2cTp2nuQ2TEpcqNZU8wUyDSubiu0mzPNIAuvVxoQFLDYXU2p+F
 xHXfmi+cBuDbEWao55fosw5eXdR0jQzH3mpjIBphGNhDI/gi3PH/E3u2vui+l5X6z5NmeqwDFrq
 kcDQmY85+GvopEaiKb45lEJHsSLPcR9gbEAhlQ6ScqRAUubMuifbUgxZR1HMQYBCHaij9z0j
X-Proofpoint-ORIG-GUID: wikl91MLluVEOnY_0GXSZSmVu8e4fJ6D
X-Proofpoint-GUID: wikl91MLluVEOnY_0GXSZSmVu8e4fJ6D
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6881334a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=CtOTWVoUMOquu4jWpgwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162
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

If we hit an error path in GEM obj creation before msm_gem_new_handle()
updates obj->resv to point to the gpuvm resv object, then obj->resv
still points to &obj->_resv.  In this case we don't want to decrement
the refcount of the object being freed (since the refcnt is already
zero).  This fixes the following splat:

   ------------[ cut here ]------------
   refcount_t: underflow; use-after-free.
   WARNING: CPU: 9 PID: 7013 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
   Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_wsa884x regmap_sdw q6prm_clocks q6apm_lpass_da>
    qcom_pil_info i2c_hid drm_kms_helper qcom_common qcom_q6v5 phy_snps_eusb2 qcom_geni_serial drm qcom_sysmon pinctrl_s>
   CPU: 9 UID: 1000 PID: 7013 Comm: deqp-vk Not tainted 6.16.0-rc4-debug+ #25 PREEMPT(voluntary)
   Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
   pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
   pc : refcount_warn_saturate+0xf4/0x148
   lr : refcount_warn_saturate+0xf4/0x148
   sp : ffff8000a2073920
   x29: ffff8000a2073920 x28: 0000000000000010 x27: 0000000000000010
   x26: 0000000000000042 x25: ffff000810e09800 x24: 0000000000000010
   x23: ffff8000a2073b94 x22: ffff000ddb22de00 x21: ffff000ddb22dc00
   x20: ffff000ddb22ddf8 x19: ffff0008024934e0 x18: 000000000000000a
   x17: 0000000000000000 x16: ffff9f8c67d77340 x15: 0000000000000000
   x14: 00000000ffffffff x13: 2e656572662d7265 x12: 7466612d65737520
   x11: 3b776f6c66726564 x10: 00000000ffff7fff x9 : ffff9f8c67506c70
   x8 : ffff9f8c69fa26f0 x7 : 00000000000bffe8 x6 : c0000000ffff7fff
   x5 : ffff000f53e14548 x4 : ffff6082ea2b2000 x3 : ffff0008b86ab080
   x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008b86ab080
   Call trace:
    refcount_warn_saturate+0xf4/0x148 (P)
    msm_gem_free_object+0x248/0x260 [msm]
    drm_gem_object_free+0x24/0x40 [drm]
    msm_gem_new+0x1c4/0x1e0 [msm]
    msm_gem_new_handle+0x3c/0x1a0 [msm]
    msm_ioctl_gem_new+0x38/0x70 [msm]
    drm_ioctl_kernel+0xc8/0x138 [drm]
    drm_ioctl+0x2c8/0x618 [drm]
    __arm64_sys_ioctl+0xac/0x108
    invoke_syscall.constprop.0+0x64/0xe8
    el0_svc_common.constprop.0+0x40/0xe8
    do_el0_svc+0x24/0x38
    el0_svc+0x54/0x1d8
    el0t_64_sync_handler+0x10c/0x138
    el0t_64_sync+0x19c/0x1a0
   irq event stamp: 3698694
   hardirqs last  enabled at (3698693): [<ffff9f8c675021dc>] __up_console_sem+0x74/0x90
   hardirqs last disabled at (3698694): [<ffff9f8c68ce8164>] el1_dbg+0x24/0x90
   softirqs last  enabled at (3697578): [<ffff9f8c6744ec5c>] handle_softirqs+0x454/0x4b0
   softirqs last disabled at (3697567): [<ffff9f8c67360244>] __do_softirq+0x1c/0x28
   ---[ end trace 0000000000000000 ]---

Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 33d3354c6102..958bac4e2768 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1114,10 +1114,12 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
-	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+	if (obj->resv != &obj->_resv) {
 		struct drm_gem_object *r_obj =
 			container_of(obj->resv, struct drm_gem_object, _resv);
 
+		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
+
 		/* Drop reference we hold to shared resv obj: */
 		drm_gem_object_put(r_obj);
 	}
-- 
2.50.1

