Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B0ABAF3C
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A865F10E29C;
	Sun, 18 May 2025 10:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqYmtgij";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CD810E1E5
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:17:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9H6L0013771
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xhP2SUjlpvQeAhCQLCmidVhe
 TvgcNKpIoIA/DfNmF0w=; b=aqYmtgijKPblFq2cjnFlErAz+xLO8o76zBtq84Ey
 la+rOgsOL8EX9MRiz/0iCCQOwjc1F/zhnepbT7Sei80RzXhxDebmiMjvFZBG8T7z
 8ie0S2evStccKTK+8jPrHmUNdE3ypmM3ipv4MThgKjcfF/bxWX06NHRd+eu5yA0L
 3MqRFYhSkNO+Zd+H0qR40nANgLa4w89X920/ntIYSHrKSzCIlcoaFGWEfv6uiEDp
 OvID5V44n5pM090M1QltDdYZtANQV8mpOWwHJAnQg0eM2H4RfxvkRxMO5Jn5IM9O
 X8oHMAAl5W0RcrYaBIyZKYfe18lM8TmujdGbB4ibxqduig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjssty2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:17:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6ea9b56c4so62784536d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747563451; x=1748168251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhP2SUjlpvQeAhCQLCmidVheTvgcNKpIoIA/DfNmF0w=;
 b=dOTtFPZB9OxNQAQaMRMovTtzvNWyEmeUnCGqSjpd8b2myYk+JBd3dh3lFVUMW+p/aV
 v59P1H3tBIC+4E2JEbaKK8nOL0ST3t5sj9jIfxsjrTxEgAxhLVYdpRC1fgOzwL9haYMb
 J7vbkVP6/4Nt5pDEeTulq++LRt4JFaIwmCDrDZIJ98lcFwwl7Bn+1bw5iYQMATg6fa/9
 2v9DdwiDUvdXoR2LvQsF3HMfORMNy/yawCwb8RJyUx3gNZszIyvxxVVx/9DmP6mq73B/
 ggPQiAn9MamQIYPdGKqm89aJ07mYS6oZbbMyYIUDKzI9J4MiiR5oqAYP9K71DGMi8GTk
 r05Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhbnqg3jikAT3+2t6maDuA7Vemh0l9fra6kS95A80IraN2W+B8XaeSfWJQCKX6DUKTq+o5DNCp8C0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqXzhGpYiDHUmuprE67nCnKOZ43j05mM/PnBZBKX6v+EapnfJb
 2gXphC+xjOybAJxxgD4ahjsT8vE/QJPBg8LP00TZDyyudt6ILI78AROksd09l/UsuEYBvPdiX6V
 Rb+VwpwWc93oslBlou50QoKnRlvPIeXTIgxrlk52G15SNH39Fwy97Rgao/kRMGvfK1NfejI0=
X-Gm-Gg: ASbGncvTu3MxtzcSBlVRlZxV9qdEbZn2QPg1nEBdXrOcUp2rJBRPLZpTFxxuIZD+bPa
 jENZ/j2R2K7Jrit9ozRa2/w9UTQvvNVLeYkQ4eltuGE05BU9bHvkg0B2Y0fKu0qX8Y4LorRCGlr
 VRrMzTh8tO/PHMkBu149Dx3AR598Zmgy04uczNtPUmZ2EHEM1cPmOpUywGRtAbiw9muVYoB3qFY
 HgnNXlsri6isqKlljx9eV509bcrw3CSZ8ahHEEbuj5NZsa5DMGpEKuJZLnVPCBd62hFJtiHjEgG
 n9T5qUYjNdArxLUZPtKlfJDruPNbvHJYGLcHHWoP4ESv3OSnPKYnLOTivo3YSHRxqEjrjVVFZnE
 =
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id
 6a1803df08f44-6f8b2b67f15mr145182236d6.0.1747563450919; 
 Sun, 18 May 2025 03:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/QdroMCAgOdxUn8/7R10XW9Bp00ARKToH4sQUo+1oHi7NcXV+IvTd0N1GOa+Vj7DtOkw51A==
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id
 6a1803df08f44-6f8b2b67f15mr145182006d6.0.1747563450612; 
 Sun, 18 May 2025 03:17:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e8bea4b0sm1319372e87.19.2025.05.18.03.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:17:29 -0700 (PDT)
Date: Sun, 18 May 2025 13:17:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 14/14] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <dwhxtakgpjzd54krxqxpocpuwrk3cgh7sfiel4thgawsolo63b@ty7me7p6a3lo>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k7PHBHpLbtBvBYMHxliklqMFexMkbAU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NyBTYWx0ZWRfX1F+xVBaFcOm5
 g+gAX5Sp7hLE1oAcULfmadBO5Yp0N79V6eUK0qvH+Azt4/tPzLoObAjjAsF6M8gz3D4IcecFIXu
 MBBXsXwM1lWvSnBTo7rPowLmR28CCHxEscIVlJFwjjLFm32VfASacOuGmOfNS0XBAjdEAZB1A5Q
 yRWsdBF5rCp+i7tj4XgSGD9QBH8qpUMW0HlLk8F4mAkVXi1WFa8drMMzmU4BHxlCEcq9Bl08mSP
 FGgPnyeMkR219f4URuXLDbJ28+9Fq2Np4ty4bq24vt8OtJzSM30as1so0gBJimX0Oof+qTsnGiS
 k5NsoAE9kOYQ76OEI2dui6fWQutSDfyXZjSsdO+udg3Pw4gnGuSbYjNlsV+/GWTo/SBT0hUntZ1
 IGqWkfscyG+lZIFLaaVjUezX0n2WSCbVz7y+SNaFDIyZBr5G+MX3OhAmzj8i6tOOxbDrhSSZ
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829b3bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=dxQFKmM27UcP91gbFjcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: k7PHBHpLbtBvBYMHxliklqMFexMkbAU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=906 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180097
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

On Sat, May 17, 2025 at 07:32:48PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 76 ++++++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 +++----------------
>  4 files changed, 60 insertions(+), 87 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
