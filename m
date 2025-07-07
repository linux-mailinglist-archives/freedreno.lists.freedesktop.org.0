Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B5AFB269
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 13:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CE610E449;
	Mon,  7 Jul 2025 11:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4i5fxSy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B2610E449
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 11:39:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679bfjB031519
 for <freedreno@lists.freedesktop.org>; Mon, 7 Jul 2025 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=; b=X4i5fxSyp46KSI99
 V2EiRuQvPOjvULnaHqZ+39V/fqhpQcRfmQoyPhCY4JBc+SF5y+IsVSemm4ElsnF6
 bKpLBnZsYR0kD9tf6m67lhEg+e8a57vywOQKuXk7g0KKXdGwgUM96xQprDEpMEA9
 YnmbmWcuV1Hvc/J05bxGbwxC+AyfqBm6ocol2IgxhoQEoycVkFS7SxZ4xSfaFLTW
 DKnLYd1mHpASlc4bl/J4dAua4KuwDKcw/nfmnMfK1BA+E1aFfcJPPqPJMwGJtPCZ
 Kq9kY/CYM4aGAA0IaukaC9k51XeN8/K7CALjG5Ueq/5xt7u0trNXHlJk+Es46XTZ
 /Us1+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkcd5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 11:39:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so13031626d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 04:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751888344; x=1752493144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=;
 b=E+mcMC3bIvelNfEU1BgON0Kdrt5P9N1OK/1ehY9v2yyywdENutUaZWLW44MJCdqn3J
 Db3z9HiFq0TCxK20O0CbP4+SwbC75+ooqcQEBgoq7DEJ54L+2Y11OpAL56+0qHUg1/UG
 YrDAQAA0TJ5ckzg8HUXabmEDXNkvvAO9xJbEC0bu5VXpzLNVS3IShUZMqJOekDn9DW4U
 gnJmQoKDMxpJT+VbsAiBPtS/pyL6FQsx0gAtekX3B+GkOKy8NqdAV9k4ohDrDA+g9fNl
 JIhY+zjpXmDfBNe557ALP3Go0fvHZ90+g6HjacabQoRV3kXOKiMjZ3n0v85qraTvHat1
 FuTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3/4lOMFh2zqZMn9forlpvgQVeflPLikt8ngrPHqvDy/n1sAHFfk31RF2bmW2AWhAJi+Yv5TEkvsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziO+J+Y5rxKQMUV2w8fw4rrw/mKaq8+IBFOaFSaVkcHmPIYAhv
 /xrmTJHBx1F5jTqMgd00cg/YVnMIcUSrb6dw4FgRz6rooRC6jJkf+8auaSiEZ+oTFpe+uhH12EM
 D+/4Rs4ej05vK7a6gj8MBeKPwTvk2oBYWFe5uvzkidGdiQNvJTdN/lRLc7t4Obh1JTknNrUI=
X-Gm-Gg: ASbGncuKZA7SC/ZuVzABoYluRQGUTbmsiieoKPp+l1eKfnWRdCO0iJo37TJCRCJ9wtf
 R+j9P19J859MidzDYA6ILvRXTd7yRG7jBN4tVyQVEYC1+7gEMEpIFi4UhZabz3AOHSzv0jDXqI8
 pczmYU1w92M4S4z551IUBQ8gmckq94beFJv0GEphbFUwelYSxafxFZE6hKSiHhfNkLJ2zAMXJ00
 2Ct7MPZO10GpLKLuGCjQL0wxiGnISR/ahs+usJwbX+UXtd+ZBrzO51Nxt+H0eKCkMLQzYQmcspD
 rBu+w2f30Z++OCfRMyUQOuIMCDJRE4DXL7/rzmofLLWmLm0N6qVExyZ1CdwUGi8BzyGLePWc15q
 8Z4w=
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id
 af79cd13be357-7d5ddc71ca6mr618518885a.10.1751888343955; 
 Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlBB2pZnjJvy4s0xbnO8kJfhSozJw3RWVxbenXq2SUi3yJy4FIatJ/itKV8hIZ8ggcPhrWw==
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id
 af79cd13be357-7d5ddc71ca6mr618516885a.10.1751888343540; 
 Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0ffdb7sm5366403a12.53.2025.07.07.04.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:39:02 -0700 (PDT)
Message-ID: <c7ecbdfe-fee1-4299-9998-387d61d333a1@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX/F28yXxqo//U
 QKQZPGNKtMMOUxB8pqEJJ5NRfI/dXvEVHRvP9rDSduZqskCVz8UO3mexA+yCXUQrRSouJVNUDm6
 rBu5rT64oA2UpDOFZJk7mzNXSIs6A+c6Ml2if+V0ycPXBE0j5kZbVlWlw/txmlaBgbbgGcqmJ10
 0RzNcR6lQfpilVZAhkk6iWdJRXVBKbM53NHXFLaTuVSpRYJqg2CSkFQ7Yz8vYWkUR4otiVfDYl+
 0r6ewDSbqPgsmUKAR8saA9dZpfyH3OBn2Lbt7GZLFjk1wN4WHqLgLcYgyDyvnrLm6RBM8PUSN+s
 aoY5JdSMaIDdVzM3ozVgjEsa9Jbav0LDKFnjbkH+ohESv41ZxZ6ljibGkqecyY5bAUjAIQRzTmr
 yGLKnkJ/oaTHEe71ZlHQ+E35gJ7JInPE+EgV6T2cxebvh+IJrCna7ZL1WJLWfCiDNukwTlox
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686bb1d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HBZm8QPBBmupa505GRoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 9k5XWpPL829oQbUWlKEddigkFtZYkEYH
X-Proofpoint-GUID: 9k5XWpPL829oQbUWlKEddigkFtZYkEYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070067
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

On 7/6/25 12:50 PM, Dmitry Baryshkov wrote:
> With the switch to GPUVM the msm driver no longer supports the no-IOMMU
> configurations (even without the actual GPU). Return an error in case we
> face the lack of the IOMMU for an MDP4 device.
> 
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
>  		return ERR_CAST(mmu);
>  
>  	if (!mmu) {
> -		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> -		return NULL;
> +		drm_info(dev, "no IOMMU configuration is no longer supported\n");

"Couldn't IOMMU-map buffers, bailing out"?

I don't think we need to assume the user has knowledge of the driver history

Konrad


