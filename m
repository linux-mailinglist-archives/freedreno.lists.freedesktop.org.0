Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD9B180B0
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 13:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37410E837;
	Fri,  1 Aug 2025 11:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dohDivY4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D26E10E838
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 11:06:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57193wbb004992
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 11:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=; b=dohDivY4oMDnATkk
 9f3S5ewE+CnZH6drV6sJiaPFu79g8KwUmK1qSZotlj7Jz6PpXUERiuce7hPYY/0E
 sS4oMIM43AuHQUY9wkgmjUFAoNrxyNQ001t0hhrEvuRTou7AD0uGLLPw5T47nty5
 ZAs1EaEOE50dT7TkJTx5AFYM3nB7RD8CzIZZtoSF2v9GjawdM5N1pNDQ/9BuClr2
 JwzP/xWTJ6v5xrOv3yz7BKLY6SUlrEERx2JD5DXT4Z0AI8oerg7FLDeGpQCUSDjo
 VZIjgx3ye3rXw9eLv+wa/tWoomrd2QkFh1e1zDK3cXC3ji/11SjfaC1Q60mwXjE2
 2Ysz+A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86bwwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:06:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-4fbffa43e85so298614137.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 04:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754046395; x=1754651195;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=;
 b=afuQRWpBwzQHPZ0BWkoGAd2qqAdUC3KHDtx3VfCyhdPS8pgxIRzIQMF3T6dIuTNflF
 RsJ+HQL1O7FYjFrYeOwhwB/jAZjDwKx+evK/VFlSSarpWf77sdzrZjhztEzs8Xf3BpcD
 I1Jwn38mvEPjGwN/D1LKZEcq76ZG8PCQEIykTbivhOosNjQWdWgE744lB9klbBQpmRFz
 9UjYYv9EA+TPwqW1wpsUPeFrHWtUkV50DfWVWfu2jQmF1JXH7dEL65DXfMri5+NyK3B7
 clyhAYaF0Ne/OCwMshtv/qXhO5SlkF+jzjZJ8gXb1CVBseg2Q66zh90DyYsTfSdeGmFY
 akHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIH/s49x6r6XDYYdjUkfgZVJnKg1m2hICbtt2f9BEHRcOLgmHL66jn1rYqFw5/jubXgdRzfWouvdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwScCGxKm9oTin7FwBfqZFixhqxpV+jI0AkYreohD+ru0QTpvib
 Y223vsQnEtk0xRiDItqQl6OoDUwG5F0MGtrrODkQMLpKgYVEb9F3i3oaLEjQ3TRiS7//TOWO3vX
 RL1BDA61cNXXGMEuyPJnqkzlldjdhH6b7uvvf0TIs/UXxH4WrYDygj52xBDm3agfrY5h7ENI=
