Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF7C575F2
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 13:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E5710E7F4;
	Thu, 13 Nov 2025 12:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjxO0CH9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jt4/NYXf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B010E00F
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADBLmZg174703
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+GplvHX5yxJ933q0AmGSwv5z
 wUzQHMR7HZka/BgtTp8=; b=EjxO0CH97Q5YXz86h/exEubfja23O0cpfbonUSFO
 /EcgGBaDegu0X6DGJ0COHg4/Cv9Whk1CLhs50au+g/U68OYvdjxcYC7LRDJ10C7Y
 f/4gtfgZN7C92XuqmFmkUcBwU9m2tAFrbdOOV1rXoz4mAE44i7oGgN6ulNcyb7Mt
 q66lH2BpsdMtxD7wn1BvJKKjaKHlpW9IlRPOV/mfcG9X6d6ayeZNAUG/ZyFFnqiP
 UdsICNQuFKz/CIksK0/8U4hHosXzUZxZKMw3QchC3x+3QITrrMf08zLIsSgcQCtU
 MNNLvmSf631noRe0hvxaCyRjP+8cXcDnfCQpru0hatbOCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aded1r503-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 12:23:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ede679393aso21632511cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763036579; x=1763641379;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
 b=Jt4/NYXfdD5xQ3wPYqSJAq3MhyIHGH9MsFMld+ooAzWNuBfZWXXRCE1nnx1xGAgdbX
 UnuYU9aRRan9Vl8Lz10H3Wlyo1t0X2RNYV/6khRdESWuxk4IsKvFdF4qptxlVwebxpNi
 Mz6LPU5xFmeS+D5NUJ9kG3ikD1TaHzIKrTZHRGZDIrBdmMk+oS9MSadLCCRXJ0A+UhOT
 jYVqwlYK0fafd1QVACcRL1BvB0fd5Kwh/2cQC/G6mbN1yMxbwxatvkOXevMGNFHCWG2S
 GR2pFkodVau9XVxJQsdneE/uk01EcjoBs4nQw3En3FTItMuiu+rW/bJIjXS+vH99IIZp
 Il3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763036579; x=1763641379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GplvHX5yxJ933q0AmGSwv5zwUzQHMR7HZka/BgtTp8=;
 b=kvdwz9pbNnl2MdMS1irlGqI78u/c1fKIfQbWFARhQivh6FZTMxSu5SguPyzLK31PgJ
 SxaJNi5ml+6L8rKaPNOYuBxSfw5a60tfP9cFk14N4flVmvSJ0XS9djEN3z8cXAKo2sbi
 8bhs/lUgdXl7mhiAwfZXqTdYA9SCuCpg/o1sbGGKopcztMsvwko+Hblp2oGGkQfXZ1BT
 S8fJTaA2IlMqxM+Knf+L8RJevhlXWextVqFLKzmKR51gmr1H5m6JY1yFCFwYM+ZOqjAK
 w8PoKTaH55QhvOvFUKob7cQGLYdTpTPYUV1r/3beB9nqAo4axV6UoMcTr3Z/U/v5aa4z
 JdSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGe3OSlAkrT37q3dGpNZtSW2M6rXzAYGmjcWEt1QSlKK1FS08aLOA+rP/pl8O6fYGCiiDs47nMMkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJtx3RSxkYCGmxV6bUlGfh1nk4uyOB1j5bT1XtdgArlmoK3D3
 IHL3xPnZzUS4ZBhpdZi//ugIy1We85sIXRlxdZNyma6FtpKJ7EcHPPpx8NivEnHm+/UKVzavpiQ
 i0lOySFl1Q9VhAnzIFm4V12AVzMTNYN4jBkkEewWSy5HLdl7NdEWKEbDsthwnMS7+J0NFwi4=
