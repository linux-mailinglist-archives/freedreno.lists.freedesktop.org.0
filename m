Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788DC879E9
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 01:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936D10E4D2;
	Wed, 26 Nov 2025 00:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwShmz4q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDg385ym";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB9C10E4CD
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:44:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APE12KQ3707407
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=T1fHIVkW5yM89PGka4iIFJLW
 8HXC1OeKAXa3SyPYZyc=; b=SwShmz4qPTVGRUvNsu5dzhVKztwr3EAqgUKnR0sJ
 rbDzSO2v5ISqzrWmW+q0U2gvEUvfxuoQADVtZ1JQzrmWIqE6Ud7vkLlUAcrAXQUD
 xjAWL51Srsf7L4+AXZ5/EAbumsTmIpnHkhuWDYauyUbD84VL8047ItWumhQOdyh9
 0+7tW0A60IT20GSCQnV7EWFB1AMv1qnbwHF+A+kH5TloB3K3xZ5/mLDnE2BwFK42
 uk4K8KqTBjiMK+ByX/jYFdx8iDAmGqjIk6FSL9VzHq7lFq4Q6U8vHeGG2PJI9L0R
 amnHWb2dNgMK0X42ituar7X3RbH8MxpM7hg3/jB0dPXF0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufskw8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:44:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2dbf4d6a4so533046285a.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 16:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764117879; x=1764722679;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T1fHIVkW5yM89PGka4iIFJLW8HXC1OeKAXa3SyPYZyc=;
 b=PDg385ymSKIngTuUrJhd2Pivp8IYs3jsi7QscSyX+Jez2YvEl02hniBDmXoiqaxTaQ
 oj1NvEb+mRmPhN3SpKx3LZmUnddMhtlIH2poabtNnduVYT/rxijgA0B2xCGgIAMPVGKk
 yKCReT1sNRdczpv2qSmKS2yN22x/XHVUIPiMJiWJdwdRTBYbBPwob9L9tLh9g5OurdMj
 Ct//+jnZwiGZIvLuFmOdkhKtAHoEDyOtlIEDL1LDpbNO8PGzBtSPXZAdugKZim+ajmiU
 siCPDV6qzQrIdfqEpeYboV0FX7ngG3d2vxJ8M6t+gYcEyhczb6oQoBBlnbkP/SHpxOuu
 ESuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764117879; x=1764722679;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1fHIVkW5yM89PGka4iIFJLW8HXC1OeKAXa3SyPYZyc=;
 b=GtDarHmMq8OJfw/fa9dY23ZjRWohlD92da58ZFfs3MZRY3Y9oBQURQrvx/W+GIcQcn
 Ec4syqsDoo8wtA7nAknBfcqLGbChQluYrlgDC/RzYyYgRAau0a3APBEnJPTWYZ6DmLYH
 TIQibGuqphp/BDQWqChugvEHGjAs4ugFZRQjCKHlucW6N+++yUidwRLjj+KaXDz7vpOX
 QOWm/1YhwOprXqWSbyA+t1nOfnnjFNbtz2z37o0AdUDDpT2gmJTFURIioIm1ju7eaKLr
 kAx1ZZEkafvbScc8mvMuWW4c7atq+N7sb8viC4b1/13k3LsVQxVjZf8O4tbzP+WHw4oL
 f2Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ThKL8F2xeW0305IWRJDXSYVdYPOdvS3GhzqFu0ynsd7GunNyJdj8VLO/aNpnAlCIP+hWfxVGRCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfRW730AaxEydtGR06o7d4ZA6hWPXN++AOYbAv46QBul/WuUTx
 is/G7DRwnU92rTCtK/N4uG3S9Hbypybv9QPAlcLiRjwJMoucxpYsR94yosB7Kt2Js/L0ai6fVOS
 Rn1t0ej/gCGyPmAB4MH4H12btPKuSZFXywi9axM0LvO+PI6Gezo7RwLSFmjQZlntsqpQTqzW8tw
 QPfHQ=