X-Gm-Gg: ASbGncvYK4mqRw9CMo7aNqIfAO3Syf8MfGhh8KPYgNR++kZl6V5G39X7mho2wQJ79ym
 zXwFZ9c/IXFGQkcP0XHPDpdINpujlfhEez9qXlM1I5ttqXDG0GL8BO2+sPKOgjgg0IDy/n4ClqF
 rdqUkHsx4jhfLEx0AR3pf0o0qwR+ffaUUgxlKZNRvL/sP+IWbjuVvHNWxF/hm9LI1P5gePdJd87
 cFpVPDc5qVNSdUIRHQ8f9xnA/GXXWoR3EhMBYbnbnVRTvOnBM/kmR56YK3fDCu7MMVXUtXIsf/F
 g2ulJJSYhR58xWyiB6d5RpuukzrmvkkeYl7gJ3xVoZ6qZKVNODP6yss/9lWTiXODE/UfggEGDuM
 yi3T014ajdlK3PHzLzhiKGpY3LXoaIfTuvaA25g5Yq0+pR09IiAPT
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-4fbe88fea36mr6776835137.23.1754046395014; 
 Fri, 01 Aug 2025 04:06:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELXu+i98JlBWaD9NFVhCHmgXrDjDlJp2pJeGlNotCFdOuNkns+rDbVOGaCSxMcLE/OBy1MTg==
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-4fbe88fea36mr6776774137.23.1754046394479; 
 Fri, 01 Aug 2025 04:06:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ac767sm537574e87.68.2025.08.01.04.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 04:06:33 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <akxp2lpikvslacz72gvp3ctzdgsrbfnth4ugqfhbxvflmr6ssu@f4ebi3tyz3am>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
 <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
 <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
 <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfXxB293/1Blfl2
 CQ6lTzLQdkbUoE5fMhdFtNvZpzi+jEpzCoybDG2PucGC+EJY4PcMto+Y0ybXeUnq+hE6kdbQ2kq
 HiKtV1UeqG0xDLxV2XRTNRlsHPMs2gZLTQxnLkTpeV5mfAnq+0NqNJaKk7AkpT5jjKdkD8xDTt6
 YawJ8vWHdNhWupIIeik2dJAU9tRlVq3ORl39X4YNqRmhRBwgDPufOLSk1MQ311gJ3cb3IReIZ9d
 mmN0gklNBvAjW9c/xv18tz+B1kcdaJ9DI6nbThikJzPiaijRvq0zzKzyU3IDx8pDU6LvgViJhf7
 kn5UUTSHsbyPbvszYrRVhIXAT0TmiPUUZmlUPwjx97lm1otSsdmO/fhOuCZtOdBgZgqKi85fYNF
 tJ5xhQp34w1N9Crh6AFGISJzvKVWO7f73Z4COptk5H2wPsyHkcs0NQOFNgVwZdrBVusQZ6S8
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688c9fbc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K2Uce_oDiRnA2C7xoV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JL8b8MeO82KzI1KhfK_IuFwEPrTz49De
X-Proofpoint-GUID: JL8b8MeO82KzI1KhfK_IuFwEPrTz49De
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010081
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

On Fri, Aug 01, 2025 at 09:19:41AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年8月1日周五 01:08写道：
> >
> > On 31/07/2025 18:37, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 22:22写道：
> > >>
> > >> On 31/07/2025 13:52, Jun Nie wrote:
> > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 02:52写道：
> > >>>>
> > >>>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> > >>>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> > >>>>> quad-pipe usage scenarios require four pipes and involve configuring
> > >>>>> two stages. In quad-pipe case, the first two pipes share a set of
> > >>>>> mixer configurations and enable multi-rect mode when certain
> > >>>>> conditions are met. The same applies to the subsequent two pipes.
> > >>>>>
> > >>>>> Assign SSPPs to the pipes in each stage using a unified method and
> > >>>>> to loop the stages accordingly.
> > >>>>>
> > >>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >>>>> ---
> > >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
> > >>>>>    1 file changed, 99 insertions(+), 61 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
> > >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >>>>>    }
> > >>>>>
> > >>>>>
> > >>>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
> > >>>>> +                                            struct dpu_sw_pipe **single_pipe,
> > >>>>> +                                            struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > >>>>> +                                            int stage_index)
> > >>>>> +{
> > >>>>> +     int pipe_idx, i, valid_pipe = 0;
> > >>>>> +
> > >>>>> +     for (i = 0; i < PIPES_PER_STAGE; i++) {
> > >>>>
> > >>>> Why do you need to loop here? Is there a case when pipe 0 is not
> > >>>> assigned, but pipe 1 is?
> > >>>
> > >>> Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> > >>> pipes in stage of the current plane, this function will return false.
> > >>> Or you prefer the below coding?
> > >>>
> > >>> 1029         pipe_idx = stage_index * PIPES_PER_STAGE;
> > >>> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
> > >>> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> > >>> 1].src_rect) == 0) {
> > >>
> > >> Yes, this is better from my POV. But the bigger question is why do you
> > >> need it at all? What is wrong with the existing check? Can it be that
> > >> pipe0 is not used, but pipe1 is used?
> > >
> > > There is no case that pipe0 is not used, but pipe1 is used. Existing check
> > > does not filter the plane which contains single pipe in a stage, which can
> > > be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
> > > no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
> > > skipped to be stored in prev_adjacent_plane_state[].
> >
> > Oh, I see, you need to check both pipes because you might need to skip
> > it completely. I'd really prefer to have more explicit code:
> >
> > - check for pipe0, skip this part of the plane if there is none
> > - check for pipe1, if there is none, it's a candidate for sharing.
> 
> Yeah, this is the logic of the current implementation. So the your only
> concern is the loop. Will remove the loop as above code.

Ok.


-- 
With best wishes
Dmitry
