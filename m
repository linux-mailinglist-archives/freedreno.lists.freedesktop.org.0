Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171DC16F1F
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E590C10E66B;
	Tue, 28 Oct 2025 21:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmSI8K4O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac2hbg9V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE54F10E66F
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlpBW2525809
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5bCRTQJFB2jbiTAQ3zVXCAwQ
 bMubibaIIePdt5viwpw=; b=DmSI8K4O+klfJJd0zhAhhLGDaPEn8oddq2IUfYrT
 xMlsqPVmIQlMF6WLM/k/t9He7ORjoZGFZGkMpOPiKXzCAvtUML51/8yFjP/QxoRf
 7dgAAqQ7Y6Xyi+kUcVCO5WjI+x/s8WAZbZQiChB58tmdZy+H6cHhq2ig8GGpFxk6
 GKE72zBgfsEliGBirgDvigZyYWamL/NWuH+iSnay65YEH73ykIyK4FPguQctPjTm
 5P7QMHEMYuwmdKpjBUhi5up5mYwOq69CvYzzwhUKELSiz/Y08U9wZmlYVfUpivD7
 GxQiSUY1/arwbrQOsaE0RzHXJ7d8TlZeLVn9/9d08pCtgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3r7qx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba930d6ecso128001581cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686670; x=1762291470;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5bCRTQJFB2jbiTAQ3zVXCAwQbMubibaIIePdt5viwpw=;
 b=Ac2hbg9Vtp+9hPqb/WQYYa6yXrwdUJLDgl7+m7vKYxa9LbzEkNzjvTf6etuZsB4N0W
 /9unHTEFzpohbOcmfFP1RkQB7wr5rwdI20OIqbZLS3ZH2JyToYpKDYPc3wkoD9S7RReJ
 eq1Oz2Y7fKWXMbZuEB9RekyzQbfsaFOCwAIOur6aEz5wDEJ0nnvtsTtQo/BNB/iSC/Yr
 H9l85TuGc54N6XhN75OKlARNw8x+HM9gt+0vSCkQab0Jf8Zib32eRYcak5Lrfj3MZsMv
 L37Ts2yJbcKeuA7fccQLdHTnnYE8ekT14ctvLTwjfdlfxc3zF3Mz6goPxH3+crvfQm3n
 av3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686670; x=1762291470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bCRTQJFB2jbiTAQ3zVXCAwQbMubibaIIePdt5viwpw=;
 b=TCGeOmp7EumJLJBlboLlTNANYQU78oWOOpMkdn9Fchvv98LYJtNeUeQVX0GbYFa+Lm
 9uaPAe7xZsEFkqrfkGtA0Ce4YZJH0yb9OB70YDWNEbxAmm6cVXbUt+tmjXpIAncz3s9i
 zH6NoUa6f6Gjc6NdmZEulqQ4i9w9HrsRBfVmJvnP4c8SBM0GkUbZSnBYstUV2oCqtkzJ
 sx6S/5AquzoKEYUvRfNUfdid4Lz+h8CTNZLjKK0bOQah+6ae/7iCppwPuyMcjzR162uN
 4jbTYy8DpKnUDMSxjz5qQurDcUSrXgVNjENqqoZJx1OkrmWtnpmSkf/rbfFvYpPhEkxp
 H5hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhWC8/HhnQCPMEJoKPmzcJkCjF30IkcGQWL/THuqIt3uE+b5rZk5cc7paO7YnuCd216l69Znzj1MU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3eVN09L4ZmNesLpK0Ugn33XiyQYFapwFQ6k0+LCcJ79fR75Xk
 OgRALUHZ8EmRr/EeLru8HtSWxKbjrxa2ifgR6HcrGU8X1/mBLv5vux8/UjrfMr4DnA32hy1Z3L9
 c/7aYP/8pHWm+kcwCamlY6OkifkAmPwfQn6KAyNj6/VYszZLapsiJ0yHCvsnAaUorCOMhMco=
