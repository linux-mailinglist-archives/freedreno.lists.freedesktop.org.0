Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C58BABD0E
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CA210E289;
	Tue, 30 Sep 2025 07:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak/DaJwB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8D10E506
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:26:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRt3026871
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=; b=Ak
 /DaJwBmKTwW3xCru1IZ19Bx3qchaFKy4WY9jpPbNbKcGYQGlfHSvI1ZU9YSbT3wT
 jKnXCp3NLSNDeM+BZ8pwNUCAspsTnZ013ZmAumkXntu9a9E4uP/YeCo3GMkMoVcX
 3ujKXRjRN145HCmZjr//WUOyVhVhw3zS9iUCVt12OgRpA0KdnL2zzYuu1X/YMzUU
 OZ8SNVNBNZA/Zu2+fPQC+v8XVuoDRRKh1//bL4vbEP+ZI/rNXFJt59TRICLQ3l+c
 j63z0V475fTu89lVoQYzJnJp1gwlC7MlRVNpsTk+PlYXsH2rvYb3FVgadwqeDuS+
 vyKEUcBKULsUZ5PPUA+w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1mad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:26:07 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-331be50a857so10094993fac.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217167; x=1759821967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=;
 b=UGn5KgdNNE9/nlRHx1xoidIXE57/tJAE2HS/yk4foNXTiPGeJeEoSgvclc/F3g8ljf
 /hf4GPjg5SFFg+r0v9B0uM3IA/lrumJvHx8MxKyyJ9lbJN6wbRxJhPZLO8YmXh5vhFq/
 dLJyb8pvPDnGcmzX/Bgw7xl6v1Ws/pz0H5G8yTVYSLZdUWZWirhgDcp7G7663lp1/dwt
 G3yRr1e871uc9G4J+1KQT44W8OL896iYeiZ++le8u89hnCVBMdDJWW6oo00U/Ooirx47
 opvqCymSBbWYhw1/dTVczWUcmXV99er66Y+TC5xJ3iSIeL1S8AyfJ7qUDSkOo4oAEcRf
 EIIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGRqIvmJxIhUaRwxphOyZvcn++1Gs/VhyGr2v773ymWpQpAAuAiV74ULbuuEUw7oB2xZNSwjK7NNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQAb4JhXOamKQkk/UDGrUpY++seRFj9TIwnTO+2jTsYwlBUhZb
 FMVvYWKe2LBsfEMu+WqnWFl1VkMiobtKcM4c5shMxY30oRWy8CLMmOS0njG+mPoprzPjZU2IouB
 ELvoFHh/Vk7g48mrCEqd6f0HXVfDF7rBle0Mq6uVGVC0nDUQ7CFHduEs+qTl9qQgk1fr4uVyvab
 ShsNMNmR39GvzPodmqXjbIxuXqRXcRISvPDxkNVoA8yl3fIg==
X-Gm-Gg: ASbGncvwrQC8MCwMeHV0n1H4MJcfL10V0Ycebj3fZVkdq/nkMznutnQ2bJFf5kQv7sS
 7outgH7U5ElUnJqomNNWJ1ODiBfHnfuNk4UjkP9goShF+g6KykXviZPlGcCH+vv92LeQjkCxDUR
 aW40ha3op1fObYVsd1V+9mSeV/5S/6eYFugw+aO9JY6vjFZoszshy2Rhs=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id
 586e51a60fabf-38cadf744d7mr1709939fac.2.1759217166909; 
 Tue, 30 Sep 2025 00:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpcV7QCeOoB82oAsfyshYDoFlRPDZXQ5WvKfJlIGOQR9mFN5O4/G07y/zEQHyHa3AJYBNUcaNtfqPGXVCGfxk=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id
 586e51a60fabf-38cadf744d7mr1709930fac.2.1759217166525; Tue, 30 Sep 2025
 00:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
 <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
In-Reply-To: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 00:25:55 -0700
X-Gm-Features: AS18NWACYkWNYimh8t14gY4Dmrp_AbVsBXT_pDvjcLAcFBgJJlOrGd5Fr1oHJ8o
Message-ID: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: U1IoPeRPOvWkDYu6Pdi6PINc96MpaG6D
X-Proofpoint-GUID: U1IoPeRPOvWkDYu6Pdi6PINc96MpaG6D
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db860f cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=2l_kmpBevnkUXydlazsA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX08kZ7Hvo+P9B
 PFC4Ccr+aQEaKQSlR3sx/DpdVNg4n4pqsgogo/74spt4yv5xh6CmV+8jWX1YwnPiGwQ/4B32hK+
 fzBr/HcHXQbiiWRaVbHOq07lBdwpMqh3wNmg+9SISM0aK+makxslJc/Azlbxd6jQAuafF5veAl7
 p7N/JSQHroUQYvwo/46gyJe0N4pihWa4Zjs5GwiqyS3zMlM+WQitZdLc987EHXepyThHdeJ7JNl
 Vfs2+JFGX9Me1H6hGhBqltg4QMxh6kM9DvzVoF0lkkiygiUA9lN7fDdZP5F5qr56dCxezdu6rC7
 /iK2xojar+kZyy1MvKqMGNs4SQBMFe2QovQ5BVUUO0WU1EpNI1c6cTkvtnoSr0lLuR08JnwsxM4
 fi0avN4himsh5DhhSdU15Skhadrq+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Tue, Sep 30, 2025 at 12:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > PIPE enum definitions are backward compatible. So move its definition
> > to adreno_common.xml.
>
> What do you mean here by 'backward compatible'. Are they going to be
> used on a6xx? a5xx? If not, then why do we need to move them?

Newer gen's introduce pipe enums which do not exist on older gens, but
the numeric values do not conflict.  Ie. each gen is a superset of the
previous.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++----=
-----
> >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++------=
--
> >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++---=
--------
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> >  7 files changed, 617 insertions(+), 613 deletions(-)
> >
>
> --
> With best wishes
> Dmitry
