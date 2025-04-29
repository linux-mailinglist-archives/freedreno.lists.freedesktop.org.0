Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8079EAA0F12
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 16:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82589D63;
	Tue, 29 Apr 2025 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtRl8Ac+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7689864
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA6UWO031801
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J4vapM77cSti5bfb1sVRmOKt
 P/l43U94DBDBHARRk/k=; b=VtRl8Ac+hVPXwWy3/5FThBwnFkxYES1cyFx9j5c5
 hrB2Emh+tAttSdQ+cSoIFI6chbPBLR648bmTBP47f63eENqDm0QBDU4i/XYPRSiT
 v06MrvR57ohjYvmvcb0vwmwCVGIzSPcP6qQhxm3nchPEZVN/5lRUM5VnfNVcQnZQ
 k4ueE1E5Nri70Q8k5o3pDlSVz20AqlCjQPk2qSEp5tvq6qsQ2TCb54u7h5uKIXmg
 a5oObn7EiZ95kkrm/mbYcM3oG2aLymTgEXXX28wPQQQxLl0puKP4CEvEy690RDlt
 ZbYRERWS5C6ftUhef9uRSaBS96mGNu8f2od/7M3eWJETNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5m0y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1211364285a.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937402; x=1746542202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4vapM77cSti5bfb1sVRmOKtP/l43U94DBDBHARRk/k=;
 b=K/AG9YbN1Imw8uD1Gw3uRcyUc4vGg0PEWT7jkyfCsuqZngptPj5UqAJZNQIiEJ9Mr4
 lOcdCFRtLQELpkocS9M/2/hYGwWN27d8KTFmiJ8OXQ1OXgrdg/t0YaRiKxRj4NZWYvia
 X70gDGFsyJZ13aw7bwtt7UoEiwsm45vh65mwtPd9HOz9gNialPlxwIKsXyFdquEq2/B3
 3W/0sBPg0chkTTSW34Hul14M9PAlJs0xQGl4DigstBzXSV7L8Cpo/9cU10U+dw5AxdKb
 FSkHnxXG2dlT2TFR0igqEfB4Dl22HIKMQnk2HhnlyFPT+zRBWhiswy3hbTmu9eT0J1T2
 /5iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHOZgWaGcKO0z3jQq+WR+/P9YsHep6w1W3lG2JW4g7Ni/5+7+MyvjcPpJ9aAb17OuLvEc4bp3DH14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeSLR1MGaa8gMQK7YPOOoIICsnZNH0Za0CvLPN98AACmU2GjiL
 dCXLGa+9yuj4Ayd0Smfxed6iV4QVPJKQBq+njdaSCZeRXxVYn4NSaadHUJF+lLiimCv3D3JlmBu
 uT4unrymB2ssLIF9yYGTeq/b5q+BKFKXfhLlGcSPi3X4XyBGNwpCgFimMY8jqb5bNc64=
X-Gm-Gg: ASbGnctdgrRi01gCq5aAXvKtF9XW+bZwK56l1g0Tt8q7l93hYBiZOWEsyk0jP8H4K7s
 Wa/MVTB/+0mAbjorWPYC8rJitAw9wyokE3AhLJaHldnbHxy7kTxOESHuJ2Uf7Z3rvG5hpo2lkmx
 G7CN15juES89mhjU+lM9wmSxV3OQpSVOme/WxRjjVIX297ZgurOza2FD4Z1SvU+v6SNeKbZ2J2K
 zY1gtCunLpO4bNeu4aZT2Gos68wbU4l9dQb+ReqUpZUqOx3tsHtvtMtt8qMXJ0J0GrlWawHjxVA
 V3Fz9rS8Zur/DLaTM1hpgb+oPjPGxVdIKzIgSvzqy5cd4kJ8IL/o5OQBj7Uh9U2fd67isqi3Axs
 =
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id
 af79cd13be357-7cabddb646cmr566808785a.38.1745937402005; 
 Tue, 29 Apr 2025 07:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlRPDp4nVxPl5jkoeJcUjoMVkueqG9MbxVn9JenlF+X3kyGNQRHfqzf9TZwOykEYT4V2bWQ==
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id
 af79cd13be357-7cabddb646cmr566804385a.38.1745937401635; 
 Tue, 29 Apr 2025 07:36:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a833esm24539771fa.85.2025.04.29.07.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:36:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:36:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Message-ID: <67u334iujxbhkklsy2awxhmionha6b2qxshv4gjvjesudas2ie@6hhn6gxgjyqb>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: akd5h2l0O-ovQsFZA3YqNub-sS1HMKFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOSBTYWx0ZWRfX8p+F2Lz25W49
 kaW8Z6esIsIUYml/698w6O3qN1vkiJQyz5UrYAGM0/I0XpPbva1IdAuawgK5F072xEimnmTGRit
 mertU3fXQxFR5v8/L+rnUYqcWzslCtC1+SMLbF0KI/7q0t4ZHX6Ld7mb7iOMMsHh0qqzKti3k6k
 35lZN0CH84c4HdwJfVSMO59knwHneJyLZuHL6GezPZWg3skaCimeQlSJ1B//h7WRzNyL9lgF7GK
 5DsTKvUvc6RTJWzEu9gcoa1T11sdaiimy94wxp59zZN1kPNs/EiBvanuE1sp6eKBfcCI80oqwbu
 tpejoNdWiyGEy3LoE6yLFHtwhV1N9GgG5FY17sPIMuwQ/nBbvx0veinKjVeaRJ+mAxqC4vQip+J
 xaqsadRGxadXkC0WA5yjwd0k+OysX98aVZAClIODOALV75ItwHkC7Zi83lwsW5Ujbz32mnU7
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810e3fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: akd5h2l0O-ovQsFZA3YqNub-sS1HMKFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=812 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290109
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

On Thu, Apr 10, 2025 at 10:52:21AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
