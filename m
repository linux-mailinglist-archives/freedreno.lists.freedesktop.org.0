Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987AC7A891
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 16:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D71B10E161;
	Fri, 21 Nov 2025 15:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjcOhEuo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFHHa+X1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A19A10E161
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 15:26:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AL8rpiI3676366
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 15:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H0U0Tnm0EpVTEALUintQ2iiv6TTsZAZNA3apaFu5wK4=; b=bjcOhEuoXvQRDLLX
 rZDokQi9fzYTDoIWQT2v99P59IeR45Hw4yQo5j6mrTPcV1gYPNUk1W9g7rqs+v5p
 9kAZ4OtQxyfRfpOBLqfQnKSiibAhGZetTqETAHq5dAhSm512TzgfwgxnuICK9Bhr
 NFDTNNWWN6s1FmJWIV7ZYKmWEJXKXUV9rkhaVw31WX4ezEbEs6IydyU/F+Iwdieu
 GypiEO4MOhtHEqwnIZCMWsQd8zngzYXiO6wWuU3lhRcLkMhxhsvjpHuwuA2VD375
 ygxVgcAkonku9WT/Td9je+d7apUJ1KbQjKlF7Y/Nc+E8kesS1mD+Jk7oZdYfpYOF
 d1WaTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj992g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 15:26:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3437863d0easo3883877a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763738792; x=1764343592;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H0U0Tnm0EpVTEALUintQ2iiv6TTsZAZNA3apaFu5wK4=;
 b=aFHHa+X1T73VtE6R15AxF04rB615s/Y+UgRc1ub9rCd3yU4bt4+zcBkro4EzIDvGPE
 06hUsNoHNjTU9MeGbnTICYCKusEwz5SB0PdC0w9GffZTLgB9R96vZVOTfqdk+IS3ClLx
 Q3ev5aecDg7cOlTdo2DxxlNzrz7QbC9GRQse6+JouXA27GvTBrVP5bax32jRe8tP8Nav
 Bvlk6aWpjWfECbi+4aBKxO+CDG1gw6vyxq0qZJDbClPtYrmn6n4QjuC6O/KNqY5Aew0b
 reS0mjj6He1Yd6bsOWcajh5r4b+Q7skSCdwfYqbNshXvfG4PnwTzhGm3utFQgzEGk/a0
 JVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763738792; x=1764343592;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0U0Tnm0EpVTEALUintQ2iiv6TTsZAZNA3apaFu5wK4=;
 b=NRRbJXsjYXjdguDCkckoM0K8aEYMmfNlnp3Ue+V5lpEefrlwv/AQ7g/yKZgGouhzo2
 IM1mVK9JKcMp0KWzIu2vjOWnrBRcHLiBiNtaJO54sOPq1Yjj3tKPoa7KMy/O+hKodonW
 uNNih1iF0AKExNEy1KmBgRdCQsqSwFB2vE8bNSZ/bPOEa+ZmT7ejcouYpLJpUi3UWBZ2
 8AkZspkOjWxJAm0hc4qkk3ymSwV4SKSoaVM7Z6Ptr2Padcgoi4Mp549d2LvyrZ74/BaN
 MUyd6siglA9Hs3UccFGGCb7/wEE4BYJLWVjfS8EmG/0sc8CXXFXOkYzx3qnfrn2q/Mhg
 Jr4A==
X-Gm-Message-State: AOJu0YwMbQIdQeR+WbV+bhw9aoCDLyag1G9UCsF6Y8TZAJ5idEYDi6fr
 UWigF/TBTvwf4RsIlf1/AUQ+bu5lr+b3KyVAy19M9DYVAtmwRtTG1mzmQj1qBL17yBFAUtxh4Lr
 h/CY2MdkHi3cB/sBQiWMJC1n+FAmKI7nZSAfLLZoC4om4Gky3uRi/jsXLtRnZ1G0hFQSb4lc=