X-Gm-Gg: ASbGncvPkFONcTIhgTNeJb7sFtPYTvCeYJurQrbGib6R4/kOB+C2Y99skDuL/0sOcQD
 QA0lzXNCd8Sh2a83KeQzkgbR8Y19rnsIr6u/zvAY99rkEd9IgFQ5oaSnq1/bPF+MfmLXZLXEzfC
 d1iMkIicL6xC/+t3rvK1UtxwGwMbc6oSGQB7Bguw+QmAYT5+GwQ4C33uw+C0am0/0JTdTylxJjI
 3g6Da4SkN2gWz9RNE7paB9l35JhFLcvmyNo3ukQBySiEiSIhAdtKtB09JppHpM1E7uAPhEvtFWY
 /nbtMsLQE4gDK/4WyZlswXIlYWTKXYPWP3jLtnUvJ9fW+yH3is1aS9xIojUPCr+M8HE4+js29jB
 Z08zihCeYhA+GvkYfx6wY08BBZ9LIHGUK/pZaIlwyOTWDIqAb5EgojqBszyjYC6QqazZjWLyBAL
 Xp6tNyf11yjRDShSc7ymArw3A=
X-Received: by 2002:a05:620a:19a5:b0:8b2:db27:425f with SMTP id
 af79cd13be357-8b4ebdae8cbmr637526285a.58.1764117879264; 
 Tue, 25 Nov 2025 16:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETtOV1cliBKp82XUzYr+2GksPDY893Lct7SxLK7/rR3lib4/B6Utjop8rxfuA6fHe7V4KyWQ==
X-Received: by 2002:a05:620a:19a5:b0:8b2:db27:425f with SMTP id
 af79cd13be357-8b4ebdae8cbmr637524585a.58.1764117878871; 
 Tue, 25 Nov 2025 16:44:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8989csm5634850e87.39.2025.11.25.16.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:44:36 -0800 (PST)
Date: Wed, 26 Nov 2025 02:44:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <eou273nqznbew6cmquffzcnwhx4iv6dmfwsyto74w5mcn4pdhy@amgagdf7dz6y>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=69264d78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kpPRz-UtyBwCQlaFug4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMyBTYWx0ZWRfXw9/WRwMrZTxs
 w7c6nm5K/lfENxxPAAuPNcUEkstiD1Bvu/bsM4SRv7dBgFbjiddURHinOt/uDh8SEidDU2VCABW
 mq+I1uky2wVaU0nXBvOsvCVE48hvKMo0CUKBXKsOuqud914mImZZTAveOGQ1lermuD46uiUTLZ/
 BoXTYkkYU+eA84JPzEFK0nlFX4hh2GW/155rx6wbvjrgFdmRGyB4fAXVWje7bAWEhxZky17PgT1
 lr9HOZpLeRwfOJEgyCMK7hFOSn51yHMA/0TfOTTXDbU9I+y+9nKPgAgYzoahX2h8aIqVK1+pOsv
 hwjyQS/uGFUko5g+XpcHPxH4iOwYL5x0cvoX8wIVSlrm1NWPw7IkbNRO1/85m7sF3iF18Svickl
 1q52y992V4WjHMTSeDQJLkfMFYfVUQ==
X-Proofpoint-ORIG-GUID: p_tEqxZdoK7UCh258D84ZRnNTag8djnH
X-Proofpoint-GUID: p_tEqxZdoK7UCh258D84ZRnNTag8djnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260003
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

On Tue, Nov 25, 2025 at 02:37:46PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > state management complexity. This change removes the drm_edid member from
> > 
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages. Please use imperative language instead of describing
> > the changes.
> > 
> > THe patch LGTM.
> > 
> How about this:
> "The cached drm_edid seems unnecessary here. Use the drm_edid pointer
> directly in the plug stage instead of caching it. Remove the cached
> drm_edid and the corresponding oneliner to simplify the code."

SGTM

> 
> > > the panel structure and refactors related functions to use locally read
> > > EDID data instead.
> > > 
> > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > - Cleans up unused drm_edid_free() calls
> > > 
> > > This simplifies EDID handling and avoids stale data issues.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > >   3 files changed, 26 insertions(+), 58 deletions(-)
> > > 
> > 
> 
> 

-- 
With best wishes
Dmitry
