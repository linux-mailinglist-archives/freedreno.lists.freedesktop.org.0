Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0771B41A2F
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD95610E124;
	Wed,  3 Sep 2025 09:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsQoZwdU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2450410E124
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:36:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832JLd3024133
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vSerlDJpxvfSadnBQ8QnDpTg
 YM6Q1KNBUaEKDfGqWbs=; b=UsQoZwdUapKoi6LnOo0SvJ8QMQCSFB4ulL1jZemo
 tP37+zgMx8Qeu8cV8rZvtJHoao4gHv+iZkAkGPF4XoSq+zTsG58FAkH31LnWC/Jx
 cmEtdiaPd78FUUhKDe0zjT9Wu8lE6f+AYIVMvge5i04FSJUqNMu+ptgfaD925loV
 RoWPad3TPZewXw4RHTjDdnAtVlv22ltQIYBYGgfrWhvUVPQy272YqsXIvnNHGrVL
 p3utT1gxYNBL+fEKtH4jJbZtNO9y0zYb0zyCWIe3lzV6MhGtd1+Ilxb/5FW6uQ+c
 FpYQabteem1iWJAxECYcd4IzYNxycDC5UK88myah5tFJ+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32wxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:36:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70dfd87a763so71253566d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756892161; x=1757496961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSerlDJpxvfSadnBQ8QnDpTgYM6Q1KNBUaEKDfGqWbs=;
 b=m3TmUB4+QbiVdcspRIg2B3e5u36SAbFe/zmsGxvGfv7wXzyIrIMvaFaT5trJfvi/Oi
 TuhITgZ3OKYuGcfhq+Dfal3M3zXzO/qLLuVVhiYQisVbUrVerrV/WQzP3LWHrmVOzV4K
 lg1kcUSHeO5CP6aXYFVky4i2rUzolG27jywuaR4IeYqCvIQ1Zdi6TrT5pz+nbxdeZn2h
 416oNr5CC7d4PhaJhvaI7n6TvHE2phA05frBdYZPmkjdlBpROHq8GaiUQweWzEjvzZt3
 hcFSoYOd1YrJ8IS7HeQ4LsBRa6fpk/HE+aOhz20xJ2rZT3yLe18R1Unz9MfCoMDFVg64
 yqKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlTNOFYhp+ptZkh3TsIS0/hwAQCxOF/zz312iJEXdFhwl45QRb9LaU3KtkKECaAlVCacvMeiTi7dA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOI3LW/Gq+gBu+Vo2IYMgrA4ouhAsU6L81TGFmOf97yPIviZK4
 slq6WEV80Cai8l0ks9ye7rpDHazqDntjvWWb63FdXBu4CRDXZqeJHojTv/6jJgmL9B/kmMjIye7
 N+vWOyk+nOs279HbnDbCvn97CZ7xRDtOcR+YBZwHKzIs5YGRXAluTqKKPvEAjdPMecbfhdGM=
X-Gm-Gg: ASbGnctJkmLuEtdq9ZhsRfdmfRlBlT3kpJtPa5J9zrtXw8o3msb7QaTVFp+p6g8IFtm
 sRvg4vxHlnSyxM+2N4h2YlO/JWSDJKhXnEqQ6LOIaFWMflGF9qGiX0PesPmIrQQBh76CSx0X5yA
 nRnEDfFa0RLbqBxmgK/wgGBdjVLh0z1Nb48r0IW52qlRxBe9GNenq0PArhjLbyWmtV0HsGrcXaV
 ILi9ZPh+wr7GAyHJkhZJ9FQ98Tx1F2tN1i9KS1yTRSDs7ioHWhvOFhI+/9XYUN8tpsLDfx6eLjB
 NrNxnUwwut4V7ys0nTN1QTtpaS760h8uLfhOvTC17zUEaA2EwhT1pusbbmG7a7TOKwqrQ9LGwBy
 vhKuQeTmLf+CxDtcKirnGpuPJW5xQXJLHbhiNbsO+sv3KRBRh3aYZ
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id
 6a1803df08f44-71a5b143f14mr94106796d6.42.1756892161134; 
 Wed, 03 Sep 2025 02:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqgDTlX6V0CHb7DNRDOoeNqxg6UWnd6OmRx0Se3MK3/xtEY2lCzdiwyL/yLPFBz7pz69sN1g==
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id
 6a1803df08f44-71a5b143f14mr94106496d6.42.1756892160620; 
 Wed, 03 Sep 2025 02:36:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c503d7sm9027131fa.11.2025.09.03.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:35:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
Message-ID: <oeecjgt43z3pgt7eaxat32vk4sch2h7hp3ibpvvw2cb2mognyx@ft73uzdyiq56>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
 <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX5UzY35qCLcf0
 zCOZ/qhuu5wQeR89Fjq/bg+SzAHx2CPpihGRpN2oP7HvKc8xoEmRSCp0GZg8ZKeTXCEtecFZpK9
 pIDmn7Cye2hdRRL+lpAKT+7/BxKSwoU79WzQ6xQpPeyUxRMy+R453OcLHYtS61wB2+wnUQaipTu
 quqO5KCS/fsSmKEkhXFh0EmeEuG3/S4tD2ClTEvz62XaVej7YMq4kYXYS+lUugSu111JduK3GVc
 /nO2uQ4789khZeCLP8ukMd1MJItZLousmSrhCPFOWRxwel4/Y5v5L+e7x18TbDg3Epr1qq6xNqG
 66UXzkh3fC89oablwXui9msL7EnqFLI+rbLlP+L1ATHAaYejhAkzGYZDBhKkXLrwo/scrlcqxHQ
 XYIB7/Ky
X-Proofpoint-ORIG-GUID: nHO72piVgYssVGg3EkmuWRi_vvY-phO6
X-Proofpoint-GUID: nHO72piVgYssVGg3EkmuWRi_vvY-phO6
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b80c02 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TuRy5nDU7s93I7UbW5wA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On Wed, Sep 03, 2025 at 11:25:49AM +0200, Konrad Dybcio wrote:
> On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> >> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> >>> During bringup of a new GPU support, it is convenient to have knob to
> >>> quickly disable GPU, but keep the display support. This helps to
> >>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> >>> modparam to support this.
> >>
> >> I'm not entirely opposed, but slapping a // in front of the compatible
> >> in the dt works just as well
> > 
> > Which requires rebuilding and reprovisioning
> 
> Fair

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