X-Gm-Gg: ASbGnctak5bGKmUmwjV91SR4j4hKp44qpyXrsY4bK+9RYCmhlY9ZreUAkW9Sf/VpIyZ
 r5xp5sPt9Rtq/kmq3ypiqI1om21uAd2J34C9feRLL1wekE3PuyB4P5R5QakeuZEqV3P07vCNKog
 rivqBoE6Y1k0qDlZC7NmNj38Q9h6iE4Of/58ORMzigo28Xn5DfBSt1Iwx0NqhNEJWcS/5O5qPUa
 VABfIooFEdWrGipPxhtTaKFpwr91JxDWg7ky2Sy7k7rMRhnYDERVFgs1k/0b000nTMTbS5qWbdJ
 jhnNCxNh0CJDg+8fKHPYJzCxIf7enzz3kHy4RmoHJbRpg4LCBoMplTKAnTr5p3cRRVSBqqH7yLD
 Eskvt9oF8DnduqsxSKtjEJAAcPHgyjySOOw==
X-Received: by 2002:a17:90b:1b42:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-34733f236d3mr3168553a91.18.1763738792307; 
 Fri, 21 Nov 2025 07:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFeKEUVcSwp05MwSoRYbsOWYg0La9YHLRWgl1zZ1D16OsKmdTApmOb378Q8X99rsrfnGIImA==
X-Received: by 2002:a17:90b:1b42:b0:341:8b2b:43c with SMTP id
 98e67ed59e1d1-34733f236d3mr3168528a91.18.1763738791662; 
 Fri, 21 Nov 2025 07:26:31 -0800 (PST)
Received: from [192.168.1.7] ([106.222.235.192])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34727be2320sm5755254a91.5.2025.11.21.07.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 07:26:31 -0800 (PST)
Message-ID: <d7305cc9-3514-4d68-b24b-8a838297cd58@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:56:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: freedreno@lists.freedesktop.org
References: <aSBqtjkOKOJrK8D0@stanley.mountain>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aSBqtjkOKOJrK8D0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=692084a9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=1VMsAEDrMo3f5NIhEus0lw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=D01jli1SifB2uP5j77UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExMyBTYWx0ZWRfX+BnuImwLX8nF
 0XO8vehaEeBEHVMgNGp8cOyCn3/pWNOjf1BUs59aJAbuT6pHZ0gzFvmcKAKBQV/XpphuQDG0TLV
 +WhUiG7juG2ripkLb5jA//CBz/E9yiVzSb/O3zWGxZF898PubVt8KoxFZ3dGY9XBCJdoR/vbeov
 Dso94UMYvrjAhoNZp4ddvOjsbsZeGFYJ+AM62PRbyTVugxAeCs63aD6P3tzIJUW9kGdcsicxkSq
 ltbn1hdBYOHJQlP2IzYWHU2SyNf9VWrgqkycBI/cGpcHR3qhdVj+1Tdfc6x28Yn7pFlnIll15JU
 54wfiTtgSBW+gwxgewbe9+KsjPB4woxPkeRtwEW5wXbbWOC7ypwA+k0L4shuXmQtlBwwwOyDr7Z
 mTkoJFl5WOti3fTUT561ptHww079Xw==
X-Proofpoint-GUID: LFrbfiz76dziph3v4aQbhyHxeEyR_oYf
X-Proofpoint-ORIG-GUID: LFrbfiz76dziph3v4aQbhyHxeEyR_oYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210113
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

On 11/21/2025 7:05 PM, Dan Carpenter wrote:
> Hello Akhil P Oommen,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to
> catalogue") from Nov 18, 2025, leads to the following Smatch
> complaint:
> 
> drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
> drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
> drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
> 
> drivers/gpu/drm/msm/adreno/a3xx_gpu.c
>    524		struct platform_device *pdev = priv->gpu_pdev;
>    525		struct adreno_platform_config *config = pdev->dev.platform_data;
>                                                         ^^^^^^
> The patch adds a new unchecked dereference.
> 
>    526		struct icc_path *ocmem_icc_path;
>    527		struct icc_path *icc_path;
>    528		int ret;
>    529	
>    530		if (!pdev) {
>                     ^^^^^
> But the old  code assumed pdev could be NULL.
> 
>    531			DRM_DEV_ERROR(dev->dev, "no a3xx device\n");
>    532			ret = -ENXIO;

I looked up the history of this NULL check here and it looks like this
is present from the very first commit that added a3xx gpu support. In
that patch, pdev is assigned from a static variable which could be
potentially NULL.

But that is not the case now. gpu_pdev is updated from the parent fn
(adreno_bind()), so it cannot be NULL at this point. We can remove this
NULL check. I will send a patch.

-Akhil

> 
> regards,
> dan carpenter

