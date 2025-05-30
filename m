Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD61AC92F1
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 18:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78510E0DF;
	Fri, 30 May 2025 16:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmOUYNTC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8297F10E0DF
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 16:05:57 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnxfh017015
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 16:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vyhfcYM3BM8AastlNTmqLFAI
 L5ZyT7xVQ/AliYgV9Ag=; b=MmOUYNTCJOYPwWx3XRLWoM7fXalT2FpW3Qc+Y9nX
 Uq2nD8WWOEql39GzE+gn4o02/qIkoK1KTalNhszHBY5ZcRIbRSIJvdF2y9SRErnj
 nxAUNrmQA/UAxFO/Dy4R4BSWUYgM5H9lz61Uayf0rmRmk0yWkRh+Aja95aTvrEw0
 XpkDQ1PszgUCkcqTotXSXEO+MST0Q08D8ESCDlzhagGAHqI2P+tyNsMOyCVaTGYM
 ktos41Yz0KV83Za99mfqiHUfIMpYtJp8UeKUIwEcFKhh9tkx945W51TMQ3IH4mNe
 9IseNwhQ6pD21p9Uu+FAvYIWjuWxIlRNe6Zw4kS7TNmHDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yrs9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 16:05:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7391d68617cso2606516b3a.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 09:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748621155; x=1749225955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyhfcYM3BM8AastlNTmqLFAIL5ZyT7xVQ/AliYgV9Ag=;
 b=YchZsK5AfxZ30y9oW2iDC6JPoqC7s18Cn9FxIPSRCNsTEpAxZ3WTASGkXZxrk9G8Fj
 0P6fvW4mIFRkLnkJpI2vJnUW34ZPPaKeYu4+78V7hAhYLkwaKsiSFM4KyW7Ya7tI3WhE
 fyJTR0zgrFfDJJGSqv5PWVBqwT6Yg8FjEZbsXD+2BlOtnCUDTjNv8dH9bAegTtZ4Lsia
 RgqiQcQdMOvyWqI4c99+nMVtBYbxsEeWbp/IxKwGHS0bKd48NZ1xr2AClwd2yNG2dmnH
 zzNriaHumXR6frDeBX+eMiIeTSWmuWbcIvvGTF/7ZC8Dz9ZUfYS+6G6QzjYtWhBrT6o5
 +9lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9CNW+ivQe1vAeAlVe5+hGXsMkh5LsFu6rqKCAXXJJq/cCV7l/MjaZ9KjOYe+FLvGUfrj3cftcqT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlR4TTm3D1JijXWsJnBwhf5WE41jxL0lXwYBwKm2PDYiNBKsLQ
 5UKp5NHWCB1NrEIZyYMIb0GZFj/ruGgtb82CqLe1TyvsNmxYObXaVTsLbfqMNGQonhwBDCAjUw1
 lODepcCvch6FleSnRg0D1fIG45e77U5Mu/5LBEVNSVTmLijt1CxDroQGv6DGt4pPPYmjTjmNSIA
 D4Pp6VDPxxSeqnjnsTW6/toVoMrHsBti+6tQFKeibhRFytJRUCygib2w==
X-Gm-Gg: ASbGncswyqyRAOEFx5oS3wwRGMzObtEf7d+Cb+9h+4PkrGndGGdbv4hQlYmdbJoVmkx
 jMBWhlxc/v0c0g0s0Ngmfwjg0MyMfQSCjZUFH9+DU4nAlzHEREJCZrhEoRVIqJg5zGjjYNE9EOD
 2GWtXS0Amk2XOKQmn+9wQT5VXOVA==
X-Received: by 2002:a05:6a00:2d24:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-747bdd85e08mr4988436b3a.7.1748621155480; 
 Fri, 30 May 2025 09:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkV+wYfOcdBbbGjqmaahLgRt731ef7AwmWEuaLDL/DIg0abAlw/5A3m2MgJme4BEGi3KUVodwjTjbUCkAjd/Y=
X-Received: by 2002:a17:90b:4c8c:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-312464539fbmr5323780a91.12.1748621144113; Fri, 30 May 2025
 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:05:32 +0300
X-Gm-Features: AX0GCFv90vzmgIOYELPB5bdyh5tcPCamKQylpnA6_OeHU5ehZhBHvtxjwgstaSo
Message-ID: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MiBTYWx0ZWRfX6M+GbMYPQ9Gk
 X7ZJkm2xjucbV/0Lecr+ESPvegUdkVKmwwhNjcAtUexEBKsTGaJOygcvleZVRofEfodoTjQTcyl
 tiRU4DvYKiSzEIi1fu3F65uPLeHwhLSW3VMjSV9ycvgmf4eE/9sJOALbGoOcyMk5yYcFVvkq6+a
 0Cwo3VKduzHcqI7Flt8UkQdA/d1c2xeWs1TemtvUqGSmIZp1iD5aU56amzDTsZkNL0cfPebK5U+
 RnC3xw+5R4tAQX8lyPjMVmHqPKr6I7U73+BxsrGGONnqAqWlvcF7h1eCZa40dVD70of6E3o94Dd
 D4n4sj/dtBnVI0ujCwjsL+F4gtzjzj4i7HGzHOnRdMqwMwJ/HRhkSzSe28jQsS5/c+cPVXOxeRl
 YO06o7Tfx2x5Y9b2Zq9XlrxWWlso5cHU4nvZiRPGfMjumtDcOEcXHtNT1aRAj3ER+Uu8T9za
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839d765 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=EXqCMmvbh7VItr34RoAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: z5c6MIckqrOJqecAbvo9Lmt_VFsBzY5V
X-Proofpoint-ORIG-GUID: z5c6MIckqrOJqecAbvo9Lmt_VFsBzY5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300142
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

On Fri, 30 May 2025 at 02:15, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
>
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
>
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
>
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
>
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.
>
> ---
> Changes in v2:

The series is not marked as v2 though.

> - Rebased on top of next-20250523
> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>   instead of completely dropping the
>   if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> ---
> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
> change-id: 20241202-hpd_display_off-6051aa510f23
>
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>


--
With best wishes

Dmitry
