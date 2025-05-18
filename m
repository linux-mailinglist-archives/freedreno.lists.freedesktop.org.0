Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A4ABAF4B
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68010E29C;
	Sun, 18 May 2025 10:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cagupj3D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296A10E29C
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:32:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8noMc009984
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=; b=Cagupj3DupOaDdl6
 hZIHTICpCYogEUpG17UOi7aniNW9zbtJ8S0B/WFJKxGBujRSALz40kNN67ic6Imb
 dafeHScYr+SEcsBPMejJ+zgPXIXnlKRnwP1STx1djW7IIlJl7IUw+5oPB5J/bzb6
 ZsvFkYLDfF11iRCuGNAwkf2wf6NBJ9lxxqTSdZhOOJdY8l8CvkgLLANKhK6W2dGo
 CBdBJXZXsW2N91bQjdZKPJVyXiVNPkeEoU6tt7mW6t+0fd+o6DWDupPeWvuEGfJk
 d2hsn9F1ZpxgTeHBorfPP9RWlPbm8oZMuh9vlFsKtdPsjwjKMXu+mfITrA2PHg8Y
 xYoukQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4surq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:32:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so17865186d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747564363; x=1748169163;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=;
 b=car2ynH5swOAhOAdYffvUAC14ix7E6mAcUjxMkZm7RpfSu3MhD6oTkgPd1xHsQtg6Y
 Dg0HOeUqFiGPIixm/CPlCSNAMgkFtGDuq8AZX2KsYr5nCcI6PsVIlftZ3eI3vBFqWil2
 Y4ifXMK9ozKukouMmkDnuFJOBHwY0wOac+wn27B3x4ato8n8FH6DqWah7NGYU/dlA3oe
 2bQUI5i77zDWli2FqeFSWFF23st4lEMqkjzDS2eTa4UW7goMJ3cYEmp0PEAlW3Ty2AJJ
 XE1fNe4xOrKqE3+rks49kT3HrIVh9roZvlW1tytGTPvHXjdr0H/Cc9BqYm/Y2SUnsbOA
 199g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeQM3QOjTJHTq2wxIy+PScmTGIZdPj5buvO6uDmQh0Po+WafAJ8Fa+iW46hvCeMBJo25tgidrPnUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTBCyRZPgcHKvOZ3wf9Ov48QMougRipx9gXe7FXbALgPfemTIW
 2Yg7qASTS5/X6aMDNhkOi8cADemFtqxgFqo5Q5uae44GV+g2hdvqOZ9eqFrbrVHeNwb2pMOdqxW
 GyE0JfmdGVyBVpN9WSMgtCBzbcWDWdOsyqqS0+LYx2YifZYTg2yvZ1NN9MuriPkrTUyL1Vt4=
X-Gm-Gg: ASbGncsKxqSvY9CZP36ZUobdH5bVJ8WFsEmYI4Nc+kyt5f1dzqSoeMlaUMSGNOBdvfr
 hyqrtd4FbQ3iqHYbH+CgzcDcUA28zQ0K3LuUBqm9YdNyJgqjXTR8PLMtJnDylpfeeqhQtg+zWEW
 ryWhghxGoW4vvu3xb+9oPfjPrlfrxW5erwum1/4Rrjnk+UjQTW00PSpH+d8XOvzSb/WRjbI70m3
 Q/iG9urUtdf6sBtJjg7BA/o84cleEkggbZfg3C3ilnV1GkGMR6xD0Ylv+jYBwU4NgiqCeXhZJfU
 o76xoGMe7HmdnqEPYMBhE6yoPV5WnRO5Xw9Qf1qMEpSP6q2I0kb4Lrn4abcgUyKmQmik/QrKDh4
 =
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr69977896d6.11.1747564363369; 
 Sun, 18 May 2025 03:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPoFsBUaDrnwOXnuPwNlAF6cFAuLO04cfaVzqOcUVBeyq/FhbV/KeXlfPcZ1p20TjPJxmqKw==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id
 6a1803df08f44-6f8c23c82b2mr69977686d6.11.1747564363030; 
 Sun, 18 May 2025 03:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f161bcsm1392553e87.7.2025.05.18.03.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:32:42 -0700 (PDT)
Date: Sun, 18 May 2025 13:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
Message-ID: <b7zkrdxmigz3bmgphedzoosgesxs3y24wgi4l52zf6r6djo7vo@aupsak7d6ma2>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
 <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829b74c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hVAVfT_TPH0Tf30rILYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: JG4ohxWLGK7pVuoXyyPN5sz8i-zEVqDz
X-Proofpoint-GUID: JG4ohxWLGK7pVuoXyyPN5sz8i-zEVqDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5OSBTYWx0ZWRfXwqMUhxKnSmN+
 XaIrUbQVOKcGOazSe37zLYiiNT3V0+7m2nqOl3c23q6wcZbMc1ZIsyOWxQdaZ6zZopC45gui/4r
 wtcATlQDCtb17k+xA+22RyWD6TW5go4qy2KOaA6fhPK5ukWK1aXvj8LvWW/2Lg/yBGLgFne7BkM
 C0MYU0EeCZ7t9625VWNVS87F9oUK2nvaQ4tfK293drvVg1kkEKeBBdMuOHVgNYWgEAIdQo4c+lK
 ixeSwI3MYqMrMstgvpcRF35QDC3/PiN42zu0h5hvmORg11c+QDuU/T2baq+BTJ+Ov7OQwSmE6lF
 obY+oFPPHufT98hTvaWgWp/u7yNAXvg5OWeWPgmTetnD2iz4xxX1U89em//sro3LpNq2mFopwxc
 nuMAwuRgKX4j2ey8Aik/ioSiguDzK0MtTCY1idTtfg/eKC/HKLVj6RRRBgSwVJ+R3U1wJosw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180099
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

On Wed, May 07, 2025 at 09:45:26AM -0700, Rob Clark wrote:
> On Sat, May 3, 2025 at 12:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Some of the platforms don't have onboard GPU or don't provide support
> > for the GPU in the drm/msm driver. Make it possible to disable the GPU
> > part of the driver and build the KMS-only part.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig           |  20 +++--
> >  drivers/gpu/drm/msm/Makefile          |  14 ++--
> >  drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
> >  drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
> >  drivers/gpu/drm/msm/msm_drv.h         |   3 +
> >  drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
> >  7 files changed, 191 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8ca9da44c68250620 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -15,29 +15,37 @@ config DRM_MSM
> >         select IOMMU_IO_PGTABLE
> >         select QCOM_MDT_LOADER if ARCH_QCOM
> >         select REGULATOR
> > -       select DRM_EXEC
> > -       select DRM_SCHED
> >         select SHMEM
> >         select TMPFS
> >         select QCOM_SCM
> >         select WANT_DEV_COREDUMP
> >         select SND_SOC_HDMI_CODEC if SND_SOC
> > -       select SYNC_FILE
> 
> fwiw, atomic depends on SYNC_FILE... otoh it is selected at the
> toplevel by CONFIG_DRM

Within drm/msm it is only used by GEM_SUBMIT code, so I still think this
is correct.

-- 
With best wishes
Dmitry
