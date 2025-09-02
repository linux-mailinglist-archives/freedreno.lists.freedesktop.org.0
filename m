Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CFFB401C6
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 15:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A1210E1D2;
	Tue,  2 Sep 2025 13:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVk0WkuS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B3F10E1D2
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 13:02:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B53JW027881
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 13:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DI3pErojxmIjWUczxGnCciKc
 RSBlU9zv3W60qXm0b74=; b=oVk0WkuS9zYpad0XHNNdHabJFeXiPvZUPFdKCJO6
 HMdDXTUACzAEeFOb8gY0swD57tVFGIuhD6oKhMewG4dZB3ImivQ4Ha26EEwrl6AC
 590Zo/KrpPYQBQUc/3Q2ZYrVXCxpHawyi8QepRySbRTKeyp4AHX2bxGHnYAHA+jn
 4kru5a3dBtY97MJ967fzFVD+uWkS4kCjgFIc9IP4/wGMjGypufD4sRaXohBd9wa2
 to2ujfqfFyZb9cwEqcHJApvcd9YrFnBb3Bp41Rs5kqxWi14XHCxB4C+gPlHrHmfp
 EiWbz/xvTDhZkn6oyKOROSjFfXzDTCM08i7Rw8O8UigtjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyvud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 13:02:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77267239591so1860808b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 06:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756818126; x=1757422926;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DI3pErojxmIjWUczxGnCciKcRSBlU9zv3W60qXm0b74=;
 b=T/UaY0IBcXOEaddgOsRtKxkrs3lhoiIpBtt8FjAmJQSgb7RMH7PUF1EcCF67LDXu7e
 yQjVMZNPw0ocAssppu1dY17gmiQ9tpw46fDMqc8sk7A/mBhRKkXuw0hdK2SPbYNQHePe
 Zj3GGDz7oD+oQU14Fm51MBy3IbbEfMDYItmdavW6OuSHOcuxyGCxu0vETJfujd0GbzbL
 RAtN+Wlf3p0+OXZpRZ6B2b0ptJZPb1E45EEt1xMlA6f/bPc7wzxTuHuCe8JKAoM+cB7A
 xPdd8FECObOGEC8U5rBCWYxgYQqsG3UXfM8jJ+BNp6SRwRl6L2gObrZxSPe/SYwsCrNv
 GQqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlImYcu6Mar4kYpwtvAws+Skx1LKU391Cbvcza0atOvrxMt0h6K2noFPBG1mAPqy/wuHglvAlnDCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztsYMFN258eLN4a6yJ3ZXNRJhqOs/zOTxKQxHPpcuuk41X2LhW
 UXg3oTRTEaqXyIx6+MHgt/Ng/Exwh3/2OHux4Vf8qAOoe97VqKhe/uhORo2zJtoFNqTi73hGAQ8
 /dfC+B9Td/zggKg7mulF0q1lNJ70zsXVJ90KCpfMU9HwjoT15GuWpOeja06NQjRp6LdguzJ4=
X-Gm-Gg: ASbGncvdzHCWpx7ZqP5yhF0OP8YTmAFerKPHeHzAB4EUDlldUGvVhgrHeVLSOc79zgt
 nOm6L3+KET5ksPdrOXrFn49fZGDJUk9TQHOeUIaETAXlTjNb7LsFK7O9u869HXTaBNtHt8TX33u
 8YPw9s6tJyH6sDLZtxa4A0WdIG5HZ/553XqQU25fKSjc1m5KeVRGn3ExGLC8fpg22WtdxF2OAts
 HNE5GtN1PYnWEnPXBMMKT6YknmkE5UI0/GaORASMCVcaxf9kcZbEJ9SF9frJDonPizLV+gsB9wE
 pHk7/sLpRZEaKJfK8/15pSGs//+fPKhj44LeVVw1oih1CFMT6lMBsRVZxzq9Q1Hqi7juGKTYrl9
 9flOio8JKOklHV6NdO+TFeXRoJ+DjArqJLsUpOok8LV4FuFgUNTeg
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id
 adf61e73a8af0-243d6f02e27mr13224739637.28.1756818125196; 
 Tue, 02 Sep 2025 06:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr2WgYJlX68yywgyWjPUXsRjYvXEYtyzFO9iJAKUUUIjy9ijeStIweH2qG+cpUesIk7rFkhA==
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id
 adf61e73a8af0-243d6f02e27mr13224650637.28.1756818124529; 
 Tue, 02 Sep 2025 06:02:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827901eesm672660e87.78.2025.09.02.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:02:03 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:02:01 +0300
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
Message-ID: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXxJQ7tkP4Hln7
 edeRhFCQyi/9vK6Ric4trZXjX8QfxUiV4d8lnML2TboXlad+KFn1v0JGe4nTQV+IlHzGIp/g703
 oemMFaeLqL2kczsMDUtCPbe/12Mx3hQjNPUurBvN1RL2Hwvk7Cp0YXwvpV48h5DnHdcKixgmMDV
 cblHZR6WaM52JVZhvwVeyhbgr2WP7Uj4tBzIjfQSmttbwgaH4b2bRYTO2tDNTzdleQ9JvScP3Uj
 pb5wOZVR5w+YgbzqKAvZbTfTpPWoi3OfAomTWeg4v2jvUSalRhjce5u7dTiGbNQUVuEgMyXqn7h
 7Oe3krDHC2kFQX7MP2coyXBUZc8uu7DBNgxQAeQmStSpfqyhPADGyB6nE3qwnxOr4EpDoNNA8th
 O2TL4xK2
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6eacf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=PxnZWOFFpC0IAZjruz4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: d66MLv00CdaVDCy1lLFO2N7s_EJ6Rlia
X-Proofpoint-GUID: d66MLv00CdaVDCy1lLFO2N7s_EJ6Rlia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > During bringup of a new GPU support, it is convenient to have knob to
> > quickly disable GPU, but keep the display support. This helps to
> > fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> > modparam to support this.
> 
> I'm not entirely opposed, but slapping a // in front of the compatible
> in the dt works just as well

Which requires rebuilding and reprovisioning

> 
> Konrad

-- 
With best wishes
Dmitry