X-Gm-Gg: ASbGncvwUeNuc+uET8UOYUAdj0tWtchPJhejJdUKwqGi5UJAwj8jPXtNY9SG8qwXnhH
 ESN7MH5Un+GBl+tKqyVaL8dvAlAzC7OvfmtwxpOLr6czAGXy8KNWSvu/TQzme3O+u5NW/IBI3va
 9JBDVWQsD4TJU+ycj0q46G1sM9NwqUa2prjaWOtjeublephATeRx3sR2cXM5/bO/3dolb0qdNoX
 zxZPOUrAgafgM2eeu3Ht4MCXL3b0ipFTbAo1/1e4KrTxb4dwP76+ztUOaB7++1BqxB2cO/c/CdB
 w6AudprFjlAX/jzohgRMzH5HHUmt29gY0Xnh75n8/tyW/vg99A2y1gRJN51iPZogSvM5BoyFUVy
 xrWbCz57qGHd8EOvtVrHaIZ4BYgOVySL/hwrz4ePqsI1gqFy0VOw2QeadjJA8JV/KreJMSVV5io
 6jqLXiE6lCOiYA
X-Received: by 2002:a05:622a:a10:b0:4e8:a464:1083 with SMTP id
 d75a77b69052e-4ed15bebdd1mr11272901cf.54.1761686670470; 
 Tue, 28 Oct 2025 14:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhLEma2o8DN4JeaTECNRsXH69AeLPm0uhZSZqLEEuM6h5foWAcfY/1Wv1k1KF+xWA3zvGPcw==
X-Received: by 2002:a05:622a:a10:b0:4e8:a464:1083 with SMTP id
 d75a77b69052e-4ed15bebdd1mr11272461cf.54.1761686670038; 
 Tue, 28 Oct 2025 14:24:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59303f54e6fsm2934578e87.94.2025.10.28.14.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:24:29 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:24:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/msm/dpu: Propagate error from
 dpu_assign_plane_resources
Message-ID: <t4muz37yg2n56pdai3rzslunnsgq555yb5hnpnvjwyavtaneyd@7b3eofc5afex>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-2-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-2-40ce5993eeb6@gmail.com>
X-Proofpoint-ORIG-GUID: knb9knJExAbuSooAu5sI8hyXmIsyTDlq
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901348f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1xg4ZLFJ8Ga65Luw_zUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX4o8AKeJIpqql
 z22HOcAKdbp6SxHD6Dzrjg2pR0EN8y/gOAJQgsSjqEwygJmML+WJ1BpOIh3mULmFIbGB9KWV1mC
 KSPTNTQoJbJZxiVlErdNceq5gePLgUyE7/Q8o5afbwPPpqXQz4ZBt1/9z3RHbxGiIcNOdpJpPYq
 PR7dKeOGoq56fVjW31r63I3CO+DaLgwjXQajjp46hRE43HQhPpnnLxhuMkyPLc9SDEZxsnADSD2
 oaUsueixPXbE6gRu/sFDpieJLVyT37dzqdcVdBU+IoyNP4IsmWr1UUI38k1bUSpBXFJLbuMEICA
 GO9gimJw6uwMDcqbQ9fFT3hpVwenTXUsoMSpybb3OL25Q1uhoiBYoKYk8LLgactsPLRlXLwXka3
 BJBPqPGaqEGQ3+EMT2WPvhjnJAFLmQ==
X-Proofpoint-GUID: knb9knJExAbuSooAu5sI8hyXmIsyTDlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:36PM +0000, Vladimir Lypak wrote:
> The dpu_plane_virtual_assign_resources function might fail if there is
> no suitable SSPP(s) for the plane. This leaves sspp field in plane
> state uninitialized and later leads to NULL dereference during commit:
> 
> Call trace:
>  _dpu_crtc_blend_setup+0x194/0x620 [msm] (P)
>  dpu_crtc_atomic_begin+0xe4/0x240 [msm]
>  drm_atomic_helper_commit_planes+0x88/0x358
>  msm_atomic_commit_tail+0x1b4/0x8b8 [msm]
>  commit_tail+0xa8/0x1b0
>  drm_atomic_helper_commit+0x180/0x1a0
>  drm_atomic_commit+0x94/0xe0
>  drm_mode_atomic_ioctl+0xa88/0xd60
>  drm_ioctl_kernel+0xc4/0x138
>  drm_ioctl+0x364/0x4f0
>  __arm64_sys_ioctl+0xac/0x108
>  invoke_syscall.constprop.0+0x48/0x100
>  el0_svc_common.constprop.0+0x40/0xe8
>  do_el0_svc+0x24/0x38
>  el0_svc+0x30/0xe0
>  el0t_64_sync_handler+0xa0/0xe8
>  el0t_64_sync+0x198/0x1a0
> 
> Fixes: 3ed12a3664b3 ("drm/msm/dpu: allow sharing SSPP between planes")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
