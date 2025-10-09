Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B7BC9510
	for <lists+freedreno@lfdr.de>; Thu, 09 Oct 2025 15:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367010EA54;
	Thu,  9 Oct 2025 13:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F394410EA4B
 for <freedreno@lists.freedesktop.org>; Thu,  9 Oct 2025 13:32:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EPBb028592
 for <freedreno@lists.freedesktop.org>; Thu, 9 Oct 2025 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
 iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
 E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
 MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
 WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
 Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
 94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ktxk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54a798b3508so1902153e0c.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760016774; x=1760621574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
 b=XnI6rJNwzE2hDwjNiV+Ier6EwY5OatXPEY5Mb0pF+erv6OZ5t9VulJlqOT3NzaRBhl
 TVuY7EuGtv11vKo3yPtl3YjpQKw+tpYB+2fPa37O7EBTEIlu5ynodBiaaFyHGgL46rHk
 iEhUmO3E057YoQchS1Jk317yfPOd7gLQ1GEHOLh9v6C8PbJ7XXmtPf76XH4bXyjKnaEI
 94ETr6ESArEu2SBpNbe3S0dsO/A6oh4IuMR9rd6FIFY0IcxL1vLrcSH0ewiYyyRhlMPw
 7Xq5E7kgJViu2DZKz5NMIrhjJCFWtfeotIQ/xMNEHlxUJWs4MigAZ6XL10r7hm8J/9UV
 9ecA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDw9wd72B5Qo8sT43B4kDgzKQYyrlYGqMoFW9+G4UpI1oMLHAmkNpuAvfuN6T+udGRGZuKHdYNO/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpJUmZlZa2AFp/KCcXXQGrFuLZTLKW9cvngHnPXDJep9zSLpi6
 NEAT1G/oUfQvFZyz881H53oKeqlyjznUGtpF3FYGqQxQDFLLmhtGMIT6nynMPKUwp7Umuc0EoOT
 3F5zsSTzImcBgl4IKi3pvEtvM5cCGpavy86CdD2RinK+zPQXxJkIQGrAUtizc8vTYavsh4io=
X-Gm-Gg: ASbGncur5vZnGDPCU0XsWFVofhJ78PKpVCdNTRo4lFBpo/pyBHxHGcoGrghfgYAStKB
 imV2f3GZDFv2hr0bCw11XaM+NsHiaJyqEigYhf8Ce33z3ja/btwjUB4WBQcOmfqz886X8CcB8sK
 he/0ZIhquaaJVp58qx+TcA59EpdBGi9SPqTloCNzOxXxVqS7c3CLuMnsbDXNw0cfv0nME0OB439
 MrXSINnpqwLAnrc/gLuiuIgU9n8zyK1IB7rp/LPfz0M99r2+xqp18sNKZu8Lt4JQwVxq9a7qQjy
 G+tR3c0gvAm4GCTsuafa9xk7/7dNXKwt+C4z2W72x8SI3Wqyb6pfwjXm3BDT9pCnrGmGmxarqdY
 CDjR5ft98Nh3mOcTV7BPLGM/XlM3CMYTTHrUlIMRfwhO0xGDtXlD/D4h5+A==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464551e0c.15.1760016774159; 
 Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679; 
 Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX32BrIxxYd61h
 9/SEdTlauvbAZd4ecvNdW1EDI7ZArGM+dhN9fGoXJxfqtDo5bu0E4L61tl1lv65uOG31yiNQaSi
 Fb/K6O7RS0yQ8BubB3caM0fBJTPACLJ+zvpbbzVhAXLE2PKdWzpWhNoGYJQXLZ2StzCkCplFbhT
 LIDayG8qV3StBk93pasV16ipPMPSOzG5x7j2XxQ5nAgqnYRTIOGTeGJa+gX5gRfmUW7NBG6GUq6
 aV9t5vQseMctTRyLjAGjM3N0RGbDBU10ljFoTtgLiG13Ma8AfAH8TCWIrjIkjezbV2+QdVaCWti
 7PDs7Mpo4q4MsZ6Tyb7KqhQL8GB7XlTebPYZqpI3zCUtbQMylZU9s7zJ+pUz4g1Z8LHzu9x4tdw
 BLwEqEdqQjBTkj2xPsu95HOyqKDqOQ==
X-Proofpoint-GUID: UTp8JVdO50mz43cQGz2gI8CkjsD-hNDm
X-Proofpoint-ORIG-GUID: UTp8JVdO50mz43cQGz2gI8CkjsD-hNDm
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry
