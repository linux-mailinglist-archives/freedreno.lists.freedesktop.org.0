Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E3CDBCA5
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 10:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D642410E9A5;
	Wed, 24 Dec 2025 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQMYHzf4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ofizge0M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1652710E9A6
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8m1Z01206657
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=; b=hQMYHzf4JOv1CKdJ
 0PkY4AGsTJ/zJYleVuzwO+3xJTc5DHzo3vMv5YzCCTPDBtCDAkAMlMPT/gJ2JRb+
 QgS6VSfvBhVDI/2bZ1yN0cW5EN8xxLRxQAbIJkxo7hGfcOcy54sCEFq1EQY3KXCK
 aMrtyKRj3KztyTyMzFaqqGN/daAZumCnhDNw2hbFY7N0Qsw+YQefmv4PFDRYz/qY
 U/5ALh7zHlwXWAgLF94/uHuRXa6R/cEOyJeNW+KXeHV4IGutyduzj34Gjr4T4kbd
 yRjNafVMB4J+J4wH3XgFyrzgIB0qmfNmdGMJZKQ4/UpKqbv4i192+8yI/8g+bm+v
 aO3EWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1pbc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f4ab58098eso127214211cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568473; x=1767173273;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
 b=Ofizge0MoBU/1LmsqJty7ulZtIPIYUXufJthWecJfqwwpLRsFUXlLz0uUOO1FmavVW
 +3+6+Y/+qu462xglTKtyK3EbL2IXyDU/m9MtJ7AZMhBwm6TIC0gHP3Qgx/QhI2seSeR5
 r8aRALTYwdkLKNZukP/DObGQp7+shRGSg74Vww+1OYnlO2RsOJ36EE3KPUJj7tE8jCse
 NBEM1n0K+MQ+4KpWg7DyeGKol87rS530MpHnA8WIIDnFIEledZaTS/XbmPnjkZhE6qOA
 RjPyRTg5ksNoo5oHLq+dbvbwsQXc61ApxNS/Kb5DA4at+V8W0XKQCvY4/S6P2KPtRXH9
 lvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568473; x=1767173273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
 b=ErUNvpa/srFvyWtR2byAWG/e2uVbXOvkZtwaQcC7IDbvY82l1XroVLz8cTgAgFouEF
 DF60QYr42GMBgXHm+Za0CH+4nLl6orBiawTEVo2J7+BMirxpVFyRvBiuzzoEotXp2OPu
 +f9830beLioYPdcM1/y1coUODa7gLJuf30lmvf9YqF+S1hqtYKB8/iKOdLod+5pXakO4
 g0tbMCb426EGyxlrRklvwmDAr8MK8fblITqJ2TPR8OvhrIcMiKuuQfZiO+0LK3jaefhJ
 d8SiNvZ/hJlpOKvJsrpB9jLGLH/oNzA0m3UWU6g7af6LJbZvMLkdYpUWkIbwpY+RkpIC
 yHyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt2vfXKp4hZiG0+rLibHK6J05EcXA8Rg3maeeqOkVWxjbaniB+e4F64cgMCb0BaBDEvQlxSOHnwWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymaJcfc6dh2u5WdIvEyVJk0w7t+lDQMc+GB/3Or6dBHdfFA6+1
 7/yUY3uuqn+zV9hlS7uzLOOjfP/7fHTKHjS5zS292jErVczi3cPW21/qSLQ5eJAEeAdsqV1zGeS
 +HkBFLxbZ1CBOVzsxsBQ8f4pEJI1l/4B85bKyvf0v89BGo6MC3qMig8hi3TiLtmpRfCzHRWs=
X-Gm-Gg: AY/fxX5+oSPjhvjN1JkR9x7+wfJM1k0vfbm8RLauZNG3EWuL0lFycNDGhMG7w7DT4eW
 72BuwMyFWG3kLMwAbeyMJ3YozV9roi+vU+qDXo0q1CVqhMUpXAhW5QqLFlnBIWjiIscRK/+O/Cq
 uixh2XGtIxXXfR45v0ooRwfBvhivDbOD12le3UqasQWQfaF3ssT9wHB9od7kSvleNi7BMUsB0MM
 0sBJ0gFPc6pNpUE1tbOPg2sZ8ZfOTYFoPvbRgyxDbM374TsQjwJsJ6krMA4BaPyQXLTinYKoGOU
 nB81no9Ykekey5DRO//N6AuvhdE3AKdZFZNDAzPFo7SJkMz3KHp2Z5wEVooRtDrNcgg+llogdH3
 j7xOlYJcRKiiU3sdcfCc3Ud+AVHA5XI7cCKvXkuv6p0ClY5BwdnIAoaGZpgqD+14RZuP+thneUN
 D63Is/BUY7Q/SFhAqW2e65zZQ=
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id
 d75a77b69052e-4f4abcf2ad4mr267189391cf.31.1766568473478; 
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWCe9o6mSqXsfmrcr72/W6OEYW5Jn/Q617I8QOXG3eK+SCpaxmHlH6oOWFFKcZXbD25f2gHQ==
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id
 d75a77b69052e-4f4abcf2ad4mr267189221cf.31.1766568473058; 
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Date: Wed, 24 Dec 2025 11:27:45 +0200
Message-ID: <176656845706.3796981.9787556236263245313.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 53RN4rEidtlcSszhzKOScc6M6Zrbv5OT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX66S6B4wtYdef
 MEyd/YNT7TBaE7EKz4uN0TirxZ07kb6Zv7pWLsgXiP32OO0VZDr30Qz5SxUtYehzQ9dY6F0eBPj
 NlxhnZAfThKtNnnvyt48zymt1doSMRmsCzdt9yz+asYhJPTI7HhGE87JK2Kx86c4wGIPZ2GZRGV
 Hm5OYRhuDoGrqlvMDt8CIqNVcFyKk+PYtK+rNjLJCqkBdPBGjJrQf8H+JzfBdSkBuysbpYWfjxn
 Bu0p9XWDKyMsuo8WsOECYpJMylwGzRnY6vxcAoBMpjd+xQj46PHU3nyy2FcOZaYKGZ9wjerfY/t
 /lT3i9+rkHC3RcMmqe+ZPO+JZOq51dRh15Bo4OSUZfb3dXszgi0D4EiFmcjW8keYBaVUQBik1rl
 DraMVsnf4a2AmKpY2kum6PA0zUi/H5aogQ55xm1QOQFFSpgICW0a+LtEAqRrWuk2wQ51iOGqxBr
 0j0Sr+9o9f7ODg49sIg==
X-Proofpoint-GUID: 53RN4rEidtlcSszhzKOScc6M6Zrbv5OT
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bb21a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=WE_5KjwR_mefeVNbiCoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Fri, 19 Dec 2025 10:46:19 -0800, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
> 
> [...]

Applied to msm-fixes, thanks!

[01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a50d8777159a
[02/19] drm/msm/dp: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/23bee889e33d
[03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ce26953807ee
[04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/686f6aafd39f
[05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/70e66a0c5b1b
[06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d22d53ecb15
[07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/399f4345f07a
[08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f6d754552b55
[09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7ce9dd5eca99
[10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/847c12befab4
[11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/abc287a76e1c
[12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f5a7145d0fb1
[13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6e945d518a57
[14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3091c572fefd
[15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6ccad66048a
[16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4fc510e57161
[17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/010c98df53ce
[18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd5697865258
[19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7c85da6f63b1

Best regards,
-- 
With best wishes
Dmitry


