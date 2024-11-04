Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766C9BB102
	for <lists+freedreno@lfdr.de>; Mon,  4 Nov 2024 11:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3DD10E3C6;
	Mon,  4 Nov 2024 10:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEHdljP9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567E610E0A9
 for <freedreno@lists.freedesktop.org>; Mon,  4 Nov 2024 10:24:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3MxNJW013478
 for <freedreno@lists.freedesktop.org>; Mon, 4 Nov 2024 10:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 14N8KBf1u26bmeVNCJGFmppsaMPBOux6kP+dUcgR0Po=; b=MEHdljP9jKFt1lW9
 RnAaj2PFcfzL6eaw+v9sw4oiaXsl5Qt/9cGA+UjdPW6J0Rmm9tdyBOu1+znDKQBS
 N4u5Fvon/GQ3MBcNY+O+5xJwYYfSRfuBdFKYuAUSPEvdgncytSqGRG1MLkMd+Fn0
 xAz/vHqrWkh7JzLWzDI32q4r9o13BoJwW5CXgg1vCFYMaXKqo+Cre2y/hFgdwOko
 LWqu7TQqKSm+ki7uid6oKg5JU0PwiqCG11ujqSDGYL8WP5jfGK2csWVuSrEK8art
 XoXtm8Loa1vftO3UF1x82j4JTUlkURtNFcBpg4sX1Vfs5Xz5YuHOgd8IGXiOFeuu
 a4LxSQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hbqja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 10:24:54 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-71813ca0342so447667a34.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 02:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730715894; x=1731320694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14N8KBf1u26bmeVNCJGFmppsaMPBOux6kP+dUcgR0Po=;
 b=K9nCqdh4xeQHWB90XnnyMIEEmsWj9uvqLXvNEpphBwM0x4M3VxfGB+N9z81XlBfXRn
 f8oBmGpXSTEvDFzXNUDJB/3FmLlQPljtVubfAWKUmppSUiV7CV0wxrJEVMY2u5VLg5wg
 gssv5dwWSu4JlhLURIeX7p3aEhGD+yYkcsz++/jzLtD6ClrFhxFPMKxm/Nfs9RaOSYP4
 tjiqiDbvV51go8FxR/j5KOVHnJeIie6TUOxiAICmRYg5u9AhGFW2siIwmrrIg1zjQx9z
 qAxFpKFdJf1kFPJflvLuK611mBwa6qN5/6KmGA5Sl2xxKe4ujS8/BkEQLDYhn1QIcG7B
 zJPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0On1d3sztbF4ieCAVC0H/uPH8PzarOEBQPVTl2Q3nbAgDZxgwSiDuP0DgHpNqXpvbxVRl2BVE6lg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBLoOVupW5JkOqdBMpgfP1d8B5FInkDXFvBVOQYZkLadGD6cqp
 EufqnZyq+MRuUEf+g9DS/hbIwhS3SjNNJuIe6OTJ8VgiTM4yN+zVJ0JYvZNbwV9jIXIsD+v0dIf
 fT6A0KVXPB8N45U0+VL8A7lUAMIFXNqMvKbzT+3xGTbS+SVhpGWZhrQvuvAMmGe//dxs=
X-Received: by 2002:a05:6870:8a07:b0:27b:9f8b:277b with SMTP id
 586e51a60fabf-29051dd5067mr6199544fac.14.1730715893731; 
 Mon, 04 Nov 2024 02:24:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhQM8hd98D0U32vPf+b4FFMEFXYKxCKvHKBZQ3R89HcMCulRi8LEhSSN9eeCUQJwHA5tmbQA==
X-Received: by 2002:a05:6870:8a07:b0:27b:9f8b:277b with SMTP id
 586e51a60fabf-29051dd5067mr6199541fac.14.1730715893442; 
 Mon, 04 Nov 2024 02:24:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566435c0sm529917566b.162.2024.11.04.02.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:24:52 -0800 (PST)
Message-ID: <c83247da-a2c8-4dd7-ba85-5db17ac7ec79@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 11:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LAUKJfGdoIktjePgBPw7swT8ruGzUjjF
X-Proofpoint-GUID: LAUKJfGdoIktjePgBPw7swT8ruGzUjjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040092
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

On 1.11.2024 4:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> Since there is no benefit with enabling RGMU at the moment, RGMU is
> entirely skipped in this patch.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> Mesa support is already available for A612. Verified Glmark2 with
> weston.
> 
> Some dependencies for the devicetree change are not yet available
> in the mailing lists. I will send it out as a separate patch later.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

[...]

> -	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
> +	return adreno_is_a610(gpu) ||
> +	       adreno_is_a702(gpu) ||
> +	       adreno_is_a612(gpu);
>  }

Nit: it would be nice if these were sorted but that's minor
