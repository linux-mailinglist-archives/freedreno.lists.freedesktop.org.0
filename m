Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D88D0E0B8
	for <lists+freedreno@lfdr.de>; Sun, 11 Jan 2026 03:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007E010E02C;
	Sun, 11 Jan 2026 02:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmPiFGX1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEsfkck2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FB410E02C
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ANeMvK1352539
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=; b=Vm
 PiFGX1c1vKbqdU0TKycFLpnnPqXpg5C3Kr4638z6ZzOh55JmoOyz13CjWLkHxkzc
 zMK4DYOIm+wsrMc4Q0+loYnxbFOVz+j/KcSteXejUZ9AVeeorJRnET1+VGulCXXj
 GqL2bXQoE4rwOg25TFap+73Y2w1uznosbJFDWMfc9RRQh3T2SPtLIHp36w+PjgSc
 ttKF9AxzFWlxSvQ7wOxxPQ9kEGBKNz807kOTU8Ob4LVMU8bIGecIuapl26RRfBK2
 lfPLdMDkWKgwatVJMcszzVbIUzystDsIV8xx9YZOP9hV2Ll0enDKc9VpDhId0n24
 NdTxu/FXaDhzWSj5bWMw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhahg7w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:24:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-450239c8c44so5541916b6e.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 18:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768098250; x=1768703050;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
 b=HEsfkck2/RhqZNFkCTPS1UxFPVy0I6dUsK77dKyHLJQg6iHCBvSGgtL2D0W+DBIU5M
 J1tSkR37r+gbpcV7FNrybLL+Jod44xK3GEYZGdzmdu/76SsKRCD5hSX5sDZSgbTUaPVH
 y3sqyMWXq2zbYm8vhFLmjZPH0c4l5gwE1pTV9x0OczfLxqTLfN1VIy4l2qhq76nWBuRi
 pUBug4Qgaq32SO8cxQFkGVOaFQ6xiiEPbA6vnzZM4yfW/J9Bh+T1Jq5NG89p7JOoB52H
 6Ingi/wlzBGiqIW9yl1OzVObBQgPSS1YIuyY/fjD9jZhzX7F8UublVLKW1HRMXo5jfYe
 l++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768098250; x=1768703050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
 b=M2UeVRE8cJuw4pmDRQfpjksuRIKSdsTlLdJJEdkJy6pmDyYy+2jL77cooon2bl9U3r
 WKE8t302FHORzyaXrf007ypd6MSBbjvV25AL6GH5hHVagf2enyhBE8F2ShAV57olFZpJ
 1ljdUlcmh0k+BZzU95GbTjmtcR86MsVJhhtt2vjDQJrx7tHCnlOZ9YVIRJgWqnfJ+ROA
 q24o8ivNxnbiu2S0cMcwzZ4a9UQFgkfEyaf0n9dCV7obDcT1pNjBMhW0Iv8gCJFI6wZ1
 RGnwIqTAo9KWibvx+4V1uVNFPZPHtvAi1IuSqF2RZAym5Ve+7D6IhvyEhdZYI7+OwOAf
 mizQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0DiKDzJR/I+dzLvg1QB1KZNwMf5PjoYEjL08tBQ2lkqx8LaEmlQbpEQQzMyjTu2iqKAPIvhSPUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5hf3uWrKS+GQVL0mJJbyCOBYBpo7IqLTc3u7g5EjGbRHuTDlu
 Ilu7EWhokouJftWwpfx3BqUuR+tW5ysLDfmKwmkMAfWObIUmc8t917I2pfr+hdgA2Jd8uADft9Z
 X+EacxqI+biVQgm+0TfioRW/EJKJ/yC+tthJa+DrOFrrRHR2m2ia2aL8Qvi9HegDbwid4j37gnf
 9AOaORpPlQl03gnzfWMjeYin1FESEJCSl+ysEx0OBllvqZjQ==
X-Gm-Gg: AY/fxX5C4+oY+m86XRvG9R/kU/91CKFGfcP4ldHIRhJHkXzGWsiiPiZhtj0q6LB6gI1
 6A+VUgmT0UaafQ/HWIV1GM0pJ4kiNEPrUdrNG2UBhlJ5d8ddDPyPNsUv55eZ9166GCqDPGH4zPR
 okquAo9JpF8uwDETdDdBxQCBNQHbUVNrux2sUTuDuOfHrcnlJXlrxE8AN6TE5CCgThkg==
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id
 5614622812f47-45a6bd53fb9mr7611221b6e.12.1768098250429; 
 Sat, 10 Jan 2026 18:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZCXxumreVsEAC+mOBpwX0ObCz4RryEbZ294If65z2upgBBXuNeAZ+1GulIUBpl6GgB8Nzvm3UMyAwatN22nk=
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id
 5614622812f47-45a6bd53fb9mr7611210b6e.12.1768098250085; Sat, 10 Jan 2026
 18:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
 <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
In-Reply-To: <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 18:23:59 -0800
X-Gm-Features: AZwV_QgCfLYp9_RTLz0X2-33DvwusCJJr2t2IF7t2E866j79DbjUC3J_YmBXnVc
Message-ID: <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PUFVxCtWAxxUpoQo3VficlyLVvl3Ps5-
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=696309cb cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wUCF3RwO_GvFUl8ueR4A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: PUFVxCtWAxxUpoQo3VficlyLVvl3Ps5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOSBTYWx0ZWRfX1c8Y0iTNLmR+
 t42yz2HtkjLza9CAvIq6bGQwGOtHgMK7hNssHhEXc12TiV0fOCbs7nT8yqz3oc1XcvlUkmvKU9G
 hE0o5Ij/U+bhCnbAHBYuSic7Rnx/bOVDpKutujliRZ3KSiEVW3zxJ1v+7116mCn9pW+zLqU93b8
 2SaKfKVs8N2N1qwjwg9PMdXTjfJgSFdcyMuYa1jrwucsQa2owj+4wG52AHYEgMHhauUgOlWpxiN
 vAQcoGUgx7EritiKsnSctSyo8y6ueKYaHVqngyx1s/161pPHk9+HBuAtdGUeqbXvtsc0N73+JnQ
 8lIiEE6KgmO82Ysft/mRFeKxGqPb3yaz6EbmJkLpkwYGIp4pUlZxz0kNUwzOTwaybYv5Wl73qI/
 169sNkbDjeeKO1GBLMuO5I0LDitGefDdv3+WPz2dOLuhRvL7dUTidgtm0NgAbUR34uzVPrWrw5T
 Qd31e7gHjKAf7kbLZLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110019
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Jan 10, 2026 at 6:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> > This should also be zero for gen8.
> >
> > Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 1c80909e63ca..d5fe6f6f0dec 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >               *value =3D adreno_gpu->info->gmem;
> >               return 0;
> >       case MSM_PARAM_GMEM_BASE:
> > -             if (adreno_is_a650_family(adreno_gpu) ||
> > -                 adreno_is_a740_family(adreno_gpu))
> > +             if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
>
> What about a7xx gen1? should it also be 0?

*probably*.. I'm guessing this was incorrect before

BR,
-R

>
> >                       *value =3D 0;
> >               else
> >                       *value =3D 0x100000;
> > --
> > 2.52.0
> >
>
> --
> With best wishes
> Dmitry
