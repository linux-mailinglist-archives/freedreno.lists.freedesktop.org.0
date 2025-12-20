Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFACD33A1
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 17:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E210E241;
	Sat, 20 Dec 2025 16:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfDymMwa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cO0F/Yeg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F50C10E241
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBPDQA3197791
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v6GNQuSH/qpxPrgBm42fdwp7
 zr7vPXWJPpjiuOQ47vE=; b=SfDymMwaCU9x53xejNLTJyqgVJm9ccK7FPYh1msk
 JXyAMSoNPLokeJNUwy5sO7sfLcCA5R7+iVYIcn1FQYMrseCRN1zXyheM+FgiE1vB
 oDLbpSXr27arxLAR1kRMf+/7p3fVtt0IfsLuIACXq7xbgHqkhTHwwnMtRY5f1SF/
 ZjMXISCHNhQByEhBtdB9kniigxNaAUiNkusbP/JMFDj+9okThN8uZpz9ArJtKO2H
 ZqcpO1P9cApZN0SL5S04/xi+dwM4mj5QdCuyQ9kOD5NvX0v0XAlqzbCishLwCC2c
 RPEw9tnM3FrPgQRVNIoDc6iwa+xhUVW7cS1VhnYklIGYvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36gxuk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso86992761cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766248860; x=1766853660;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
 b=cO0F/YeglAlxCsNOtH6cbnAcy9YkoXvjHuMiIWZ21V/dC02ae9lbLEamPNvoRgFigm
 7zOjtAi3FwCyn/s5YKjpgvaB1J+Y8bE5omz6fFXIzpCB5mHjHM1pHfBeXlVxjV+unAGo
 3KhkpU7fPUdK3HyT0E/0F3yxDXCGEh6gzekUR+c1ck5/3ve5YpPoUkupFckVTc66xc4d
 ZVm8DnAm0WiyHpXch5Q/s1c3wC8nhNmnKw09LJas3ZNKHIke4ErcYyoZkehVZ+dPVRbE
 EFrzN26XpzSun7j5zS/Skx8jaWmhh71b84UOEbNVTF5wDSG8uoiUuxfyBQFkmdS/yqj3
 ifVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766248860; x=1766853660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
 b=LTKuWUuyjF8Z9D9ili0sq5uD8G3Op/nrwnETedaJzkCIiBfS2E84baBAGupD4N4/Wk
 2wdpva/+DKuEvvecfc3boX89npdqiynNW8dlgkskJw8uwOuxm3jYgHHfqmcfKVz37neq
 dCTIBLXox1FQSBFW5hQmPp7jOojwTEisxOnsMw5UYFL/jNipGJa3FZ4gJwHVwMtpL67a
 IVnuctTKrz4NXaBYq2Mz2pHEVpW3j4nxAldp2ycRRePWIGKszdqUerpmuw++9dOWlWqc
 VtacE21EcjbHaU9PdGS+8MYkXQ9esepPgZ2W70+Uh5buahJ1CWiCRMF53BLg7K085wgC
 q2qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRFdd+3FrJI30MWYPBIlVsqcTOkZ2bJE9S3056mZ+sc9JXF4LbaYiS9MnCcXtlY1tXR/SFtbZaUeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPBqqT9WzpmwGpnAu9YxX9fw821frTuu0wa+y5LzZOdtBMYkrM
 i+y+RCK9pKkPTfhH2RDT9UnUlGSPYyE89a64jGi8i8Kh6cJxBmY4Bk4+psUwipJU2Aq23zLfGlf
 JVvAMFNMx1loi/WyguMKOMBg/iW8BEHLnOcE/rLP9xKeN1LXhl4hgoa7M+RdhNlDbWSovvjo=
