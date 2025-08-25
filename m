Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B39B34943
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0410E122;
	Mon, 25 Aug 2025 17:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+3ViXGD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED2210E122
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:48:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHUXlj021029
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=nlZ6l0ssjdjfHTENsYE9UwmL+I0iY355kH62DG2afLo=; b=E+
 3ViXGDxUfU+t+KyzPJy/Za2sSwW3Od5VjEMWqYVPIAWDanl0ZHwSnyScShfKpfva
 APfTV6wqfYR2nyFgt5IOhUMpsoyJerdpWui2zTky+XUGkmkQcv72zvBDMoMfNC74
 6wOVFlQU9KIt4/W5KUoATuGyOoG8HaS1S6d6kwc66OsNMFaLMSpxvbO+k/FM01sv
 +feV78XObMHvQ1sz5WUzZBrsrl1fZHUwwGwLMsMZSCfO+P8YEIR+k89L5UMUzeKW
 5XOev4qTDWkRo7B0Bdwoxl6sExKqIfMBb2s6xAujuu6FNLQy8WgL6WXK+dc2ZP7k
 HTaA5YnI8PDsMCyVz3fQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x860bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:48:19 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-435d3df945eso3861064b6e.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144098; x=1756748898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nlZ6l0ssjdjfHTENsYE9UwmL+I0iY355kH62DG2afLo=;
 b=KBY/vCyGpfbU8gsVgYOpFhF+MnTRbw4qr3llyXyOaSaNf+1XuxRvn9iYM02uVpjO8J
 c48YJTTfUofRomFOy6yanfZ2Jvsj1rwn6oLyL8vMfSLvyX73pqdpid28ZO7Gi9StB35n
 bPF8BShDIZaoUANgxBHHCzufF94VssI8BCdD5tnrO4fLGlf9PLcGaRPQ0TMm+cZ52dNB
 wPNa+ocemEX8Tk+3i/2sj754+eQzEzbUuQFcjQwLnNpGg6uLmK20ka1yIBSvqcJy6wHk
 zRRWUeTJO9d4qqEC9RsaUxZ09cc4y2svrJLelLMTVOl6Sth11hA1hkdW7H6OoE7hsfJS
 jFBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk9SsTIYJ+YzaLUf11deeOGP1XN/D82Y9yA40DBu/hgQ+wSb7OoJfcrA70oISlVA/TSoib8NhN/ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwArxvbomXF2ZCQJywM3qGKdtgLVp8F4zWhQlMywEPsEGvsBopo
 HW1TAEGw1sXxxvX0kE5PqkitJZBLOj4qjRVX8zqOCwIaW7ZJrsnXcGOwAZmtBnbuChaGc9+TqBF
 gtjM6L/5gHvacl0jiVdNODZyhNWWB3ExamjEDghCZN70A4+Akl7JUL+b+hyZYGEWO90mlxHH6WQ
 C6GjgCghKT9vx8pD+Wqu9n/vgok2yz7sMO1hghfbV0SVyl6A==
X-Gm-Gg: ASbGncsQQZ/hghGyHlSR1tGy67pcgJuXc9jYaNgaPytBqGs5Dl4ffqSnUMKqTshDH/r
 utS75LiWrQg59n/ggQyfJ1+yMA3y7mWhgCZ5OI8Bjg3z1Bf6DLKwpl6TfyYx9YYioOMxyrpgKn5
 jgH/e7/+zOfmJDWPLO6hlLw0l6d7mgCE1+vyFwTsmpzkUV74IyLui3
X-Received: by 2002:a05:6808:13c8:b0:433:e8b7:14b6 with SMTP id
 5614622812f47-437bdf0e80cmr282264b6e.7.1756144097975; 
 Mon, 25 Aug 2025 10:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHj2ggcpr+YlSukAj2EV64noq+YNIxzuZKThfwMzS9An5ffGJUhIvvJMvQa3taoYcsJrqvCQ0puzQTE/o4Dfs=
X-Received: by 2002:a05:6808:13c8:b0:433:e8b7:14b6 with SMTP id
 5614622812f47-437bdf0e80cmr282235b6e.7.1756144097518; Mon, 25 Aug 2025
 10:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
 <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
In-Reply-To: <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 10:48:06 -0700
X-Gm-Features: Ac12FXx_wnGonddny4hsq7SnyhgxqXzats4o0RqFyvkik5Pg-P2HT-mz1CypEoA
Message-ID: <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: b7VL_9Y3ny98lCSQIxKEdVLY_Ove5Psa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXyl+kQC3cZqsp
 cBXlmCWkUbtpnS+oF4Q7OHjjp+aT+5F5K1SJ84KMU+mNDbDM5V8yrRsVW9jgDwgOYiz2aMa+URd
 R/CrrasAAzTygcA2t2U5vxQJSvXPCIxgEuUn8loMjCTPkSSfTjorNDkdoTNQr/42GioqeLujTMi
 lqPBHp5ZEiRzyg9Qu0incMWjTKlBBNJa+o8dOGaziuRzH68RBlFsEFxOBopG8SVQtzt33Es9LAb
 kK+vRY9lvOIeVNheemXv63phsIduOx8oU5sazjXBxKyW9y7YtAeBnUa/8QVVvxWGZLz6hucUXS5
 rg6WGbg1ogGT41V3MIjNT4/AsZe7Q0PIv24pjCvSasaeKhnu1b+qdzuFd8ioLeDJ5xIrVX/2vR7
 4uYqW9Uo
X-Proofpoint-GUID: b7VL_9Y3ny98lCSQIxKEdVLY_Ove5Psa
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aca1e3 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=4ku08oyGyOPXMIowQNIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 9:23=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 8/23/2025 7:46 PM, Rob Clark wrote:
> > On Sat, Aug 23, 2025 at 6:49=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> >>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> >>> before adreno_common.xml.h is generated in trees that generate Adreno
> >>> headers at build time. Make msm-y depend on the generated headers,
> >>> removing the race.
> >>>
> >>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> >>> ---
> >>>  drivers/gpu/drm/msm/Makefile | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makef=
ile
> >>> index 0c0dfb25f01b..1a918d44ac48 100644
> >>> --- a/drivers/gpu/drm/msm/Makefile
> >>> +++ b/drivers/gpu/drm/msm/Makefile
> >>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
> >>>       generated/sfpb.xml.h
> >>>
> >>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADE=
RS))
> >>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS)=
)
> >>
> >> I'd say, no. The idea was that msm-y should not depend on
> >> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y=
.
> >
> > probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> >
> > In the mean time, I think we were going to drop this patch from the IFP=
C series
>
> Yeah. I will drop that patch.
>
> Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?

I suppose _technically_ it is, but the split btwn msm_gpu and adreno
really only made sense for a2xx, and only if we tried to upstream the
old 2d core, which never happened

BR,
-R

> -Akhil
>
> >
> > BR,
> > -R
> >
> >>>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY=
_HEADERS))
> >>>
> >>>  targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> >>> --
> >>> 2.50.1
> >>>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
