Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F94C51CA6
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 11:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48D10E08E;
	Wed, 12 Nov 2025 10:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlTfbT+T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnQpwrnP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2075D10E6E9
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:56:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9WwES1001738
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=; b=YlTfbT+TpP6Q//J2
 88dZBFYjCM7mJWQbvLvCgNBnt79B1djKmdfOGuzl/+iuS3qaHSbgt8nZm9geeWJM
 EwucGUm3IpaplnqdDfeWTdrpoCVvJeAa0SlphjJx/CipbmbNbfOWCvoG9sMatwTH
 tHQ/dxIhZuY1GhAaGECAtuO+JzvLQACttntfzqIZC7a19Cw7Bzvqfd0Re5N1viYa
 OGTENQuDwMfZhdelpH3rWa43UBIvTuMqKThNYEGIjsZjkllXWb++ZOtls0/VL7U2
 NUr1jhbOIGY/esw833NUGvru2Hdy5K62Xkeftl/wTpZSV2SxrX/ssMhfqEsxgAec
 VRvoBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20aj1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:56:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6317be8cso2224931cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762944965; x=1763549765;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
 b=HnQpwrnP5Kr0bSOTIET33GJXcL5XBL9P50xm3ZLoHgFlYtJuZM/lkIiehOmlN+uf9L
 gk4yBideVYcRJt049ItWzCho3Jj6O13FLdyuXMi30nsmyGepFUq1S474EMFqtzrJTrIE
 eM3+EOZaxlwNlNsakkyS6R4LWuBlnro9jf7ok7jr6u2riir7VvfOmwLRk9Bu/+mcwNsa
 icvzVRQHnQ6n/5RgARQCJYS6+AnmYSedOsIThceVShiCJBqhUTjWpKBeuHzpdA6FNGIZ
 PyhgqVj1BZx2kTLalccmBT1KDFFmhOiaSqC/SYvfw0diXLwn6Oz0v9uHw1JUrS8rziUn
 evMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762944965; x=1763549765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
 b=iG+M4GYSNiHvFFYXXtcfl40qWFHGqV0O9Q37KJsZxAJvvZX2k8uMrC9kUHkMNnbDMZ
 HNPC36kF/xaGYXTzChJVIdxQgx28B6KVxXxCcG3+b5gSyhYT47ZIlZBc+Y7qz7PD1kqz
 zhn1qn58Q0nZHGfhjKWMXe9M1AP/0BBcjEJIeJVvmx5/muN0LAbDWFYGtpyms/TMf2Dj
 lrtCd8BkaEKCR0lzVPe8TLbbZs4fLfnivhSmEsVDHUk4ldX1rPwfBdEHZHa9qfkk5CVT
 QM1HFEKpGN8z9PuvfbsBD0OKfBkvh4wxwYIuMya+C2+nhYllfu2Ssz/vFmNoPN9zU+2O
 dDMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiDhHGYmLf+HvgXOwPt+jwdlgDLaI/WjhD90zMjaXZvqGAGjWJQxGbYiZkVmHA0IjlncMIMqeWKUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDWv3yQgSu29TROgP8/CRw7ielG7PkQWlLkuPU4LHsGbFqtXMJ
 MH+PChYPxg78pLO88HnhJPLFB+x+D2jX+ubcQ50wdh0IWqsS+KphKlB9rhubB8G3lrmT4FWWOPq
 g8wnizjTtawRSo5yYIk6AVVxcWoCgflwZgs28rwMDuxOsRTWEXm0JMcMp0kkzOesu8OtZUcI=
X-Gm-Gg: ASbGncsif1Q7jJFlVCw52c+sViGDEF/MWpF0giylB0oZ4d/t+qmrQ3fX6JOPF8t2AYr
 FzhuhNhf2lZ/IBGUzDWW13AQ1jSet8UgGwu+I+YSHEsUuVSVUYlOoCEt3WbU2Ln+RI8R0CG5rFV
 XrkFQhELTNo3i0sNqZeS7BAmbiEXSHZLkxjfSPLSrDfTLxDIRCr5hBpiH8mvJBsjriZEW920HQF
 PGNiE1pe5mlYNt5aCL8BHcwjYXeR4UpunaVzHM4SGQRU8peCfmcnsPDNOSU04mMaXc5WsPsADuN
 m1vYkiCAFE9FbqIxd86l2YkQEkarWFFaw+oDs2H7ui/hwRujCACyfI4kRfFFk0KAMuAPXzWVGA9
 2D5CLCPf59vKaRrqRrv2XKzcTx9bTGrs8faSCQQudcZTa04LW/SaxzqUO
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id
 d75a77b69052e-4edde8b4640mr9664951cf.12.1762944965498; 
 Wed, 12 Nov 2025 02:56:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHehnHC4uvc/Oy+HlpbxtFmbNd/Io3lA6JdYlICTyBqU+FS0kyknsLAZ4U0LhGMGqz+5Q6+5A==
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id
 d75a77b69052e-4edde8b4640mr9664541cf.12.1762944965047; 
 Wed, 12 Nov 2025 02:56:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73381dd3besm103142666b.43.2025.11.12.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:56:04 -0800 (PST)
Message-ID: <8f1caccc-8a49-4c26-aeb4-f46f81593a30@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=691467c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LTedVN9yYKzQwah-PCsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Q744cWUgyiInLNTQQWDiqd-EYwec_voR
X-Proofpoint-GUID: Q744cWUgyiInLNTQQWDiqd-EYwec_voR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NyBTYWx0ZWRfX2E2eP4UyrbuM
 Cd310FvS5Sizzc1JFoWvBlP8jn253zzaecnwGEI9+PzxAszk7WarnuVilrGpZjlLr9E9BIXv6rG
 iSYZZvx8O3eqWFr9ApLMP4JgHKzw7bdpeH20ItPhixD+872dq+hG6DDvxqstkrtEmbwffFMnDny
 PqIX1Ug3yP3nWgVRvM06J4L99aD2LIZxtwiOqldsJwKf9bUG2xe2MI+gpgIWayg/In7ZKKe9vql
 0tmJHHndoBoD01M7l1uftVZLLu6mD6sEE62SFTaWcJph2J6/r9ZYzWYLa5xLqpaoOfI4BnQ+sCL
 8M1vxadAVg2gMgKJs8OugOwvUy4QK7Kgyf0Cp8KU/Z55CVRwHLvr200lZTnLkIHF3B/1r79VDQL
 wOFAHeJLyOjgqqE32ZikpzPW2gyueA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120087
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

The resulting diff is a little convoluted, but I think it generally
does the right thing

[...]

> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> +		const char *name, resource_size_t *start)
> +{
> +	void __iomem *ret;
> +	struct resource *res = platform_get_resource_byname(pdev,
> +			IORESOURCE_MEM, name);
> +
> +	if (!res) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	ret = ioremap(res->start, resource_size(res));
> +	if (!ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}

You can use devres here too, devm_platform_get_and_ioremap_resource()

Konrad