X-Gm-Gg: AY/fxX4B1MCrOJq0MkHNALE8sUiqDavSHRJMAAQQ6O6lyKLP+vIuYhs1uXhESsCIdg/
 V78aJvcbzOeMtXgKdRlYjnvcKEkFmNjDQ3ZEDs5MCucCQ86kQbnpNrSQ9Q0u0dAe1ySQUM1nqMk
 A5A9sYtvLSfYJAOs8QC4i9+2GsXmn0Db5fDLyBLW4xgUYrC9iv4IgpaZqK23LIgtQH9hTLDi7qO
 TjMwRowTYrEz9hckDW/sGNyodL39ogFmfk2kiunMCiiJgUOWTKdawqNZ0H9hGcv/TNwZcdKD2Ql
 XkblWTZzB5y8wOZlrS38iiLwUptj3uwYcxiT4HfZKkszOcrGvIz9PjKzj2YEHJXgi4O7ELS/uEz
 QTALzQsRGT002ge2Y3UMQXkBA5967I3sRli6PGNxHeeQW4F34zX3kwLFFttB0QzO+UOjE8TPdJi
 Po5sK0u8pzyByS7MQyU/gTxhU=
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id
 d75a77b69052e-4f4abdcb97amr92050351cf.81.1766248859884; 
 Sat, 20 Dec 2025 08:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1yrfw0nPqMO1h68f/V7vtTzPbAM11st4i88h0pn9nPirrUnZ2f67Kg7nuyDy8LlO+k3wUVw==
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id
 d75a77b69052e-4f4abdcb97amr92050041cf.81.1766248859457; 
 Sat, 20 Dec 2025 08:40:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262ccefsm13123671fa.23.2025.12.20.08.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:40:57 -0800 (PST)
Date: Sat, 20 Dec 2025 18:40:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
Message-ID: <krmtynkrnpdmunksxwntrnhsopbv4hu3evv5hanm2zukip7zy5@tqtyscekzqfq>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX8im2wDC2kLaw
 Lw0QR7sBU83cVBntslBH5GyTw2b8HdiiRtP0n/lo2Va7VMfunTZw08vbUSLfiPLwkhfC11sicBL
 xT7vh8vAn4nBK32dwlvsmXfE+/4CLOsTN8WtwdGvvhNAg2Yin4fAdFqrD98xLVjz8cBc95hEVmJ
 Y3t4T1zu4YS9c0rnCIm20tAo/yvD7ZG3FiuXDSoGp+IuFTAyWjMYIVPU+HECxOVgx31wNxKg20h
 dKzgIcz/51OCw6i/ZmlMAfvKXwWzw+Fp+XeBlFSvNpEyXB6JNV0xGSDNp10IFTCLw2LKGutahhy
 jDpfMK2w62bvry5A7Avw/Q9SliugEmEd1RojD8c0cR1AP3f6ReccyO1RIuikw78zSmvx5SAPOZt
 uaTSrnvhU1TS4EIUE++tgPFpVfED2mwUyyVOHP8QQvEqL3MK45reqbYsfeu1zCnaFll+W+DQcgC
 zgMCe5wev9Tkv5WVAVA==
X-Proofpoint-GUID: KpfLjiuTsOATzznCq6QShly-ZH4KVQRu
X-Proofpoint-ORIG-GUID: KpfLjiuTsOATzznCq6QShly-ZH4KVQRu
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6946d19c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lw3N_3V8nENtiHrPz88A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145
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

On Fri, Dec 19, 2025 at 12:39:01PM +0200, Abel Vesa wrote:
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
> 
> At least on Hamoa based devices, there are IOMMU faults:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]
> 
> While on some of these devices, there are also all sorts of artifacts on eDP.
> 
> Reverting this fixes these issues.
> 
> Closes: https://lore.kernel.org/r/z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Fixes: 5978864e34b6 ("drm/msm/dpu: support plane splitting in quad-pipe case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++---------------------
>  3 files changed, 40 insertions(+), 110 deletions(-)
> 

-- 
With best wishes
Dmitry
