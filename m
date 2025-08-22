Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD1B32414
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 23:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BED10EBC8;
	Fri, 22 Aug 2025 21:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQS8Om7v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF710EBC9
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHaMih005538
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=; b=gQS8Om7vQtOyKzYk
 Fy41yFewp/AE82OFifGiQr6Rq+Zmao8xQeRDTu6nesE1TXyWnBUwaTp8ztldk0Zq
 rImQ6OLSJ9wzj2YrELxsUuD52qRalGZXUN/xiREzUKWV6u8PjB25m3OyML1S5mxg
 Muh8slscn3lggCPC2f7csqm2x/+hSOM4ttZmGEwsFGaVAKTvZ9/90DoMQKI4hoUB
 vfM6GPetebR5W/zyhtoN6HuMrpTiTRBa/b4tz3fEIveYq5j4xs0BmxYnMUQDuxt7
 ycv/Ok91yS8m3KrNuXIRhOHVSsja0cnbvkGEIgg0rKMa45f1j3X1EsecX5fzb2Si
 9gTNTg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3drgda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e8e28e1so6006192b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 14:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755897753; x=1756502553;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=;
 b=A3uAWgfeGywu+Fv5b4i9maLeoCUuneZqUMnRfG5Q/ohmFFj17/S55r8cloAZjhpdev
 8iw36h7zD6jntyqLehgJ8hKp71K0VvEG6esZLb2JW6jUgSznbpeRSVvf6+atIK0H7hlT
 6ApqmqFKnowVe9M1+MhtlnxaYRve9Pz/kyoJkIoNeNWRVbqBhyclbE7X48z1lXxbu/jF
 qcVWPS8XcckY7fLcLRpud9++tYeW/+XcmZ1BlFeQDFk34xjUpxtqSSiPZb6owatVAgPT
 ffPBYNjRx/n6VWyy+KI8M8mJbCwTeXGE7OdO+IEXzUfK4GC96ptpDE9E7CkVfLXV2WH5
 R7zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVVEXn713Pv63jG8+bsT+wg4mtVwdxmaN2wHZAXjHBadBiV9bE63LtVT2CszG79Gdo3S3Otrj0f5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEWlmzt4XqfIdkDzwZP8faGc+Vii3oi7+wxRbk1jRCevNc5Baa
 Dd296pQu89hobiP3zfHNlhYlsOp6v/JCI0pNrxPnm5/tGcX/ivnM73ir2ZCRfBTCeel4JDfGQgv
 Qh48meuWbjIhrhe4rM3Xv6nlvAA6zA2PAZCVDCVujMnm6knkxZ1oVHjnqjQUrFccTKvuLUEE=
X-Gm-Gg: ASbGncu2PQIpQAVfpWR4i9+eROyTB5997LBH62ge3oc13vu0AB+iKtSA5Asn/ZTf+vO
 FW1Ps4QrGxydJ60moyL/jjE46xDmwx26JoxbhxEIV8dklnbklccFXmt4/Vk5lujNxlbwoumQOTd
 KJ8vKQ6X45G+6YDC9ErFjMZmjbIDXokVof4gRFqWh+WjY8DZ5IwDj5U5zA+q22dWCIK4/SRYV/s
 aJH4Dsx7JEp2XXLSslAy8DGdMk9Ni5+m4uugl5YXgIAoF73ENVTbzgo7x6Ombksqpzm/9pyf4YB
 bfDEcEQ5tXGvoKSSSOZ1endxxiLhVuQmTDOXujwLb4IDfTQFLXFFsFFaonOQHLU=
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id
 d2e1a72fcca58-770375bb1b7mr3749743b3a.12.1755897752665; 
 Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqSDDQ1Oqep4mXvYQ0f5AHY2NlHaFudfMAfAYS8IQDadWgR54tO2EW+TnIYNX89ov0/SlHQg==
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id
 d2e1a72fcca58-770375bb1b7mr3749726b3a.12.1755897752210; 
 Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.235.20])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401af16bsm767687b3a.54.2025.08.22.14.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 14:22:31 -0700 (PDT)
Message-ID: <73ba625b-604d-44e7-a73b-9f727ec46917@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 02:52:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: make sure to not queue up recovery more than once
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
References: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o9JC6nB9S6DsWcT-2kDbrT8y3x0maISB
X-Proofpoint-ORIG-GUID: o9JC6nB9S6DsWcT-2kDbrT8y3x0maISB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfXxJ8l59ojUJnK
 yi6QGDd4VCZXaSoq/Ew9SIgRJkiXoGVuimC+0qp836uIlcXf+zOjv8fb8KN8v5ZLocvy5N2mFcs
 JopPlPyEBnsgGC4uokA8bduNt2WTfIIO4nMA3tI7tFMz+ALsZT1RD4kGbTWEV7G44EnQGlhrHIP
 eoCRYrMUCy2CVtWOC2amOcCeF7ykJR/C698EqAIz1JKUt1wBnOiVVW86sQv1QMOSyYl46xsO1KC
 kTJlaOqqJj0EsLiukQNlvc2ypzyVWnNLymPKA097yYoSC480tgO+h7n3k7YuHqx7eo5W77Wt9Se
 hZJuD/mWDtzT2kZQ8DnPphqF32EGePVXJPwbweq0lFtYL8BXqhGC10DpIe/gMqgo1Svt8cgz49T
 6nJGcKkT
X-Authority-Analysis: v=2.4 cv=WId/XmsR c=1 sm=1 tr=0 ts=68a8df99 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=YJRzWv9GHcPC3W2cS631hg==:17
 a=xRKJ3yPZld0_iGqN:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=F5irVdaa_9mHTkytiuEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161
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

On 8/21/2025 6:36 PM, Antonino Maniscalco wrote:
> If two fault IRQs arrive in short succession recovery work will be
> queued up twice.
> 
> When recovery runs a second time it may end up killing an unrelated
> context.
> 
> Prevent this by masking off interrupts when triggering recovery.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..f8992a68df7fb77362273206859e696c1a52e02f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	/* Turn off the hangcheck timer to keep it from bothering us */
>  	timer_delete(&gpu->hangcheck_timer);
>  
> +	/* Turn off interrupts to avoid triggering recovery again */
> +	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
> +
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>  
> 
> ---
> base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
> change-id: 20250821-recovery-fix-350c07a92f97
> 
> Best regards,

