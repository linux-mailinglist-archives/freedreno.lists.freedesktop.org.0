Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7944AF8191
	for <lists+freedreno@lfdr.de>; Thu,  3 Jul 2025 21:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF5310E8D2;
	Thu,  3 Jul 2025 19:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRsJwaD4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1410E8C5
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jul 2025 19:47:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DJLn2007736
 for <freedreno@lists.freedesktop.org>; Thu, 3 Jul 2025 19:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kyjs9KtRSFqqWdHu/SnN7ykY
 05Jh3LfVZ1F5/zy/um4=; b=RRsJwaD4JTLFe9in0afKI1Ngl1YV4Ai1WnVCglxl
 jmf4tzEOSUWJtM3sVCUn0xHaEPn17UUXb4Jn89i8W3YfCa7gQSUcbSIyoMLx5nuc
 pqoQlTnGS6AR6OfyHlc5z47Y6QpMZA4WuL60a1tlRsB+b1J9tvL4HUI2pqPUKy7A
 St/p8y5SjWwVFzHE7zQfiPXWn8EoRKK+26Dt8+noAx9uyh3pJ6JoPEdJd5tVZsT3
 1s53SRBsLzqqKvuUWIY6XJa6zyPSpTXJQ8UmnKVo8jn/aZ60i3jZnj8yJAxCfc4i
 ZWhJxVkz7tni9RYBoihlxpkzcWMHiDlxA9YGIE7cdCZK1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw3tw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 19:47:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d22790afd2so26909185a.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 12:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751572029; x=1752176829;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyjs9KtRSFqqWdHu/SnN7ykY05Jh3LfVZ1F5/zy/um4=;
 b=aJRl5ZmT1FVNR35wf4Rvs4//urUn7wmKwZdHpdSqu1HgNlUBEG1l7iectlj0axkR1/
 +y5F/gpkfavcALQSqNT5jaWt+n08SVXeg5usGmj0KKcc+zUcQTYRvcqBroGKwmObtyKJ
 tWkewIARw8lfeo//QARhK1oPOrDpVolTLHNVQYUUU8Aquf7EX4NN91ZyojWnTDI5wfvO
 UGcVAz/6iGEyCKulSvNjMOxIzdrPLQhp4493qaoWhLNXiDVTR2+cSFCDroJIrRCe+BB/
 PXIaUHpU9NR8JSUB7yLxdXhyQ46HGWCdXbLOLSTfTGOh6sJBKvMx/h80FUcFYz+q9kL7
 BR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfIBld2dIjWLf22MHspc2VZxm8LueHPYk0w+cXsHpnVsO+X39TCDtG0gbymTKu03TjcqvH5HKstWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2hSuU2EDtvcFeCkA28BzWeMvh8Cn9KQCLjARi6KfeCobAgQsg
 zi/Jiov5tqhapVOmJUKtqRVJw4llQeIu8kaYLXLscYAOVhgQmi/8RDZZE6JtwHCoZsVqEfR3ra9
 6j86C8E5LdIBacSw7m+UgFCyk4o7QgyqFIDfgFrva8LnWHeMFcjajKVq0MqbGKsf1d5Lr41j4NI
 Dr+ANrm4fR
X-Gm-Gg: ASbGncsqwXWODORVJw+DfqS7iMTo66UlbzyUGgnAxLArRvVXgjVvC9h9rkHgHAuRlTq
 99y/LAkXKa4AeZeT6HdApaO7IaEvPkH+GxkTn/uRqQFCQmBklWwcsa3w3xbg7wwbnGa4jIlroye
 7nOoPeyzB00h3WV64tPOLDi8UPkb/kZJ3dj6H8BlNDm8Rx6wgLDIPDTwqTv/Pp8KkeliLDzRvLE
 uvnvChXaks0NROjiPcIe4QEsfGsXPBy9PppjsUb9FFtvlIXIq1jfm8wu0FAxGmB3mwpDmKGWHpW
 Rd9QYGE/ZoqxJzIvq4hFKgiJ/6FNMuLVdLrF77kFJ0p+TyhDiswaBi4BjRc7f64ukAZ7IVpgUkX
 BFDPFhmKyD3me65kC9SMbP9ekX1TjstqTLS8=
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7d5dcc7603emr30091385a.11.1751572028362; 
 Thu, 03 Jul 2025 12:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj2tRf9bBt4hGhXkfgtHAuEkZL3reD1egDOqsmHrUX4JA7cNn7ybYXWLKFG4hgzOlB5osvWg==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7d5dcc7603emr30088485a.11.1751572027963; 
 Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b141ea0sm391081fa.78.2025.07.03.12.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:47:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Update register xml
Message-ID: <kwexjh3eaxerlfbzpsmd6nim5si6zdjpdthrpzcpakhwmodasl@vosfzxpkehxv>
References: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=6866de3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VrLyofq7WMs6qTrs2fUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX1uHi0Wvrkk0F
 ZGNP+cpMEbN+KxHLR1TEe52OWanf5fws7nzFSh6q4ySDLetTwFT1c2z6GtQrpCgWYL5ycqz4w44
 UHJHvduBkyenu9vzGUUBok22GhH6xk8O3UaE5hidPSSogBbi8cHbDqM+WBBCJWqLeYyn7Nyv9U3
 aSBNkBNvp2g8AEcXCh5b2vN2AzbFKfBBTJzbBrrCS8glICbSBOCpck4IzEmDSHw6OLiDSdLLH9b
 9YzmEJTjSfvY4fbtw0DsxQB4Ixm/RvAVwWkB6ruaIlufiJDqkpqHKW2vbVwHDZYjqEpEu0RFaEU
 uHQXLh6hi0nDQ7JJZrGH1RmBBckwlsTBhhmTJgKUoq8K4T5ZeFAo+gQxUS55XOfX+ZaDxcNTTe/
 UpzTuheK+YjLg0WlYT/ta6sMhQUUgpnnqDw+JMG76vIBSYDWXRuq3MFPmEoTakWcweHtuz0P
X-Proofpoint-GUID: -PFFBF7xBgvSSILXWCpqUtVm7wnVWohw
X-Proofpoint-ORIG-GUID: -PFFBF7xBgvSSILXWCpqUtVm7wnVWohw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163
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

On Thu, Jul 03, 2025 at 10:51:19AM -0700, Rob Clark wrote:
> Sync register xml from mesa commit eb3e0b7164a3 ("freedreno/a6xx: Split
> descriptors out into their own file").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |    5 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |    4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
>  .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h |    4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 3582 +++--------------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  198 +
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  383 ++
>  .../msm/registers/adreno/a6xx_perfcntrs.xml   |  600 +++
>  .../drm/msm/registers/adreno/a7xx_enums.xml   |  223 +
>  .../msm/registers/adreno/a7xx_perfcntrs.xml   | 1030 +++++
>  .../drm/msm/registers/adreno/adreno_pm4.xml   |  302 +-
>  14 files changed, 3312 insertions(+), 3027 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.xml
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