X-Gm-Gg: ASbGnctyMSDfvo4oQm3JmdEaRrWNgrPqY3w9CtwqkUSNZp0AN1zYH6hS9DYEZ9JwouT
 a19Z7j5ZOTwZjpv5aTJlFjWtmyF4G8ihZjycIhZpTskqth7x2nAyG3ODEQK/GDkCD2axMsDRXz2
 k40/icLN4GxCH82iiLMmsRdPjkiD+FucQX4+8hTtFvHVhJPoZInvgNiBiMaJca0Cfc5aQ5vjviS
 Mii5Hncm7VkrSHMqUGiom9j3JifwqQWF3HNBN8iNcQR4I+svp7OB706q8u5tZj2DFXx9v7FqnqQ
 fUPY28kErWWL8LvkPXo0bYSonnZ3i3BTGKtiI2jKaVbDo3KvacyERVFhaGr3blJ6yu/ESnDftBl
 wGQ9HtedaXoDyRvPClUH2AS3A5tKePOqeSb69RB02RdEfOY3RrSCvlGObfBtgnzpYNLSPKA9Wjb
 eMxxewr8BRJdhE
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id
 d75a77b69052e-4eddba97f18mr79916651cf.0.1763036579297; 
 Thu, 13 Nov 2025 04:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYSlJ7Mqnq9Dyf5Mj+nWkiUVIb7DVf2qG0ZIWMq78bytd3X9FzuruWsSqOGP5mq4NeoWsUsw==
X-Received: by 2002:a05:622a:24a:b0:4ec:f5cd:8721 with SMTP id
 d75a77b69052e-4eddba97f18mr79916231cf.0.1763036578763; 
 Thu, 13 Nov 2025 04:22:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b4d70sm363916e87.39.2025.11.13.04.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 04:22:57 -0800 (PST)
Date: Thu, 13 Nov 2025 14:22:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: t5ClBcC8pFS50Fn671iYRa0Jl2XCtKuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5MiBTYWx0ZWRfX9vEnRnZBlh0i
 aYCczc5whQ7dCSFIIj1hpRBI4bfKFL+7q0j2kT55Yrc2jHbBmdvDP7v9D5Fsjq2vXTPW+hU6A2z
 L0DMhUByNwcNjPROuxdqzIQbzc1/U5Z8t7bYTdH4Dccay+8omWYmOte4b6GvmdASZ9U/0zJG/UA
 /xTtcXLQPAgljbfcuSTddGUOpHB4YKqkcxSlf9TodAIF7f0Syig0lNlrVgzoUiBcf2wJ31oYgR0
 3i+vN6kCK87WgwkveMIcFRroptXuKrq7m6w3kaLM518zpmYZj5ywVwPOyIpqHpeUL9i+st7PL2f
 4TAdL+HDJUnBN5IeEIj/fOXX9rKFsPi8eDoqeTdhlPfte77oKfmlz7dY4dWHC/sGNleUl4sR+Gq
 CsTCGy6EXg76cW+pCu2X2FMrQ4JnFA==
X-Authority-Analysis: v=2.4 cv=StudKfO0 c=1 sm=1 tr=0 ts=6915cda4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LPoitUEaq9Ymm4AzyX8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: t5ClBcC8pFS50Fn671iYRa0Jl2XCtKuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130092
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

On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> >> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> >>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >>>> In A6x family (which is a pretty big one), there are separate
> >>>> adreno_func definitions for each sub-generations. To streamline the
> >>>> identification of the correct struct for a gpu, move it to the
> >>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> index 44df6410bce1..9007a0e82a59 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> >>>
> >>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> >>
> >> Could you point me to the holi's devicetree? Currently I see only a610
> >> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> > 
> > I don't think upstream was ported to SM4350. SM6375 should need the same
> > hook, but I don't know why Konrad didn't enable GPU on that platform.
> 
> I'll try to fire up -next and confirm it hasn't bitrotten.

Maybe then a patch to enable it too?

-- 
With best wishes
Dmitry
