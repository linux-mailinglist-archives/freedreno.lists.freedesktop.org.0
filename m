Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7FB2A122
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 14:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925A10E431;
	Mon, 18 Aug 2025 12:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRbbCsbo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039E810E1E1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8UqAj030081
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=; b=CRbbCsboCmEeSV5G
 He/9QKkQkSmpqBbjylTHOsOuzhgOf2ZhdMWXnzJfyK0gPTKGdEiKKsTzy0fg7u19
 EByc/RZlQ4mD+wRAmk7W90I5z3hSLiS/Pi0/aB54nJLnE0jtuzkfP54FVMJQKB0L
 cU7oU/ydbX9pbuGUsGNDh9ExK4dqWRDWUTanvWQLQHKzDU297sSq/kyGCldhQBda
 UwOSozM4LuL+lz6hT55a5NYtIwLq9wGCYv5z3XaEUDeqIaGBCt64A1NclTy4zx/U
 a+QHWW069SO57XSNorziTvrd9Lx3aY/TcT/hB4CsV+fl3aPJji/sZXS/coxL0K1r
 P8bdQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj744kur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2445823bc21so104576685ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755519048; x=1756123848;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=;
 b=dZ5jLV9jYTWFCMkLZStwc8tH6D1dXeQrzes3DBnh190B0y+MGIncOB98k5lYi6gLsb
 nIOHj5q0qxGYhcDfxhRQdpM0BScigC0nEz2Pr7S/SXlZxtSpf8AkntNAzAb3NOHW071p
 DfUJl8qK11PClCEfQTI9YMU95Wq3+dq2Y5tR/tOXkjM0zUVfiUF/2XOY+nB+BlE5OEM8
 Rsdiwp+73B6ZEAEfFajQQGkkrm0hJE28T2Mi9ob98YFdCJcES+gTeWNZnCtv6vSx1mc6
 3octdR3Em7QqKYtqZnNjdkRxh20qc4wWqBfFC7lOOaZLZSePqWMMRWTPNqGSAbh/s8Dn
 C6fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEhoq9C1QUgbxluBhduJYH4/0b5IYwzi0EKDlPFeI4F/PqJ6Bfp1hvCh3mzXN9xQK5+Pz/wKkAAYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxajym7Nc6iHNxUHNkoHxcfjUS1Yy/1HcU2uXJ+pM9DO3w/J9w/
 yitNkdLQ3aPG2qVRHQSoLC3LBqANcs/y2Y2IAxJ0LNbP7YRHcvZwEsEFdVRtkQOOPeHf2ttVrLQ
 n+IgYYAz9XyeB/ldkeW8yY6/XjeUVa2QuiZdfmzDS4mvAJ0GPK7HspkofFOjw9PJt2ezGDXs=
X-Gm-Gg: ASbGncsaGBTJkKZo/AmVm3NFhnVmNJj7m5RG6SMO8pxVaPOjl0WFopbwi5VuNM+tL+V
 1wHefTGRwyEbPJWkH5QX37i4AWhefBrXn/hCP4MgYODFbGuZs0ZMklEAzVASsxRRNGJYj8C9HgH
 gk4pPFZc8U3iduNZdAkV97YpLcRpAMO40melhho9kevCcgkKY5klkHYS/VBgtxByHBZPPD/M69v
 huTu+dFtamogDV1AOMV75efUctRpicVANrTvH/rOmJun7VQ8OoBFerBtlbIsNDqyzfjpAgGEzUi
 +o/kYyL0qH1hvguXvAolfX4TFDCA0NjS7ErtavYpzMUnzdLuNTVBFwq22RfjLPFJ
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id
 d9443c01a7336-2446d85f7demr181641595ad.31.1755519048388; 
 Mon, 18 Aug 2025 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZONzJWFtT1XNEyRK6xcm4gebbokS24vhl3Ky3z4naJfpk4imCqD/UHpgAJi8OHvE0+TLUjg==
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id
 d9443c01a7336-2446d85f7demr181641135ad.31.1755519047954; 
 Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446c2f441asm79279165ad.0.2025.08.18.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Message-ID: <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 17:40:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YnZz5EGAVA4-_NoXuu42imh7arfjLgNV
X-Proofpoint-ORIG-GUID: YnZz5EGAVA4-_NoXuu42imh7arfjLgNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX6aruvaVKiATz
 ZpvP3iY5cAnIL2gEBEmM3EZpuYCSi+PwpUSs6YbPuT4vHfHL2P2oJfn2g/UUrVsy8aj93oNyiim
 nCOQR7tWWJ/PfFlh4qb3PsGEI4/afFvh2O9jv8cSKsyLmvyyxim+Mrl6dyYr22vcXr0gnA6RtGV
 I6qurPq42iXusDuLMNDcwg5xWRAM3cgdFre4k35Mm6eCstsaTMdK7O9Wbc+spyzsM6C+UjPT3pU
 db3zdv00BcRM9iMGyPGt8LQ5HYw9GXWj9zBt5ezTBbPoqk1byNWcn8nRNj4M27R3ottfxzFMybK
 rrR5Df76WmtUvDMfExDdvYSbdr+TtOsR3KsQjRPCgSEs1zwtodz8KzdQDApaUdciZPBll8pEAT2
 oQCIOU6L
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a31849 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=b798ue3nI8IKDaXQGNYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
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

On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
> When a VM is marked as an usuable we disallow new submissions from it,
> however submissions that where already scheduled on the ring would still
> be re-sent.
> 
> Since this can lead to further hangs, avoid emitting the actual IBs.
> 
> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>  			unsigned long flags;
>  
>  			spin_lock_irqsave(&ring->submit_lock, flags);
> -			list_for_each_entry(submit, &ring->submits, node)
> +			list_for_each_entry(submit, &ring->submits, node) {
> +				/*
> +				 * If the submit uses an unusable vm make sure
> +				 * we don't actually run it
> +				 */
> +				if (to_msm_vm(submit->vm)->unusable)
> +					submit->nr_cmds = 0;

Just curious, why not just retire this submit here?

-Akhil

>  				gpu->funcs->submit(gpu, submit);
> +			}
>  			spin_unlock_irqrestore(&ring->submit_lock, flags);
>  		}
>  	}
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250813-unusable_fix_b4-10bde6f3b756
> 
> Best regards,

